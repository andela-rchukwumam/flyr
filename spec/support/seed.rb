class Seed
  def self.airports
    airports = [
      { name: "Nnamdi Azikwe International Airport, Abuja", city: "Abuja" },
      { name: "Akanu Ibiam International Airport, Enugu", city: "Enugu" },
    ]

    @airlines = ["Arik Air"]
    airports.each { |airport| Airport.create(airport) }
  end

  def self.flights
    1.times do
      forward_rand = Random.rand(2..30)
      flight_time = Random.rand(0..2)
      date = Faker::Time.forward(12, :morning)
      flight = Flight.new
      flight.airline = @airlines.sample
      flight.dept_id = Airport.order("RANDOM()").first.id
      flight.arr_id = Airport.order("RANDOM()").where.not(
        id: flight.dept_id).first.id
      flight.price = Faker::Commerce.price
      flight.departure_date = date
      flight.arrival_date = date + forward_rand.hour
      flight.flight_time = (date + flight_time.hour).strftime("%l:%M %p")
      flight.save!
    end
  end

  def self.booking
    2.times do
      booking = Booking.new
      booking.flight_id = 1
      booking.user_id = 1
      booking.code = Faker::Code.ean
      booking.save
    end
  end
end
