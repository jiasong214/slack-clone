class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :channel, optional: true

  validates :msg, length: { minimum: 1 }
  validates :user_id, presence: true
end
