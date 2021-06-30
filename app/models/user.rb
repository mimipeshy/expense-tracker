class User < ApplicationRecord
  # encrypt password
  has_secure_password
  # Validations
  validates_presence_of :username, :password_digest, :email
  validates :email, :uniqueness => true
end
