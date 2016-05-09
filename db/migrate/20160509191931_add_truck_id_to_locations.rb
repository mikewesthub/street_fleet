class AddTruckIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :truck_id, :integer
  end
end
