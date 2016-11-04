class CreateTrade < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
    	t.string :name_survivor_1
		t.string :name_survivor_2
		t.string :item_survivor_1
		t.string :item_survivor_2
		t.string :quantidade_survivor_1
		t.string :quantidade_survivor_2
    end
  end
end
