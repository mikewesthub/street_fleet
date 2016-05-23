class TweetLocationPersistor
  def initialize(tweets, truck_id)
    @tweets = tweets
    @truck_id = truck_id
  end

  def tweets_with_geo
    @tweets.reject { |tweet| tweet.geo_point.nil? }
  end

  def unpersisted_twitter_ids
    Location.where(twitter_id: tweets_with_geo.map { |tweet| tweet.id })
  end

  def persist_locations
    tweets_with_geo.each do |t|
      unless Location.find_by(twitter_id: t.id)
        Location.create!(
          longitude: t.geo_point[0],
          latitude: t.geo_point[1],
          twitter_id: t.id,
          truck_id: @truck_id
        )
      end
    end
  end
end
