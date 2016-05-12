class Truck < ActiveRecord::Base
  has_many :locations
  belongs_to :user
  validates :name, presence: true

  def most_recent_location
    locations.order(id: :desc).limit(1)
  end
end
