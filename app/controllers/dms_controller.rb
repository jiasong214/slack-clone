class DmsController < ApplicationController
  before_action :check_login, :fetch_user_channels, :fetch_user_DMs

  def create    
    chat = Chat.new chat_params
    chat.user_id = @current_user.id
    chat.recipient_id = params[:user_id]
    chat.save
    
    redirect_to dms_path params[:user_id]
  end


  def index
    @recipient = User.find params[:user_id]
    @chats = Chat
      .where(user_id: @current_user.id, recipient_id: @recipient.id)
      .or(Chat.where(user_id: @recipient.id, recipient_id: @current_user.id))
      .order("created_at DESC")

    @all_users = User.all

    @chat = Chat.new
  end


  def edit
    @recipient = User.find params[:user_id]
    @chats = Chat
      .where(user_id: @current_user.id, recipient_id: @recipient.id)
      .or(Chat.where(user_id: @recipient.id, recipient_id: @current_user.id))
      .order("created_at DESC")

    @chat = Chat.find params[:id]

    @all_users = User.all

    redirect_to dms_path @recipient.id
  end


  def update
    chat = Chat.find params[:id]

    if chat.user_id != @current_user.id
      redirect_to chats_of_channel_path params[:channel_id]
      return
    end

    if chat.update chat_params
      redirect_to chats_of_channel_path params[:channel_id]
    else
      render :edit
    end
  end


  def destroy
    recipient = User.find params[:user_id]
    chat = Chat.find params[:id]

    if chat.user_id != @current_user.id
      redirect_to dms_path @recipient.id
      return
    end

    Chat.destroy params[:id]

    redirect_to dms_path recipient.id
  end

  
  def chat_params
    params.require(:chat).permit(:msg)
  end
end
