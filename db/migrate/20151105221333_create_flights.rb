class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :dept_id
      t.integer :arr_id
      t.date :flight_date
      t.string :price
      t.integer :booking_id
      t.time :flight_time

      t.timestamps null: false
    end
  end
end
