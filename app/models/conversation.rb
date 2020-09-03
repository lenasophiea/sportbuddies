class Conversation < ApplicationRecord
  belongs_to :buddy_request
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages

  def self.unread_messages(user_id)
    user_convos = Conversation.where(receiver_id: user_id)
    return [] if user_convos.empty?
    unread_messages = user_convos.map do |conversation|
      conversation.messages.reject(&:read)
    end
    unread_messages.last
  end
end
# .or(Conversation.where(sender_id: user_id))
