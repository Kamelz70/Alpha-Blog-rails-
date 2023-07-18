class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
    user=User.new(get_user_param)
    if user.save
      flash[:notice] = 'User Created!' # or :alert
      redirect_to articles_path
    else
      flash[:notice] = 'User was not created!' # or :alert
      render "new"
    end
  end

  private
  def get_user_param
    params.require(:user).permit(:username, :password,:email)
  end
end