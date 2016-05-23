class Truck < ActiveRecord::Base
  has_many :locations
  belongs_to :user
  validates :name, presence: true

  def most_recent_location
    locations.order(id: :desc).limit(1)
  end

  def tweets
    tweets = StreetTwitter.new.tweets_for_handle(twitter)[0..9]
    TweetLocationPersistor.new(tweets, id).persist_locations
    tweets
  end
end
