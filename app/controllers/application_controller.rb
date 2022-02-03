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
      redirect_to login_path
    end
  end

  def fetch_user_channels
    @all_channels = @current_user.channels
  end

  def fetch_user_DMs
    user_DMs = Chat.where.not(recipient_id: nil)
      .where(user_id: @current_user.id)
      .or(Chat.where(recipient_id: @current_user.id))
      .pluck(:user_id, :recipient_id)
      .uniq

    @all_DMs = []

    user_DMs.each do |d|
      recipient_id = @current_user.id == d[0] ? d[1] : d[0]

      unless @all_DMs.include? User.find recipient_id
        @all_DMs.push User.find recipient_id
      end
    end

  end
end
