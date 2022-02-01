class ChatsController < ApplicationController
  before_action :check_login, :fetch_user_channels, :get_current_channel

  def create    
    chat = Chat.new chat_params
    chat.user_id = @current_user.id
    chat.channel_id = @current_channel.id
    chat.save
    
    redirect_to chats_path
  end

  def index
    # # if a user clicks channel name, update @current_channel
    # if params[:channel_id].present?
    #   set_current_channel params[:channel_id]
    # end

    # # get chats that belongs to current channel
    # @chats = Chat.order("created_at DESC").where("channel_id = #{@current_channel.id}")

    # # to get username and thigns
    # @all_users = User.all

    # # for the input
    # @chat = Chat.new
  end

  def edit
    @chats = Chat.order("created_at DESC").where("channel_id = #{@current_channel.id}")
    @chat = Chat.find params[:id]

    @all_users = User.all

    redirect_to chats_path unless @chat.user_id == @current_user.id
  end

  def update
    chat = Chat.find params[:id]

    if chat.user_id != @current_user.id
      redirect_to chats_path
      return
    end

    if chat.update chat_params
      redirect_to chats_path
    else
      render :edit
    end
  end

  def destroy
    chat = Chat.find params[:id]

    if chat.user_id != @current_user.id
      redirect_to chats_path
      return
    end

    Chat.destroy params[:id]

    redirect_to chats_path
  end

  def chat_params
    params.require(:chat).permit(:msg)
  end
end
