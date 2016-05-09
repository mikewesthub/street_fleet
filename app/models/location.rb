class Location < ActiveRecord::Base
  belongs_to :truck
  validates :longitude, presence: true
  validates :latitude, presence: true
end
