class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :survivor_id
      t.string :integer

      t.timestamps
    end
  end
end
