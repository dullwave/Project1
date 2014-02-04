class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.text :city
      t.text :state
      t.integer :zip

      t.timestamps
    end
  end
end
