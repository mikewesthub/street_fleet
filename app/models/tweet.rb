class Tweet
  def initialize(tweet)
      @tweet = tweet
  end

  def geo_point
    if @tweet.geo
      @tweet.geo.coordinates.reverse
    elsif @tweet.place
      point = @tweet.place.bounding_box.coordinates[0]
      Geocoder::Calculations.geographic_center(point)
    end
  end
end
