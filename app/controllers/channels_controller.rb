class ChannelsController < ApplicationController
  before_action :check_login, :fetch_user_channels
  after_action :fetch_user_channels

  def new
    @channel = Channel.new
  end

  def create
    @channel = Channel.new channel_params
    @channel.owner_id = @current_user.id
    @channel.save

    # channel's owner should be joinned in the channel
    @channel.users << @current_user

    if @channel.persisted?
      redirect_to channel_path @channel.id
    else
      render :new
    end
  end

  def index
    @channels = Channel.where("private=false")
  end

  def show
    @channel = Channel.find params[:channel_id]
    @all_users = User.all
  end

  def members
    @channel = Channel.find params[:channel_id]
    @all_users = User.all
  end

  def edit
    @channel = Channel.find params[:channel_id]

    redirect_to channel_path channel.id unless @channel.owner_id == @current_user.id
  end

  def update
    # get the channel a user wants to update
    channel = Channel.find params[:channel_id]

    # check if the user is matched with channel owner
    if channel.owner_id != @current_user.id
      redirect_to channel_path channel.id
      return
    end

    # check if the channel update is succeed
    if channel.update channel_params
      redirect_to channel_path channel.id
    else
      render :edit
    end
  end

  def destroy
    channel = Channel.find params[:channel_id]

    if channel.owner_id != @current_user.id
      redirect_to channel_path channel.id
      return
    end

    Channel.destroy channel.id

    redirect_to chats_path
  end

  def join
    @channel = Channel.find params[:channel_id]

    # user can join the table only when they haven't
    unless @channel.users.include?(@current_user)
      @channel.users << @current_user
    end

    # need to redirect to current channel 
    # "/chats?channel_id=?" -> how?
    redirect_to chats_path
  end

  def leave
    @channel = Channel.find params[:channel_id]

    @channel.users.delete @current_user

    redirect_to chats_path
  end

  def invite
    # '/channels/:channel_id/invite
    @channel = Channel.find params[:channel_id]

    ## 1. find a user
    # user = User.find params[???]

    ## 2. chech if user is already joined

    ## 3. add user in join table
    # @channel.users << user
  end

  def channel_params
    params.require(:channel).permit(:name, :description, :private)
  end
end
