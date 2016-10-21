class Location < ApplicationRecord
	belongs_to :survivor

	validates :longitude ,presence: true
	validates :latitude,presence: true

end
