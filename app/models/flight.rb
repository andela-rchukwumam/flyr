class Flight < ActiveRecord::Base
  belongs_to :departure, class_name: Airport, foreign_key: :dept_id
  belongs_to :arrival, class_name: Airport, foreign_key: :arr_id

  has_many :bookings, class_name: Booking, foreign_key: :booking_id
  has_many :passengers, through: :bookings

  validates :departure, presence: true
  validates :arrival, presence: true

  accepts_nested_attributes_for :passengers
  accepts_nested_attributes_for :bookings
end
