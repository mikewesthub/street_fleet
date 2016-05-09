class TruckSerializer < ActiveModel::Serializer
  attributes :id, :name, :twitter, :email, :phone_1, :phone_2, :website
end
