class ChangeTimeToString < ActiveRecord::Migration
  def change
  		change_column :flights, :flight_time, :string
  end
end
