class Survivor < ApplicationRecord
	
	has_many :items, dependent: :destroy
	has_one :location, dependent: :destroy
	accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true

	validates :name, length: { minimum: 2 } ,presence: true
	validates :age ,presence: true
	validates :gender,presence: true


end
