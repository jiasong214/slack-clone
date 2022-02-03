class ApplicationController < ActionController::Base
  before_action :fetch_user

  # the data that will be needed globally:
  #   1. current user
  #   2. current user's channels (for side bar)
  #   3. current_user's DMs (for side bar)


  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end

    session[:user_id] = nil unless @current_user.present?
  end


  def check_login
    redirect_to login_path unless @current_user.present?
  end


  # fetch channels that user has joinned for the side bar
  def fetch_user_channels
    @all_channels = @current_user.channels
  end


  # fetch the user's DMs for the side bar
  def fetch_user_DMs
    # find chats between "user_id" and "recipient_id"
    user_DMs = Chat.where.not(recipient_id: nil)
      .where(user_id: @current_user.id)
      .or(Chat.where(recipient_id: @current_user.id))
      .pluck(:user_id, :recipient_id)
      .uniq

    @all_DMs = []

    user_DMs.each do |d|
      # find recipent_id from two ids
      recipient_id = @current_user.id == d[0] ? d[1] : d[0]

      unless @all_DMs.include? User.find recipient_id
        # push the recipent_id to @all_DMs unless its already there
        @all_DMs.push User.find recipient_id
      end
    end

  end
end
