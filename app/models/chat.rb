class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :msg, length: { minimum: 1 }
  validates :owner_id, presence: true
  validates :private, presence: true
end
