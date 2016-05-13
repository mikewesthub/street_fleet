class Location < ActiveRecord::Base
  belongs_to :truck
  belongs_to :user
  validates :longitude, presence: true
  validates :latitude, presence: true
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: :should_geocode?

  def should_geocode?
    return false if Rails.env.test?
    latitude? && longitude? || latitude_changed? && longitude_changed?
  end
end
