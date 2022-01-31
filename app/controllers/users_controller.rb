class UsersController < ApplicationController
  before_action :check_login, :fetch_user_channels, except: [:new, :create]


  def new
    @user = User.new
  end

  def create
    user = User.create user_params

    if user
      session[:user_id] = user.id
      redirect_to new_user_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:id] != @current_user.id
      redirect_to login_path
      return
    end

    if @current_user.update user_params
      redirect_to user_path @current_user.id
    else
      render :edit
    end
  end

  def destroy
    @current_user.update(
      image: "",
      password: "",
      email: ""
    )
    # User.destroy @current_user.id


    redirect_to login_path
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
