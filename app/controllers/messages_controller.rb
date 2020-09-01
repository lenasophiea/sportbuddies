class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(msg_params)
    @user = current_user
    @message.user = current_user
    @message.conversation = @conversation
    authorize @message
    @user = @conversation.receiver.name == current_user.name ? @conversation.sender : @conversation.receiver
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "message", locals: { message: @message }, user: current_user )
    )
    UserChannel.broadcast_to(
      @user,
      Conversation.unread_messages(current_user.id).count.to_s
    )
  end

  private

  def msg_params
    params.require(:message).permit(:content, :conversation_id)
  end
end
