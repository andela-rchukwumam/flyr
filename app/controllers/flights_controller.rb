class FlightsController < ApplicationController
  include ActionController::Live
  def index
    @flight = Flight.new
    @airports = Airport.all.map { |airport| [airport.city, airport.id] }
    session["airports"] = @airports
    @dates = Flight.order("departure_date asc").all.map { |flight| [flight.departure_date.strftime("%d/%m/%Y")] }.uniq

    session["dates"] = @dates
    @passengers = [1, 2, 3, 4]
    session["passengers"] = @passengers
  end

  def create
    @flight = Flight.new(flight_params)
    @dept_id = params[:dept_id].to_i
    @arr_id = params[:arr_id].to_i
    @departure_date = (params[:departure_date])
    @arrival_date = (params[:arrival_date])
    @airline = (params[:airline])
    if @flight.save
      respond_to do |format|
       format.html { render :create }
       format.js {}
     end
   end
  end

  def show
    @flight = Flight.all
      respond_to do |format|
      format.html { render :all_flights }
      format.js {}
    end
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

  private
    def flight_params
    params.permit(
      :dept_id,
      :arr_id,
      :departure_date,
      :arrival_date,
      :airline,
      :flight_time,
      :price
    )
  end
end
