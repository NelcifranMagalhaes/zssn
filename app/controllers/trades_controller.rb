class TradesController < ApplicationController

	def index
    	@survivors = Survivor.all
	end

end