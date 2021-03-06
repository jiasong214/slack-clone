class SessionController < ApplicationController
  def new
  end

  
  # login
  def create
    user = User.find_by email: params[:email]

    # 1. check if its the deleted user
    if user.present? && user.status == 'disabled'
      flash[:error] = "Deleted user"
      redirect_to login_path
      return
    end

    # 2. check if email and password match
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end


  # logout
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
