class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit,:update,:destroy]
  before_action :require_user, only: [:edit,:update]
  before_action :require_same_user, only:[:edit,:update,:destroy]
  def new
    @user=User.new
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 8)

  end
  def show
    @articles=@user.articles
  end

  def edit
  end
  def update
    if @user.update(get_user_params)
      flash[:notice] = 'User Updated!' # or :alert
      redirect_to @user
    else
      flash[:notice] = 'User was not updated!' # or :alert
      render "edit"
    end
  end
  def create
    @user=User.new(get_user_params)
    if @user.save
      flash[:notice] = 'User Created!' # or :alert
      redirect_to articles_path
    else
      flash.now[:notice] = 'User was not created!' # or :alert
      render "new"
    end
  end
  def destroy
    @user.destroy
    session[:user_id] = nil if current_user == @user
    flash[:notice] = 'User Deleted!' # or :alert
    redirect_to articles_path
  end
  private
  def get_user_params
    params.require(:user).permit(:username, :password,:email)
  end
  def get_user
    @user=User.find(params[:id])
  end
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:notice] ="You must be the profile owner to perform this action"
      redirect_to articles_path
    end
  end
end