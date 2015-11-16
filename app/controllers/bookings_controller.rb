class BookingsController < ApplicationController
	before_action :set_booking, only: [:show, :edit, :update, :destroy]
	def new
		@flights = Flight.where(id: params[:flight_id])
		@booking = Booking.new(set_booking_params)
		# @booking.user = current_user if current_user
	end

	def create
		@booking = Booking.new(booking_params)
		
		respond_to do |format|
		     if @booking.save
		       	format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
		        	format.json { render :show, status: :created, location: @booking }
		     else
		        	format.html { render :new }
		        	format.json { render json: @booking.errors, status: :unprocessable_entity }
		     end
		end
	end

	def show
		binding.pry
		@booking = Booking.find(params[:id])
		@passenger = Passenger.where(booking_id: @booking.id)
	end

	def update
    		respond_to do |format|
	     	 	if @booking.update(booking_params)
	        		format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
	        		format.json { render :show, status: :ok, location: @booking }
	      	else
	        		format.html { render :edit }
	        		format.json { render json: @booking.errors, status: :unprocessable_entity }
	      	end
    		end
  	end

	def destroy
	    	@booking.destroy
	    	respond_to do |format|
	      	format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
	      	format.json { head :no_content }
	    	end
	end
	private
	def set_booking
      	@booking = Booking.find(params[:id])
    	end

	def booking_params
	    	params.require(:booking).permit(:flight_id, :user_id,
	    					passengers_attributes: [:name, :email])
  	end

  	def set_booking_params
  		params.permit(:flight_id, :user_id)
	end
end
