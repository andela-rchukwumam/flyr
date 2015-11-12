class AddDeptDateToFlightTable < ActiveRecord::Migration
  def change
  	rename_column :flights, :flight_date, :departure_date
  	add_column  :flights, :arrival_date, :date
  end
end
