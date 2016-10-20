class Survivor < ApplicationRecord
	has_one :inventory, dependent: :destroy
	has_one :location, dependent: :destroy
	accepts_nested_attributes_for :inventory, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true
end
