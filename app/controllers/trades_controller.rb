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
      #parei aqui
      
    end

    survivor_1 = params[:trades][:name_survivor_1]

    @survivor = Survivor.where(name: survivor_1)

    puts @survivor

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