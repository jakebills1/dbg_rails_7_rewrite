class MessagesController < ApplicationController
  def send_message
    pp message_params
    redirect_to '/contact', notice: 'message sent'
  end

  private

  def message_params
    params.require(:message).permit(:email, :name, :subject, :message)
  end
end