# spec/models/todo_spec.rb
require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Book, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  describe 'asociations' do
    it { should have_many(:reviews).dependent(:destroy) }
    # Validation tests
    # ensure columns title and created_by are present before saving
  end
  describe 'vlidations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:author) }
  end
end
