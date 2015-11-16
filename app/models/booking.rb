class Booking < ActiveRecord::Base
	belongs_to :flight
  	has_many :passengers, dependent: :destroy

  	accepts_nested_attributes_for :passengers, reject_if: :all_blank, allow_destroy: true
     # validates :flight_id, presence: true
     # validates :passengers, presence: true
end
