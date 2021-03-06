class ChatsController < ApplicationController
  before_action :check_login, :fetch_user_channels, :fetch_user_DMs


  def create
    chat = Chat.new chat_params
    chat.user_id = @current_user.id
    # the chat is belongs to current channel
    chat.channel_id = params[:channel_id]
    chat.save
    
    redirect_to chats_path params[:channel_id]
  end


  def index
    @channel = Channel.find params[:channel_id]
    # get chats that belong to current channel
    @chats = Chat.order("created_at DESC").where(channel_id: @channel.id)

    # to get user info for each chat
    @all_users = User.all

    # for the message form input
    @chat = Chat.new
  end


  def edit
    @channel = Channel.find params[:channel_id];
    @chats = Chat.order("created_at DESC").where(channel_id: @channel.id)

    # chat to be edited
    @chat = Chat.find params[:id]

    @all_users = User.all

    redirect_to chats_path @channel.id unless @chat.user_id == @current_user.id
  end


  def update
    chat = Chat.find params[:id]

    if chat.user_id != @current_user.id
      redirect_to chats_path chat.channel_id
      return
    end

    if chat.update chat_params
      redirect_to chats_path chat.channel_id
    else
      render :edit
    end
  end


  def destroy
    chat = Chat.find params[:id]

    if chat.user_id != @current_user.id
      redirect_to chats_path params[:channel_id]
      return
    end

    Chat.destroy params[:id]

    redirect_to chats_path params[:channel_id]
  end

  
  def chat_params
    params.require(:chat).permit(:msg)
  end
end
