class User < ApplicationRecord
  # user can own many channels
  # user can create many chats
  # has_many :channels
  has_and_belongs_to_many :channels
  has_many :chats
end
