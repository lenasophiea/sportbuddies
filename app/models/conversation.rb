class Conversation < ApplicationRecord
  belongs_to :buddy_request
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
