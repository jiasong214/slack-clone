class PageController < ApplicationController
  def home
    # 로그인으로 수정
    @user = User.last
    @channels = Channel.all
    @chats = Chat.all
  end
end
