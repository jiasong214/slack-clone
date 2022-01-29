class User < ApplicationRecord
  # user can own many channels
  # user can create many chats
  has_many :channels
  has_many :chats
end
