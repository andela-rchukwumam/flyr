require "rails_helper"

RSpec.feature "Flights", type: :feature do
    # before do
    #   Capybara.default_driver = :selenium
    #   OmniAuth.config.test_mode = true
    # end
  scenario "visit" do
    visit "/"
    expect(page).to have_title "Fly"
    expect(page).to have_css "h1", text: "Search Flights"
  end

    # scenario "search form present on homepage" do
    #   visit "/"
    #   select ""
    #   click_button "Search"
    #   expect(page).to have_css("select", text: "Select Departure Airport")
    # end
end