class Channel < ApplicationRecord
  # one channel is own by one user
  # one channel has many chats
  belongs_to :user
  has_many :chats
end
