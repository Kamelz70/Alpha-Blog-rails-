class CategoriesController < ApplicationController
  def index
  end
  def new 
    @category = Category.new
  end
  def create 
    @category=Category.new(get_category_params)
    if @category.save
      flash[:notice] ="category was successfully created"
      redirect_to @category
    else
      flash[:notice] ="category was not created"
      redirect_to new_category_path
    end
  end

  def edit 
  end

  def show 
    @category=Category.find(params[:id])
  end
  private
    def get_category_params
      params.require(:category).permit(:name)
    end
  
end
