class ConversationsController < ApplicationController

  def index
    @conversations = policy_scope(Conversation)
    @conversations = Conversation.where(receiver_id: current_user.id).or(Conversation.where(sender_id: current_user.id))
    # raise
  end

  def show
    @conversation = Conversation.find(params[:id])
    @conversation.messages.each do |message|
      if message.read == false
        message.read = true
        message.save
      end
    end
    @message = Message.new
    authorize @conversation

    # @messages = Message.find()
  end

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
  end

end
