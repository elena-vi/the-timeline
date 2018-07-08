class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def create
    new_msg = Message.new(message_params)
    if new_msg.save
      flash[:success] = "Message successfully created"
    else
      flash[:error] = new_msg.errors.full_messages.join(', ')
    end
    redirect_to messages_path
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
