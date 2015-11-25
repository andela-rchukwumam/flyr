require "rails_helper"

RSpec.feature "Flights", type: :feature do
  before(:each) do
    load "#{Rails.root}/spec/support/seed.rb"
  end
  before(:each) do
    Seed.airports
    Seed.flights
  end
  scenario "visit" do
    visit "/"
    expect(page).to have_title "Fly"
    expect(page).to have_css "h1", text: "Search Flights"
  end

  scenario "Search for flight with date" do
    visit "/"
    flight = Flight.last
    select flight.departure.city, from: "from"
    select flight.arrival.city, from: "to"
    select flight.departure_date.strftime("%d/%m/%Y"), from: "date"
    click_on "Search"
    expect(page).to have_content "Select Flight"
  end
  scenario "Get Flight Details" do
    visit "/"
    flight = Flight.last
    select flight.departure.city, from: "from"
    select flight.arrival.city, from: "to"
    select flight.departure_date.strftime("%d/%m/%Y"), from: "date"
    click_on "Search"
    click_on "Select Flight"
    expect(page).to have_content "Flight Details"
  end
  scenario "Get Booking Details" do
    visit "/"
    flight = Flight.last
    select flight.departure.city, from: "from"
    select flight.arrival.city, from: "to"
    select flight.departure_date.strftime("%d/%m/%Y"), from: "date"
    select "1", from: "passengers"
    click_on "Search"
    click_on "Select Flight"
    fill_in("booking_passengers_attributes_0_name", with: "Ruth")
    fill_in("booking_passengers_attributes_0_email", with: "ruth.chukwumam@andela.com")
    click_on "Book Flight"
    expect(page).to have_content "Booking Details"
  end
end
