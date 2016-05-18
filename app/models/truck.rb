class Truck < ActiveRecord::Base
  has_many :locations
  belongs_to :user
  validates :name, presence: true

  def most_recent_location
    locations.order(id: :desc).limit(1)
  end

  def tweets
    StreetTwitter.new.truck_tweets(twitter)[0..9]
  end
end
