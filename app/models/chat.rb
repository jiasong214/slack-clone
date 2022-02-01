class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :msg, length: { minimum: 1 }
  validates :user_id, presence: true
  # validates :channel_id, presence: true
end
