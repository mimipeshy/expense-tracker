require 'rails_helper'

RSpec.describe Measurement, type: :model do
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:date) }
end
