require 'twitter'

class StreetTwitter
  attr_reader :client, :home_tweets

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end

  def home_tweets
    Rails.cache.fetch("twitter_truck_index", expires_in: 30.minutes.from_now) do
      client.home_timeline[0..19]
    end
  end

  def truck_tweets(handle)
    Rails.cache.fetch("twitter_truck_index", expires_in: 30.minutes.from_now) do
      client.user_timeline("#{handle}")[0..4]
    end  
  end
end
