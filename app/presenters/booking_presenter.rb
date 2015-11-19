class BookingPresenter < SimpleDelegator

  def self.paypal_url(root_path, id, cost, passenger)

    values = {
        business: "merchant@ruth-flyapp.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        amount: cost / passenger
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end