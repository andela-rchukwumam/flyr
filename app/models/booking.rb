class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :passengers, reject_if: :all_blank, allow_destroy: true
  def self.paypal_url(paypal_path, _id, cost, passenger)
    values = {
                  business: "merchant@ruth-flyapp.com",
                  cmd: "_xclick",
                  upload: 1,
                  return: "#{Rails.application.secrets.app_host}#{paypal_path}",
                  amount: cost.to_f * passenger.to_f
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
