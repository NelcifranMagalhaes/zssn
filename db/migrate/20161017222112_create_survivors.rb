class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.boolean :infected
      t.integer :trade_id

      t.timestamps
    end
  end
end
