class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(msg_params)
    @message.user = current_user
    @message.conversation = @conversation
    authorize @message
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "message", locals: { message: @message })
    )
  end

  private

  def msg_params
    params.require(:message).permit(:content, :conversation_id)
  end

end
