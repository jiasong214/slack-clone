class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create user_params

    redirect_to user_path user.id
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params

    redirect_to user_path user.id
  end

  def destroy
    User.destroy params[:id]

    # redirect_to chats_path
  end

  def user_params
    params.require(:user).permit(:username, :pwd, :email, :image)
  end
end
