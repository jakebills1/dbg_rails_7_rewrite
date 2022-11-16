class MessagesController < ApplicationController
  def send_message
    MessageMailer.with(message_params).new_message.deliver_now
    redirect_to '/contact', notice: 'message sent'
  end

  private

  def message_params
    params.require(:message).permit(:email, :name, :subject, :message_body)
  end
end