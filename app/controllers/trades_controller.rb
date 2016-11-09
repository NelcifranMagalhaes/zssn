class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)
    if @trade.valid?
      
    @survivor_one = Survivor.find_by(name: params[:trade][:name_survivor_1])
    @survivor_two = Survivor.find_by(name: params[:trade][:name_survivor_2])


    @item_one = @survivor_one.items.find_by(name: params[:trade][:item_survivor_1])
    @item_two = @survivor_two.items.find_by(name: params[:trade][:item_survivor_2])

    @quantidade_survivor_1_tela = Integer(params[:trade][:quantidade_survivor_1])
    @quantidade_survivor_2_tela = Integer(params[:trade][:quantidade_survivor_2])
   


      if @item_one.quant >=  @quantidade_survivor_1_tela && @item_two.quant >=  @quantidade_survivor_2_tela #Testando se ele tá trocando mais do que tem
        @pontos_item_one = @quantidade_survivor_1_tela * See.find_by(name: @item_one.name).points
        @pontos_item_two = @quantidade_survivor_2_tela * See.find_by(name: @item_two.name).points

        if @pontos_item_one == @pontos_item_two #Testando se os pontos são iguais!

          puts "Well,trade is ok!!"
          #fazer a troca aqui
          
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

            
            end


          end

        else

          #format.html {notice: 'não dá pra trocar,as trocas tem de ser equivalentes' }
          #flash[:error] = "não dá pra trocar,as trocas tem de ser equivalentes"
          puts "não dá pra trocar,as trocas tem de ser equivalentes"

        end

      else
        #format.html {'Alguém tá trocando mais do que tem!!' }
        #flash[:error] = "Alguém tá trocando mais do que tem!!"
        puts "Alguém tá trocando mais do que tem!!"
      end


      end

      respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { render :new }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade }
      else
        format.html { render :edit }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:name_survivor_1, :name_survivor_2, :item_survivor_1, :item_survivor_2, :quantidade_survivor_1, :quantidade_survivor_2)
    end
end
