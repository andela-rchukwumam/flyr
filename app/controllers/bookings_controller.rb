class BookingsController < ApplicationController
	 	def new
	 	end

	  def create
	  end

	  def show
	  end

	  private

	  def whitelist_params
	    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  	end
end
