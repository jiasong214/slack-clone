class Channel < ApplicationRecord
  has_many :chats
  has_and_belongs_to_many :users

  validates :name, length: { minimum: 2 }
  validates :owner_id, presence: true
end
