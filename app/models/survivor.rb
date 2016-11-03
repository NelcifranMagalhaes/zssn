class Survivor < ApplicationRecord
	
	has_many :items, dependent: :destroy
	has_one :location, dependent: :destroy
	has_and_belongs_to_many :trade, optional: true
	
	accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true

	validates :name, length: { minimum: 2 } ,presence: true
	validates :age ,presence: true
	validates :gender,presence: true
	before_validation :validandoOsItens

	def validandoOsItens
		if self.items.find_by(name: "uva")
			
			errors[:base] << 'nem tem essa fruta'
			
	end

	end

end
