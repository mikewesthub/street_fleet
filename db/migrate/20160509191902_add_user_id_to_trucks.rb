class AddUserIdToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :user_id, :integer
  end
end
