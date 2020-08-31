class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    # user.conversations.any? do |conversation|
    #   conversation.sender_id == record.sender_id || conversation.receiver_id == record.receiver_id
    # end
    record.sender == user || record.receiver == user
  end

end
