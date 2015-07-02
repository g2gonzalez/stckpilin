class StocksController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      redirect_to stocks_path, flash: { success: "New stock created successfully" }
    else
      render :new
    end
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(stock_params)
      redirect_to @stock
    else
      render :edit
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
        @stock.destroy

        redirect_to root_path
  end

  private
    def stock_params
      params.require(:stock).permit(:name, :quantity, :stck_img, :store_id, :category_id, :subcategory_id, :buy_price, :sell_price)
    end

end