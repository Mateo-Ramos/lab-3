class ChatsController < ApplicationController
  def index
  @chats = Chat.all
  end

  def show
  @chat = Chat.fiind(params[:id])
  end

  def create
  end
end
