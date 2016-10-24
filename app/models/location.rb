class Location < ApplicationRecord
	belongs_to :survivor, optional: true

	validates :longitude ,presence: true
	validates :latitude,presence: true

end
