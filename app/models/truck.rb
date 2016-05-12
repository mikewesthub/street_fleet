class Truck < ActiveRecord::Base
  has_many :locations
  belongs_to :user
  validates :name, presence: true
end
