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
    if params[:id].to_i != @current_user.id
      redirect_to login_path
      return
    end

    ###################### 작동안됨
    update = @current_user.update(
      username: params[:user][:username],
      title: params[:user][:title],
      image: params[:user][:image]
    )

    raise 'hell'

    if update
      redirect_to user_path @current_user.id
    else
      render :edit
    end
  end

  # how to handle destroy not delete user id and username?
  def destroy
    if params[:id].to_i != @current_user.id
      redirect_to login_path
      return
    end

    ###################### 작동안됨
    update = @current_user.update(
      status: "disabled"
    )

    raise 'hell'
    

    if update 
      redirect_to login_path
    else
      redirect_to user_path @current_user.id
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :title)
  end
end
