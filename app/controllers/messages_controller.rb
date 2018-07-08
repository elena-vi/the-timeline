class MessagesController < ApplicationController
  before_action :set_messages, except: :destroy

  def index
  end

  def create
    new_msg = Message.new(message_params)
    if new_msg.save
      flash[:success] = "Message successfully created"
    else
      flash[:error] = new_msg.errors.full_messages.join(', ')
    end
    render :index
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end

  def set_messages
    @messages = Message.all.order(created_at: :desc)
  end
end
