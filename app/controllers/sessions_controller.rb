class SessionsController < ApplicationController
  def new 
    render 'new'
  end

  def create 
    entered_params = get_user_params
    user=User.find_by(email:entered_params[:email])
    if user && user.authenticate(entered_params[:password])
      session[:user_id]=user.id
      flash.now[:notice] = 'Logged In Successfully' # or :alert
      redirect_to user
    else
      flash.now[:notice] = 'Incorrect Credentials!' # or :alert
      render "new"
    end
  end

  def destroy 
    session[:user_id]=nil
    flash[:notice] = 'Logged Out' #
    redirect_to root_path
  end


  private
  def get_user_params
    params.require(:session).permit(:password,:email)
  end
end

