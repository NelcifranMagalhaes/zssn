class Trade < ApplicationRecord


	validates :name_survivor_1, length: { minimum: 2 } ,presence: true
	validates :name_survivor_2, length: { minimum: 2 } ,presence: true
	validates :item_survivor_1, length: { minimum: 2 } ,presence: true
	validates :item_survivor_2, length: { minimum: 2 } ,presence: true
	validates :quantidade_survivor_1,presence: true,numericality: true
	validates :quantidade_survivor_2,presence: true,numericality: true


end
