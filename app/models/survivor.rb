class Survivor < ApplicationRecord
	belongs_to :inventory, dependent: :destroy
	belongs_to :location, dependent: :destroy
	accepts_nested_attributes_for :inventory, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true


end
