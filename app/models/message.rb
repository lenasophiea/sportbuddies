class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  # def read
  #   self.read = true

  #   # scope? scope.all
  #   # argument? = could be the user
  #   # call it in navbar
  #   # number of messages = .count
  # end
end
