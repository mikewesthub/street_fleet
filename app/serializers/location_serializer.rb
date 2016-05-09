class LocationSerializer < ActiveModel::Serializer
  attributes :id, :belongs_to, :longitude, :latitude
end
