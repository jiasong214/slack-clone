class SessionController < ApplicationController
  def new
  end

  # login
  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      # save user id in session
      session[:user_id] = user.id

      redirect_to root_path
    else
      flash[:error] = "Invalid email of password"

      redirect_to login_path
    end
  end

  # logout
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
