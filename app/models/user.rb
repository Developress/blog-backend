class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, :password, presence: true
  validates :username, length: { within: 5..50 }
end
