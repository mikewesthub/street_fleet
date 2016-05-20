require 'rails_helper'

RSpec.describe StreetTwitter, type: :model do
  it "shows that the client can be accessed" do
    street_tweet = StreetTwitter.new
    client_object = street_tweet.client
    expect(client_object).to be_a(Twitter::REST::Client)
  end

  it "responds to home_timeline method with an array of tweets" do
    street_tweet = StreetTwitter.new
    tweets_for_handle = street_tweet.home_tweets
    expect(tweets_for_handle.first).to be_a(Twitter::Tweet)
  end

  it "responds to tweets_for_handle with tweets for a specific truck" do
    street_tweet = StreetTwitter.new
    individual_tweets = street_tweet.tweets_for_handle("ChixNStixDC")
    expect(individual_tweets.first).to be_a(TweetDecorator)
  end
end
