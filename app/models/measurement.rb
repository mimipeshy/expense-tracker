class Measurement < ApplicationRecord
  belongs_to :expense
  validates_presence_of :amount, :date
end
