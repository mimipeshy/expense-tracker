class Expense < ApplicationRecord
  belongs_to :user
  has_many :measurement
  # validations
  validates_presence_of :name
end
