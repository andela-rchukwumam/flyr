class Booking < ActiveRecord::Base
	belongs_to :flight
  	has_many :passengers, dependent: :destroy

  	accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes| attributes["name"].blank? || attributes["email"].blank? }
     validates :flight_id, presence: true
     # validates :no_of_passengers, presence: true
end
