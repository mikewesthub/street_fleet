require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "when a place is given" do
    let(:fake_bounding_box) do
      double(:bounding_box,
        type: 'Polygon',
        coordinates:
        [
          [
            [-77.119401, 38.801826],
            [-76.909396, 38.801826],
            [-76.909396, 38.9953797],
            [-77.119401, 38.9953797]
          ]
        ]
       )
    end

    let(:fake_place) { double( :place,bounding_box: fake_bounding_box )}
    let(:fake_tweet) { double(:tweet, geo: nil, place: fake_place) }

    it 'returns coordinates if place is present' do
      expect(Tweet.new(fake_tweet).geo_point).to eq [-77.01441639593564, 38.89860285]
    end
  end

  describe "when a geo is given" do

    let(:fake_geo) { double( :geo, coordinates: [38.90606691, -77.04248441] )}
    let(:fake_tweet) { double( :tweet, geo: fake_geo, place: nil) }

    it 'returns coordinates if place is present' do
      expect(Tweet.new(fake_tweet).geo_point).to eq [-77.04248441, 38.90606691]
    end

  end



  # {:type=>"Point", :coordinates=>[38.90606691, -77.04248441]}
end
