class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(required_params)
    if @category.save
      flash[:notice] = "Cateogy successfully created"
      redirect_to category_path(@category)
    else
      render "new"
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def required_params
    params.require(:category).permit(:name)
  end

end
