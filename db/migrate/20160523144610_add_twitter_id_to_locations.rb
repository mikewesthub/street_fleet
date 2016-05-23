class AddTwitterIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :twitter_id, :integer
  end
end
