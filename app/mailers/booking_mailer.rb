class BookingMailer < ApplicationMailer
  def booking_info(current_user, booking, passenger)
    @booking = booking
    @name = current_user.name
    @email = current_user.email

    if @email
      mail(to: @email, subject: "Your Booking Information")
    else
      mail(to: "ruth.chukwumam@andela.com", subject: "Your Booking Information")
    end
  end

  def passenger_info(booking, passenger)
    @booking = booking
    @name = passenger.first[1][:name]
    @email = passenger.first[1][:email]

    if @email
      mail(to: @email, subject: "Your Booking Information")
    else
      mail(to: "ruth.chukwumam@andela.com", subject: "Your Booking Information")
    end
  end
end
