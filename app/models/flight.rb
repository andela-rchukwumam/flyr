class Flight < ActiveRecord::Base
	belongs_to :departure, class_name: Airport
  	belongs_to :arrival, class_name: Airport

  	has_many :bookings, class_name: Booking, foreign_key: :booking_id
  	has_many :passengers, through: :bookings
end
