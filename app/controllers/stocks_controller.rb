class StocksController < ApplicationController
  # check that the current user can only see the correct pages
  before_action :authorize, except: [ :display, :show ]
  before_action :find_stock, only: [ :show, :edit, :update, :destroy, :upvote ]

  def index
    @user = User.find( session[:user_id] )
    @stocks = Stock.all
    @quantity_total = Stock.sum( :quantity )
    @buy_total = 0
    @sell_total = 0
  end

  def display
    @stocks = Stock.all
  end

  def show
    sub_id = @stock.subcategory_id
    @subcategory = Subcategory.find( sub_id )
    @stocks = Stock.where( user_id: @stock.user_id )
  end

  def new
    @stock = Stock.new
  end

  def edit
  end

  def create
    @stock = Stock.new( stock_params )
    @stock.user_id = session[ :user_id ]

    if @stock.save
      redirect_to @stock, flash: { info: "New stock created successfully" }
    else
      render :new
    end
  end

  def update
    if @stock.update( stock_params )
      redirect_to @stock, flash: { info: "Stock successfully updated" }
    else
      render :edit
    end
  end

  def destroy
    @stock.destroy

    redirect_to root_path, flash: { info: "Stock successfully deleted" }
  end

  def upvote
    @stock.upvote_by current_user

    redirect_to :back
  end

  private
    def find_stock
      @stock = Stock.find( params[ :id ] )
    end

    def stock_params
      params.require( :stock ).permit( :name, :quantity, :stck_img, :store_id, :category_id, :subcategory_id, :buy_price, :sell_price )
    end

end


# Transaction.sum(:value) use to find sums in columns of your tables