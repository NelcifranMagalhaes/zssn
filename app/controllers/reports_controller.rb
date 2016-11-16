class ReportsController < ApplicationController

	def index
		@survivors_i = Survivor.where(infected:  true).count
		@survivors_ni = Survivor.where(infected:  false).count
		@survivors_count =Survivor.all.count

		@water =count_water()
		@food = count_food()
		@medication = count_medication()
		@ammunition = count_ammunition()

	end



	def count_water

		@count_x = 0
		@items = Item.where(name: 'Water')

		@items.each do |x|
			@count_x = @count_x + x.quant
		end

		if @count_x >0
			return @count_x.to_f/@survivors_count
		else
			return -1
		end
	end


	def count_food
		@count_x = 0
		@items = Item.where(name: 'Food')

		@items.each do |x|
			@count_x = @count_x.to_f + x.quant
		end

		if @count_x >0
			return @count_x/@survivors_count
		else
			return -1
		end

	end


	def count_ammunition
		@count_x = 0
		@items = Item.where(name: 'Ammunition')

		@items.each do |x|
			@count_x = @count_x.to_f + x.quant
		end

		if @count_x >0
			return @count_x/@survivors_count
		else
			return -1
		end

	end


	def count_medication
		@count_x = 0
		@items = Item.where(name: 'Medication')

		@items.each do |x|
			@count_x = @count_x.to_f + x.quant
		end

		if @count_x >0
			return @count_x/@survivors_count
		else
			return -1
		end

	end



end

