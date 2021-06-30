require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Expense, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  # Validation tests
  it { should validate_presence_of(:name) }
end
