class CreateSee < ActiveRecord::Migration[5.0]
  def change
    create_table :sees do |t|
      t.string :name
      t.integer :points
    end
  end
end
