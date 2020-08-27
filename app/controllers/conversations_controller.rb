class ConversationsController < ApplicationController

  def create
    @conversation = Conversation.new
    @sender = current_user
    @receiver = User.find(params[:profile_id])
    @buddy_request = BuddyRequest.find(params[:buddy_request_id])
    @conversation.sender = @sender
    @conversation.receiver = @receiver
    @conversation.buddy_request = @buddy_request
    authorize @conversation
    @conversation.save
    redirect_to conversation_path(@conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    authorize @conversation
    # @messages = Message.find()
  end

end
