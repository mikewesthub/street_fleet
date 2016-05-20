class TweetDecorator < SimpleDelegator
  def geo_point
    if tweet.geo
      tweet.geo.coordinates.reverse
    elsif tweet.place
      point = tweet.place.bounding_box.coordinates[0]
      Geocoder::Calculations.geographic_center(point)
    end
  end

  def tweet
    __getobj__
  end
end
