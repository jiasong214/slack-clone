class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :channels
  has_many :chats

  enum status: {active: 0, disabled: 1}
  
  # validation
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :email, scope: :email

  validates :username, presence: true
  # validates_uniqueness_of :username, scope: :username
end
