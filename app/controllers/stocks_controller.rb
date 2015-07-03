class StocksController < ApplicationController
  # check that the current user can only see the correct pages
  before_action :authorize, except: [ :display, :show ]

  def index
    @user = User.find( session[:user_id] )
    @stocks = Stock.all
  end

  def display
  end

  def show
    @stock = Stock.find( params[:id] )
  end

  def new
    @stock = Stock.new
  end

  def edit
    @stock = Stock.find( params[:id] )
  end

  def create
    @stock = Stock.new( stock_params )

    if @stock.save
      redirect_to @stock, flash: { info: "New stock created successfully" }
    else
      render :new
    end
  end

  def update
    @stock = Stock.find( params[:id] )

    if @stock.update( stock_params )
      redirect_to @stock, flash: { info: "Stock successfully updated" }
    else
      render :edit
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    redirect_to root_path, flash: { info: "Stock successfully deleted" }
  end

  private
    def stock_params
      params.require(:stock).permit(:name, :quantity, :stck_img, :store_id, :category_id, :subcategory_id, :buy_price, :sell_price)
    end

end