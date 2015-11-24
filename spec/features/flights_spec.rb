require "rails_helper"

RSpec.feature "Flights", type: :feature do
  scenario "visit" do
    visit "/"
    expect(page).to have_title "Fly"
    expect(page).to have_css "h1", text: "Search Flights"
  end

    # scenario "search form present on homepage" do
    #   visit "/"
    #   select "12/11/2015", from: "date"
    #   click_button "Search"
    #   expect(page).to have_css("select", text: "From")
    # end
end