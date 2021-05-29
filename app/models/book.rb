class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # validations
  validates_presence_of :name, :author
end
