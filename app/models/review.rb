class Review < ApplicationRecord
  belongs_to :book
  # validations
  validates_presence_of :title, :description, :score
end
