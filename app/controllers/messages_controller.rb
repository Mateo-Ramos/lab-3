class MessagesController < ApplicationController
  load_and_authorize_resource
  before_action :set_message, only: [ :show, :edit, :update ]
  before_action :authorize_user!, only: [ :show, :edit, :update ]

  def index
    @messages = current_user.messages
  end

def show
  @message = Message.find(params[:id])
  chat = @message.chat

  unless chat.sender == current_user || chat.receiver == current_user
    redirect_to chats_path, alert: "You are not authorized to view this chat."
    nil
  end
end


  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to messages_path, notice: "Message created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def authorize_user!
    unless @message.user == current_user
      redirect_to messages_path, alert: "You are not authorized to access this message."
    end
  end

  def message_params
    params.require(:message).permit(:chat_id, :body)
  end
end
