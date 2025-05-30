class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
    unless @message.user == current_user
      redirect_to messages_path, alert: "You are not authorized to view this message."
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "Message created successfully."
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
    unless @message.user == current_user
      redirect_to messages_path, alert: "You are not authorized to edit this message."
    end
  end

  def update
    @message = Message.find(params[:id])
    unless @message.user == current_user
      redirect_to messages_path, alert: "You are not authorized to update this message."
      return
    end

    if @message.update(message_params)
      redirect_to @message, notice: "Message updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :chat_id, :body)
  end
end
