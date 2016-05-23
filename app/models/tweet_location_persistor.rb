class TweetLocationPersistor
  def initialize(tweet_array)
    @tweet_array = tweet_array
  end

  def get_geo_tweets
    @tweet_array.reject { |tweet| tweet.geo_point.nil? }
  end
end
