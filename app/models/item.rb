class Item < ApplicationRecord
	belongs_to :survivor


	validates :name, length: { minimum: 2 } ,presence: true
end
