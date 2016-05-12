class Location < ActiveRecord::Base
  belongs_to :truck
  validates :longitude, presence: true
  validates :latitude, presence: true
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode 
end
