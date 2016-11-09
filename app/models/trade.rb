class Trade < ApplicationRecord


	validates :name_survivor_1,presence: true
	validates :name_survivor_2,presence: true
	validates :item_survivor_1,presence: true
	validates :item_survivor_2,presence: true
	validates :quantidade_survivor_1,presence: true,numericality: true
	validates :quantidade_survivor_2,presence: true,numericality: true
	validate :validatex, on: :create

	def validatex()

		@survivor_one = Survivor.find_by(name: name_survivor_1)
    	@survivor_two = Survivor.find_by(name: name_survivor_2)
    	if !@survivor_one.blank? || !@survivor_two.blank?
    		
    		if @survivor_one.infected or @survivor_two.infected
          	errors.add(:name_survivor_1 , "Guys,one of them is dead,don't trade with him.") 
          	errors.add(:name_survivor_2 , "Guys,one of them is dead,don't trade with him.") 

			end

    	end

	end

end
