class MessagesController < ApplicationController
  before_action :require_user!

  def index
  end

  def sent_messages
    @sent_messages = current_user.sent_messages.order("created_at desc")
  end




  def new
    @messages=Message.new
    @recipient = current_user.friends.all
  end
    
  def incoming
    @incoming_messages = current_user.incoming_messages.order("created_at desc")
  end

  def create
       @message = Message.new messages_params
       if @message.save
         redirect_to root_path
         flash[:success] =  "Your message has been sent."
       else
         redirect_to new_message_path
         flash[:error]="#{@message.errors.full_messages.to_sentence}"
       end
  end

def show
    @message = Message.find params[:id]
    @message.read = true
    @message.read_at = Time.now
    @message.save
end

  private

  def messages_params
    params.require(:message).permit(:subject, :body, :recipient_id, :sender_id)
  end

  

end
