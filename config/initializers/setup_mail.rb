ActionMailer::Base.smtp_settings = 
{
  :address               => "mail.kreatio.com",
  :domain                => "www.kreatio.com",
  :port                  => 25,
  :enable_starttls_auto  => true
}