class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]

	def index
    	@trades = Trade.all

	end

	def new
    @trades = Trade.new
  end

  def show
  end

def create

    @trade = Trade.new(trade_params)

    if params[:trades][:name_survivor_1].blank? or params[:trades][:name_survivor_2].blank? 
      puts "erro brother"
    else

      @survivor_one = Survivor.find_by(name: params[:trades][:name_survivor_1])
      @survivor_two = Survivor.find_by(name: params[:trades][:name_survivor_2])

      @item_one = @survivor_one.items.find_by(name: params[:trades][:item_survivor_1])
      @item_two = @survivor_two.items.find_by(name: params[:trades][:item_survivor_2])

      @quantidade_survivor_1_tela = Integer(params[:trades][:quantidade_survivor_1])
      @quantidade_survivor_2_tela = Integer(params[:trades][:quantidade_survivor_2])
   

      if @item_one.quant >=  @quantidade_survivor_1_tela && @item_two.quant >=  @quantidade_survivor_2_tela #Testando se ele tá trocando mais do que tem
        @pontos_item_one = @quantidade_survivor_1_tela * See.find_by(name: @item_one.name).points
        @pontos_item_two = @quantidade_survivor_2_tela * See.find_by(name: @item_two.name).points

        if @pontos_item_one == @pontos_item_two #Testando se os pontos são iguais!

          puts "Dá pra trocar!!"
          #fazer a troca aqui


        else

          puts "não dá pra trocar!!"
        end

      else
        puts "não troque mais do que tem!!"

      end

     

      


      #puts @survivor_one.name
      #puts @survivor_two.name



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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params

      params.require(:trades).permit(:id,:name_survivor_1,:name_survivor_2,:item_survivor_1,:item_survivor_2,:quantidade_survivor_1,:quantidade_survivor_2)

    end

end