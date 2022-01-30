class Channel < ApplicationRecord
  # one channel is own by one user
  # one channel has many chats
  # belongs_to :user
  has_many :chats
  has_and_belongs_to_many :users
end
