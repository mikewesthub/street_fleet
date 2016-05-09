require "rails_helper"

RSpec.describe TrucksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trucks").to route_to("trucks#index")
    end

    it "routes to #new" do
      expect(:get => "/trucks/new").to route_to("trucks#new")
    end

    it "routes to #show" do
      expect(:get => "/trucks/1").to route_to("trucks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trucks/1/edit").to route_to("trucks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trucks").to route_to("trucks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/trucks/1").to route_to("trucks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/trucks/1").to route_to("trucks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trucks/1").to route_to("trucks#destroy", :id => "1")
    end

  end
end
