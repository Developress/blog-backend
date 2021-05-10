class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy, foreign_key: :created_by

  validates_presence_of :username, :password_digest
end
