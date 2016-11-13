class ApplicationJob < ActiveJob::Base


	 if @item_one.quant >=  @quantidade_survivor_1_tela && @item_two.quant >=  @quantidade_survivor_2_tela #Testando se ele tá trocando mais do que tem
        @pontos_item_one = @quantidade_survivor_1_tela * See.find_by(name: @item_one.name).points
        @pontos_item_two = @quantidade_survivor_2_tela * See.find_by(name: @item_two.name).points

       
          if @survivor_one.items.find_by(name: @item_two.name).blank? #nao tem o item do survivor_2

            @item_criado_one = Item.new(name: @item_two.name, quant: @quantidade_survivor_2_tela, survivor_id: @survivor_one.id)
            #@item_two.quant = @item_two.quant - @quantidade_survivor_2_tela

            @item_criado_one.save

            if @item_two.quant - @quantidade_survivor_2_tela == 0 
                  @item_two.destroy # se resultado for zero,deleto o item
                  
                else

                  @item_two.update(quant: @item_two.quant - @quantidade_survivor_2_tela)
              end

            
            if @survivor_two.items.find_by(name: @item_one.name).blank?#nao tem o item do survivor_1

              @item_criado_two = Item.new(name: @item_one.name, quant: @quantidade_survivor_1_tela, survivor_id: @survivor_two.id)
              #@item_one.quant = @item_one.quant - @quantidade_survivor_1_tela

              @item_criado_two.save

              if @item_one.quant - @quantidade_survivor_1_tela == 0
                  @item_one.destroy #se o resultado for zero,deleto o item

              else
                  @item_one.update(quant: @item_one.quant - @quantidade_survivor_1_tela)

              end

            else
              @item_two.update(quant: @item_two.quant + @quantidade_survivor_1_tela)
            
            end

          else
            
              @item_one.update(quant: @item_one.quant + @quantidade_survivor_2_tela)
          end



      else
        #format.html {'Alguém tá trocando mais do que tem!!' }
        #flash[:error] = "Alguém tá trocando mais do que tem!!"
        puts "Alguém tá trocando mais do que tem!!"
      end

end