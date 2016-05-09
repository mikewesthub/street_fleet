require 'rails_helper'

RSpec.describe "Trucks", type: :request do
  describe "GET /trucks" do
    it "works! (now write some real specs)" do
      get trucks_path
      expect(response).to have_http_status(200)
    end
  end
end
