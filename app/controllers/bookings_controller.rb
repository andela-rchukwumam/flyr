class BookingsController < ApplicationController
	def new
		@flights = Flight.where(id:params[:flight_id])
	end

	def create
		@booking = Booking.new(booking_params)
	end

	def show
		@booking = Booking.find(params[:id])
	end

	  private

	 def booking_params
	    	params.require(:booking).permit(:flight_id, :departure, :arrival, :departure_date, :passengers, 
	    										passengers_attributes: [:name, :email])
  	end
end
