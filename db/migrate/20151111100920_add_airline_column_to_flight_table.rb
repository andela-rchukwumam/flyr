class AddAirlineColumnToFlightTable < ActiveRecord::Migration
  def change
  	add_column :flights, :airline, :string
  end
end
