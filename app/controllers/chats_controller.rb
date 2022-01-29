class ChatsController < ApplicationController
  # how to manage these
  $current_channel = 3
  $current_user = User.last
  $all_channels = Channel.all
  $all_users = User.all

  def create    
    Chat.create chat_params

    redirect_to chats_path
  end

  def index
    # if a user clicks channel name, update $current_channel
    if params[:channel_id].present?
      $current_channel = params[:channel_id]
    end

    # get current channel's data
    @channel = Channel.find $current_channel

    # if channel is deleted
    if @channel.present?
      @channel = Channel.last
    end

    # get chats that belongs to current channel
    @chats = Chat.order("created_at DESC").where("channel_id = #{$current_channel}")

    @chat = Chat.new
  end

  def edit
    @channel = Channel.find $current_channel
    @chats = Chat.where("channel_id = #{$current_channel}")

    @chat = Chat.find params[:id]
  end

  def update
    chat = Chat.find params[:id]
    chat.update chat_params

    redirect_to chats_path
  end

  def destroy
    Chat.destroy params[:id]

    redirect_to chats_path
  end

  def chat_params
    params.require(:chat).permit(:msg, :channel_id, :user_id)
  end
end
