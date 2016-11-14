class Trade < ApplicationRecord

	validates :name_survivor_1,presence: true
	validates :name_survivor_2,presence: true
	validates :item_survivor_1,presence: true
	validates :item_survivor_2,presence: true
	validates :quantidade_survivor_1,presence: true,numericality: true
	validates :quantidade_survivor_2,presence: true,numericality: true
	validate :validate_infected,:validate_check_items,:validate_pontos_items

	#@survivor_one = Survivor.find_by(name: :name_survivor_1)
	#@survivor_two = Survivor.find_by(name: :name_survivor_2)


	def validate_infected
		@survivor_one = Survivor.find_by(id: name_survivor_1)
		@survivor_two = Survivor.find_by(id: name_survivor_2)

    	if @survivor_one.present? && @survivor_two.present?		

    		if  @survivor_one.infected?

    			errors.add(:name_survivor_1 , "I'm infected") 
    		end
    		
          	if @survivor_two.infected?
          		errors.add(:name_survivor_2 , "I'm infected") 

          	end

    	end

	end



	def validate_pontos_items
		@survivor_one = Survivor.find_by(id: name_survivor_1)
		@survivor_two = Survivor.find_by(id: name_survivor_2)
		

		if @survivor_one.present? && @survivor_two.present?	
			puts "entrei aqui chegado_1"


			#o nome dos itens que vem da tela,eles veem com o id da tabela See
		   @item_tela_1 = See.find_by(id: item_survivor_1)
		   @item_tela_2 = See.find_by(id: item_survivor_2)

		   	if @item_tela_1.present? && @item_tela_2.present?

			 	@item_one = @survivor_one.items.find_by(name: @item_tela_1.name)
			    @item_two = @survivor_two.items.find_by(name: @item_tela_2.name)

			    if @item_one.present? && @item_two.present?
					puts "entrei aqui chegado_2"

				    @quantidade_survivor_1_tela = Integer(quantidade_survivor_1)
				    @quantidade_survivor_2_tela = Integer(quantidade_survivor_2)
				   

					@pontos_item_one = @quantidade_survivor_1_tela * See.find_by(name: @item_one.name).points
					@pontos_item_two = @quantidade_survivor_2_tela * See.find_by(name: @item_two.name).points

					if @pontos_item_one != @pontos_item_two

						errors.add(:item_survivor_1 , "The trade items should be equivalent.") 

						errors.add(:item_survivor_2 , "The trade items should be equivalent.")

					end	

					if @item_one.quant <  @quantidade_survivor_1_tela
						errors.add(:quantidade_survivor_1 , @survivor_one.name + " "+ "Esta trocando mais que tem.")
					end

					if @item_two.quant <  @quantidade_survivor_2_tela
						errors.add(:quantidade_survivor_2 , @survivor_two.name + " "+ "Esta trocando mais que tem.")
					end

				end
			end
		end

	end



	def validate_check_items

		 #Achando os caras que sao selecionados na tela  
	    @survivor_one = Survivor.find_by(id: name_survivor_1)
	    @survivor_two = Survivor.find_by(id: name_survivor_2)
	    
    	if @survivor_one.present? && @survivor_two.present?		
    		puts "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"
		    #o nome dos itens que vem da tela,eles veem com o id da tabela See
		    @item_tela_1 = See.find_by(id: item_survivor_1)
		    @item_tela_2 = See.find_by(id: item_survivor_2)

		   if @item_tela_1.present? && @item_tela_2.present?
		    
		    #pego o nome dos itens da tela e verifico se tem na lista de itens do survivor
		    	@item_one = @survivor_one.items.find_by(name: @item_tela_1.name)
		   		@item_two = @survivor_two.items.find_by(name: @item_tela_2.name)

			    if @item_one.blank? 
			    	
			    	errors.add(:item_survivor_1 , @survivor_one.name + " " + "d'ont have this item!") 

			    end

			   	if @item_two.blank? 
			    	
			    	errors.add(:item_survivor_2 , @survivor_two.name + " "+ "d'ont have this item!") 

			    end

			end
		end

	end


end


