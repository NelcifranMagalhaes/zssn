class Item < ApplicationRecord
	belongs_to :survivor, optional: true

	validates :name, length: { minimum: 2 } ,presence: true
	validates :quant,presence: true,numericality: true
end
