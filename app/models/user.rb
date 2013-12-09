class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation
  
  before_save :encrypt_password
  before_create { generate_token(:auth_token) }

  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
 def generate_token(column)  
    begin  
      self [column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self [column])
  end
 
  def self.authenticate(email, password)
    user = find_by_email(email)
# SELECT "users".* FROM "users" WHERE "users"."email" = 'ravi@gmail.com' LIMIT 1
#<User id: 13, email: "ravi@gmail.com", password_hash: "$2a$10$KAJQl17cDMr3tn0xzQ1FeuED1t14QLSTtD.NMskoTtgT...", 
# password_salt: "$2a$10$KAJQl17cDMr3tn0xzQ1Feu", created_at: "2013-11-26 05:36:00", 
# updated_at: "2013-11-26 05:36:00", auth_token: "uDkVkeTIHbzozjAAYwovKQ", 
# password_reset_token: nil, password_reset_sent_at: nil> 

  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
     
    else
      nil
    end
  end

def encrypt_password
  if password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end

def send_password_reset  
  generate_token(:password_reset_token)  
  self.password_reset_sent_at = Time.zone.now 
  save!  
  UserMailer.password_reset(self).deliver  
end 
end