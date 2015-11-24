require "rails_helper"

RSpec.describe FlightsController, type: :controller do
  context "GET index" do
    before do
      get :index
    end
    it "responds with index template when it is invoked" do
      expect(response).to render_template(:index)
    end
  end
end
