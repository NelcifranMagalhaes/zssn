class CreateSurvivorsAndTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors_and_trades, id: false do |t|
    	t.belongs_to :survivor, index: true
      	t.belongs_to :trade, index: true
    end
  end
end
