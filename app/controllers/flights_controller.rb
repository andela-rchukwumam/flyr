class FlightsController < ApplicationController
	def index
	    @flight = Flight.new

	    @airports = Airport.all.map { |airport| [airport.city, airport.name] }
	    @dates = Flight.order("flight_date asc").all.map { |flight| [flight.flight_date.strftime("%d/%m/%Y")] }.uniq
	    @passengers = [1, 2, 3, 4]


	    if !params[:flight].nil?
	      @from = params[:flight][:dept_id]
	      @to = params[:flight][:arr_id]
	      @date = params[:flight][:flight_date]
	      @passengers_select = params[:flight][:passengers]
	      @flights = Flight.search(@from, @to, @date)

	      respond_to do |format|
	        format.html
	        format.js
	      end
	    end
	end

	def about
		
	end

	def contact
		
	end

	def terms
		
	end
end
