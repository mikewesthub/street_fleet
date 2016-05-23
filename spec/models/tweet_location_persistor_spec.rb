require 'rails_helper'

RSpec.describe TweetLocationPersistor, type: :model do
  subject do
    described_class.new(
      [fake_tweet_with_geo, fake_tweet_without_get],
      1)
  end

  let(:fake_tweet_with_geo) do
    double(:tweet, geo_point: [-77.04248441, 38.90606691], id: 1)
  end

  let(:fake_tweet_without_get) do
    double(:tweet, geo_point: nil, id: 2)
  end

  it 'will return geo corrdinates' do
    expect(subject.tweets_with_geo).to be_a Array
  end

  it 'will persist a location when called' do
    expect(Location).to receive(:create!).with(
      longitude: -77.04248441,
      latitude: 38.90606691,
      twitter_id: 1,
      truck_id: 1
    )
    subject.persist_locations
  end
end
