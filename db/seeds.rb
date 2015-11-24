# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

Passenger.delete_all
Booking.delete_all
Airport.delete_all   

airports = [
  { name: "Nnamdi Azikwe International Airport, Abuja", city: "Abuja"},
  { name: "Akanu Ibiam International Airport, Enugu", city: "Enugu"},
  { name: "Alakia Airport, Ibadan", city: "Ibadan" },
  { name: "Arakale Airport, Akure", city: "Akure" },
  { name: "Mallam Aminu Kano International Airport, Kano", city: "Kano"},
  { name: "Murtala Muhammed International Airport, Lagos", city: "Lagos" },
  { name: "Port Harcourt International Airport, Port Harcourt", city: "Port Harcourt"},
  { name: "Sir Abubakar Tafawa Balewa Airport, Bauchi", city: "Bauchi"},
  { name: "Margaret Ekpo International Airport, Calabar", city: "Calabar"},
  { name: "Yakubu Gowon Airport, Jos", city: "Jos" },
  { name: "Kaduna Airport, Kaduna", city: "Kaduna" },
  { name: "Maiduguri International Airport, Borno", city: "Borno" },
  { name: "Sadiq Abubakar III International Airport, Sokoto", city: "Sokoto" },
  { name: "Yola Airport, Yola", city: "Yola" }
]

Flight.delete_all

airlines = ["Villagers Air", "Arik Air", "Dana Air", "Andela Air",
  "Sosoliso Air", "Nigerian Airways", "Aero Contractors", "Kuvokiland Airlines",
  "Ikem Air", "Adeybee Air", "Comet Aviation", "Galaxy Skylines", "Workdey Air",
  "K-S Air", "Arnold Air", "Edo Airways", "Night Crawlers", "TIA Liners",
  "Peak Flyers"]

airports.each do |airport|
  Airport.create(airport)
end

2000.times{
  forward_rand = Random.rand(2..30)
  flight_time = Random.rand(0..2)
  date = Faker::Time.forward(12, :morning)
  flight = Flight.new
  flight.airline = airlines.sample
  flight.dept_id = Airport.order("RANDOM()").first.id
  flight.arr_id = Airport.order("RANDOM()").where.not(id: flight.dept_id).first.id
  flight.price = Faker::Commerce.price
  flight.departure_date = date
  flight.arrival_date = date + forward_rand.hour
  flight.flight_time = (date + flight_time.hour).strftime("%l:%M %p")
  flight.save!
}