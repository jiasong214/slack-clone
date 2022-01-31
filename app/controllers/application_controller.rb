class ApplicationController < ActionController::Base
  # this will run before every method in every controller
  before_action :fetch_user

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end

    # if we did get nil from the above query, then delete session
    session[:user_id] = nil unless @current_user.present?
  end

  def check_login
    unless @current_user.present?
      flash[:error] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def fetch_user_channels
    @all_channels = @current_user.channels
  end

  def get_current_channel
    @current_channel = Channel.first
  end

  def set_current_channel channel_id
    @current_channel = Channel.find channel_id

    @current_channel = Channel.first unless @current_user.present?
  end
end
