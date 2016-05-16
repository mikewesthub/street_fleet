require 'rails_helper'

RSpec.describe StreetTwitter, type: :model do
  it "shows that the client can be accessed" do
    street_tweet = StreetTwitter.new
    client_object = street_tweet.client
    expect(client_object).to be_a(Twitter::REST::Client)
  end

  it "responds to home_timeline method with an array of tweets" do
    street_tweet = StreetTwitter.new
    truck_tweets = street_tweet.home_tweets
    expect(truck_tweets.first).to be_a(Twitter::Tweet)
  end

  it "responds to truck_tweets with tweets for a specific truck" do
  end
end
