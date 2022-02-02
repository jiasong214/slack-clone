class UsersController < ApplicationController
  before_action :check_login, :fetch_user_channels, :fetch_user_DMs, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    user.image = "/assets/default-profile.png"
    user.save

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    if params[:id].to_i != @current_user.id
      redirect_to login_path
      return
    end

    # raise 'hell'

    if params[:user][:image].present?
      response = Cloudinary::Uploader.upload params[:user][:image]
      @current_user.image = response['public_id']
    else
      @current_user.image = "/assets/default-profile.png"
    end

    # @current_user.save

    if @current_user.update user_params
      redirect_to user_path @current_user.id
    else
      render :edit
    end
  end


  def destroy
    if params[:id].to_i != @current_user.id
      redirect_to login_path
      return
    end

    update = @current_user.update(
      status: "disabled"
    )

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
