class AddTwitterIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :twitter_id, :string
    add_index :locations, :twitter_id
  end
end
