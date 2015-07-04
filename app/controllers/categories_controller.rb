class CategoriesController < ApplicationController
  # check that the current user can only see the correct pages
  before_action :authorize, except: [ :display, :show ]
  before_action :find_category, only: [ :show, :edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new( category_params )

    if @category.save
      redirect_to @category, flash: { info: "New category created successfully" }
    else
      render :new
    end
  end

  def update
    if @category.update( category_params )
      redirect_to @category, flash: { info: "Category successfully updated" }
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to root_path, flash: { info: "Category successfully deleted" }
  end

  private
    def find_category
      @category = Category.find( params[ :id ] )
    end

    def category_params
      params.require( :category ).permit( :name )
    end

end


# Transaction.sum(:value) use to find sums in columns of your tables