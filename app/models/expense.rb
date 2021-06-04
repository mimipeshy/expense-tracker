class Expense < ApplicationRecord
  belongs_to :user
    # validations
  validates_presence_of :name, :amount, :date 
end
