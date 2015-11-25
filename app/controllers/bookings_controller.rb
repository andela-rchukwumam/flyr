class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    num_of_passenger = params[:passengers]
    num_of_passenger.to_i.times do
      @booking.passengers.new
    end
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        session[:booking] = @booking
        if current_user
          BookingMailer.booking_info(
            current_user,
            @booking,
            params[:booking][:passengers_attributes]
          ).deliver
        end

        format.html { redirect_to @booking, notice: "Booking was successful." }
        format.json { render :show, status: :created, location: @booking }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @passenger = Passenger.where(booking_id: @booking.id)
  end

  def pay_for_ticket
    booking = Booking.find(params[:id])
    redirect_to Booking.paypal_url(
      paypal_path,
      params[:id],
      params[:cost],
      params[:passengers]
    )
  end

  def payment
    render "bookings/payment"
  end

  def past_bookings
    @bookings = current_user.bookings
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      :user_id,
      passengers_attributes: [:name, :email]
    )
  end
end
