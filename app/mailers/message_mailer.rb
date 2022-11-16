class MessageMailer < ApplicationMailer
  default from: 'notifications@danbillsguitars.com'

  def new_message
    @name = params[:name]
    @message_body = params[:message_body]
    @email = params[:email]
    mail(to: 'jakebills1@gmail.com', subject: params[:subject])
  end
end
