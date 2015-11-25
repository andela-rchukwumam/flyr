require "rails_helper"

RSpec.describe "Routes", type: :routing do
  it "routes root path to pages controller and index action" do
    expect(get("/")).to route_to("flights#index")
  end

  it "routes to flight search" do
    expect(get("/search")).to route_to("flights#search")
  end

  it "routes to show bookings" do
    expect(get("/show_bookings")).to route_to("bookings#show")
  end

  it "routes to new bookings" do
    expect(get("/bookings")).to route_to("bookings#new")
  end

  it "routes to create bookings" do
    expect(get("new_bookings")).to route_to("bookings#create")
  end

  it "routes to login or session new" do
    expect(get("login")).to route_to("sessions#new")
  end

  it "routes to login or session create" do
    expect(post("login")).to route_to("sessions#create")
  end

  it "routes to sign_up" do
    expect(get("signup")).to route_to("users#new")
  end

  it "routes to log_out or session destroy" do
    expect(get("logout")).to route_to("sessions#destroy")
  end

  it "routes to user dashboard" do
    expect(get("/users")).to route_to("users#index")
  end
end
