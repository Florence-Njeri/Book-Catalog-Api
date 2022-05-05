class User < ApplicationRecord
    # encrypt password
  has_secure_password
    # Model associations (1:m relationship with the book model )
  has_many :books, foreign_key: :title
    # validations
  validates_presence_of :name, :email, :password_digest
end
