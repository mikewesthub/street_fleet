require 'twitter'

class StreetTwitter
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.oauth_token = ENV["TWITTER_ACCESS_TOKEN"]
      config.oauth_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
end
