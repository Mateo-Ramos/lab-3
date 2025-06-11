class ChatsController < ApplicationController
  load_and_authorize_resource if: :user_signed_in?

  def index
    @chats = Chat.involving(current_user)
  end

  def show
    @chat = Chat.find(params[:id])
    unless authorized_user?(@chat)
      redirect_to chats_path, alert: "You are not authorized to view this chat."
    end
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path, notice: "Chat created successfully."
    else
      render :new
    end
  end

  def edit
    @chat = Chat.find(params[:id])
    unless authorized_user?(@chat)
      redirect_to chats_path, alert: "You are not authorized to edit this chat."
    end
  end

  def update
    @chat = Chat.find(params[:id])
    unless authorized_user?(@chat)
      redirect_to chats_path, alert: "You are not authorized to update this chat."
      return
    end

    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

  def authorized_user?(chat)
    chat.sender == current_user || chat.receiver == current_user
  end
end
