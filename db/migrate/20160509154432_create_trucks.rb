class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :twitter
      t.string :email
      t.string :phone_1
      t.string :phone_2
      t.string :website

      t.timestamps null: false
    end
  end
end
