class WelcomeController < ApplicationController

	def index
		@stocks = Stock.all
	end

	def about
	end

end