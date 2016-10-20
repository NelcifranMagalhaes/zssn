class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :survivor_id
      t.string :item_one
      t.string :item_two
      t.string :item_three
      t.string :item_four
      t.string :timestamps
    end
  end
end
