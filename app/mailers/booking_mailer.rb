class BookingMailer < ApplicationMailer

    def booking_info(current_user, booking, passenger)
      # binding.pry
        @booking = booking
        @name = current_user.name
        # @flight_id = session[:booking].flight_id
        @email = current_user.email

        if @email
          mail( to: @email, subject: "Your Booking Information")
        else
          mail( to: "ruth.chukwumam@andela.com", subject: "Your Booking Information")
        end
  end
end
