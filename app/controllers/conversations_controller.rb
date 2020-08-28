class ConversationsController < ApplicationController

  def create
    @receiver = User.find(params[:profile_id])
    @sender = current_user
    first_case = Conversation.find_by(sender_id: @sender.id, receiver_id: @receiver.id)
    second_case = Conversation.find_by(sender_id: @receiver.id, receiver_id: @sender.id)
    if first_case || second_case
      if first_case
        authorize first_case
        redirect_to first_case
      else
        authorize second_case
        redirect_to second_case
      end
    else
      @conversation = Conversation.new
      authorize @conversation
      @buddy_request = BuddyRequest.find(params[:buddy_request_id])
      @conversation.sender = @sender
      @conversation.receiver = @receiver
      @conversation.buddy_request = @buddy_request
      @conversation.save
      redirect_to conversation_path(@conversation)
    end
    @sport = Sport.find(params[:id])
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    authorize @conversation
    # @messages = Message.find()
  end

end
