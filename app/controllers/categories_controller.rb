class CategoriesController < ApplicationController
  before_action :require_admin, except:[:index,:show]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
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
      render 'new'
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
    def require_admin
      if !(logged_in? && current_user.admin?)
        flash[:alert] ="you need to be an admin to performthis action"
        redirect_to categories_path
      end
    end

end
