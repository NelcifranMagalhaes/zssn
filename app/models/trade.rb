class Trade < ApplicationRecord

	validates :name_survivor_1,presence: true
	validates :name_survivor_2,presence: true
	validates :item_survivor_1,presence: true
	validates :item_survivor_2,presence: true
	validates :quantidade_survivor_1,presence: true,numericality: true
	validates :quantidade_survivor_2,presence: true,numericality: true
	validate :validate_infected, on: :create
	validate :validate_pontos_items, on: :create
	validate :validate_check_item, on: :create

	#@survivor_one = Survivor.find_by(name: :name_survivor_1)
	#@survivor_two = Survivor.find_by(name: :name_survivor_2)


	def validate_infected()
		@survivor_one = Survivor.find_by(id: :name_survivor_1)
		@survivor_two = Survivor.find_by(id: :name_survivor_2)

    	if !@survivor_one.blank? || !@survivor_two.blank?
    		
    		if @survivor_one.infected or @survivor_two.infected
          	errors.add(:name_survivor_1 , "Guys,one of them is dead,don't trade with him.") 
          	errors.add(:name_survivor_2 , "Guys,one of them is dead,don't trade with him.") 

			end

    	end

	end



	def validate_pontos_items()

		@survivor_one = Survivor.find_by(id: :name_survivor_1)
		@survivor_two = Survivor.find_by(id: :name_survivor_2)

		if !@survivor_one.blank? || !@survivor_two.blank?
			
	 	@item_one = @survivor_one.items.find_by(id: item_survivor_1)
	    @item_two = @survivor_two.items.find_by(id: item_survivor_2)

	    @quantidade_survivor_1_tela = Integer(quantidade_survivor_1)
	    @quantidade_survivor_2_tela = Integer(quantidade_survivor_2)
	   

		@pontos_item_one = @quantidade_survivor_1_tela * See.find_by(name: @item_one.name).points
		@pontos_item_two = @quantidade_survivor_2_tela * See.find_by(name: @item_two.name).points

		if @pontos_item_one != @pontos_item_two

			errors.add(:item_survivor_1 , "The trade items should be equivalent.") 

			errors.add(:item_survivor_2 , "The trade items should be equivalent.") 

		end	

		end

	end



	def validate_check_item()

		 #Achando os caras que sao selecionados na tela  
	    @survivor_one = Survivor.find_by(id: :name_survivor_1)
	    @survivor_two = Survivor.find_by(id: :name_survivor_2)
	    
		if !@survivor_one.blank? || !@survivor_two.blank?


		    #o nome dos itens que vem da tela,eles veem com o id da tabela See
		    @item_tela_1 = See.find_by(id: item_survivor_1)
		    @item_tela_2 = See.find_by(id: item_survivor_2)

		    #pego o nome dos itens da tela e verifico se tem na lista de itens do survivor
		    @item_one = @survivor_one.items.find_by(name: @item_tela_1.name)
		    @item_two = @survivor_two.items.find_by(name: @item_tela_2.name)

		    if @item_one.blank? 
		    	
		    	errors.add(:item_survivor_1 , survivor_one.name + "d'ont have this item!") 

		    end

		   	if @item_two.blank? 
		    	
		    	errors.add(:item_survivor_2 , survivor_two.name + "d'ont have this item!") 

		    end
		end

	end


end


