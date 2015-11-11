# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Passenger.delete_all
Booking.delete_all

Airport.delete_all   
lag = Airport.create(city: "LAG", name: "Muritala Mohammed Airport Lagos")
abj = Airport.create(city: "ABJ", name: "Nnamdi Azikiwe Airport Abuja")
phc = Airport.create(city: "PHC", name: "Port Harcourt International Airport")
kad = Airport.create(city: "KAD", name: "Kaduna International Airport")
enu= Airport.create(city: "ENU", name: "Enugu International Airport")


Flight.delete_all


Airport.all.each do |airport1|
  Airport.all.each do |airport2|
    unless airport1 == airport2
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: Time.now, price: $3000)
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: 3.hours.from_now, price: $3000)
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: 6.hours.from_now, price: $3000)
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: 1.day.from_now, price: $3000)
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: (1.day + 6.hours).from_now, price: $3000)
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: 2.days.from_now, price: $3000)
      Flight.create(dept_id: airport1.id, arr_id: airport2.id, flight_date: (2.days + 3.hours).from_now, price: $3000)
    end
  end
end

