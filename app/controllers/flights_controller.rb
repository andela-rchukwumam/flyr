class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |airport| [airport.city, airport.id] }
    session["airports"] = @airports
    @dates = Flight.order("departure_date asc").all.map { |flight| [flight.departure_date.strftime("%d/%m/%Y")] }.uniq

    session["dates"] = @dates
    @passengers = [1, 2, 3, 4]
    session["passengers"] = @passengers
  end

  def search
    @from = params[:from].to_i
    @to = params[:to].to_i
    @date = Date.parse(params[:date])
    @passengers_select = params[:passengers]
    @flights = Flight.where(arr_id: @to, dept_id: @from, departure_date: @date)
    respond_to do |format|
      format.html { render :index }
      format.js {}
    end
  end
end
