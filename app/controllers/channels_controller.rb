class ChannelsController < ApplicationController
  before_action :check_login, :fetch_user_channels, :fetch_user_DMs

  def new
    @channel = Channel.new
  end


  def create
    @channel = Channel.new channel_params
    @channel.owner_id = @current_user.id
    @channel.save

    # channel's owner should be a member of the channel
    @channel.users << @current_user

    if @channel.persisted?
      redirect_to chats_path @channel.id
    else
      render :new
    end
  end


  def index
    # it displays only the public channels
    @channels = Channel.where(private: false)
  end


  def edit
    @channel = Channel.find params[:channel_id]

    # allow edit page only if the current user is matched with the channel owner
    redirect_to chats_path channel.id unless @channel.owner_id == @current_user.id
  end


  def update
    channel = Channel.find params[:channel_id]

    # only channel owner can edit channel info
    if channel.owner_id != @current_user.id
      redirect_to chats_path channel.id
      return
    end

    # check if the channel update succeeds
    if channel.update channel_params
      redirect_to chats_path channel.id
    else
      render :edit
    end
  end


  def destroy
    channel = Channel.find params[:channel_id]

    if channel.owner_id != @current_user.id
      redirect_to chats_path channel.id
      return
    end

    Channel.destroy channel.id

    redirect_to root_path
  end

  
  def join
    @channel = Channel.find params[:channel_id]

    # users can join the channel only if they haven't already
    unless @channel.users.include?(@current_user)
      @channel.users << @current_user
    end

    redirect_to chats_path(@channel.id)
  end


  def leave
    @channel = Channel.find params[:channel_id]

    if @channel.users.include?(@current_user)
      @channel.users.delete @current_user
    end

    redirect_to chats_path(@current_user.channels.first)
  end


  def invite
    @channel = Channel.find params[:channel_id]

    # find a user
    user = User.find params[:user_id]

    # chech if the user has already joined
    unless @channel.users.include?(user)
      @channel.users << user
    end
  end

  
  def channel_params
    params.require(:channel).permit(:name, :description, :private)
  end
end
