require 'rails_helper'

RSpec.describe TweetLocationPersistor, type: :model do
  describe "when a array contains a geo_point" do
    let(:fake_tweet_with_geo) { double( :tweet, geo_point: [-77.04248441, 38.90606691])}
    let(:fake_tweet_without_get) { double( :tweet, geo_point: nil)}
    it "will return geo corrdinates" do
      tweet_array = TweetLocationPersistor.new([fake_tweet_with_geo, fake_tweet_without_get])
      expect(tweet_array.get_geo_tweets).to eq [-77.04248441, 38.90606691]
    end
  end
end
