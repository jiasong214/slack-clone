class ChannelsController < ApplicationController
  $current_user = User.last
  $all_channels = Channel.all
  $all_users = User.all

  def new
    @channel = Channel.new

    $all_channels = Channel.all
  end

  def create
    channel = Channel.create channel_params

    redirect_to channel_path channel.id
  end

  def index
    @channels = Channel.all
    $all_channels = Channel.all
  end

  def show
    @channel = Channel.find params[:id]
  end

  def edit
    @channel = Channel.find params[:id]
  end

  def update
    channel = Channel.find params[:id]
    channel.update channel_params

    redirect_to channel_path channel.id
  end

  def destroy
    Channel.destroy params[:id]

    redirect_to chats_path
  end

  def channel_params
    params.require(:channel).permit(:name, :description, :user_id)
  end
end
