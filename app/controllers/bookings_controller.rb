class BookingsController < ApplicationController
	def new
		@flights = Flight.where(id:params[:flight_id])
	end

	def create
	end

	def show
	end

	  private

	 def whitelist_params
	    	params.require(:booking).permit(:flight_id, :departure, :arrival, :departure_date, :passengers, 
	    										passengers_attributes: [:name, :email])
  	end
end
