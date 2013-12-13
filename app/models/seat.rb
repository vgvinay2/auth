class Seat < ActiveRecord::Base
  validates_presence_of :flight_id 
  validates_presence_of :name
  validates_presence_of :baggage
end
