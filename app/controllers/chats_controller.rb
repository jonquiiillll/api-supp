class ChatsController < ApplicationController
  def index
    @users = User.all_except(@current_user)
    @chats = Chat.all
  end
end
