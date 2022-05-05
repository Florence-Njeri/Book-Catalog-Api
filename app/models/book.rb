class Book < ApplicationRecord
    # validations
  validates_presence_of :title, :author, :rating
end
