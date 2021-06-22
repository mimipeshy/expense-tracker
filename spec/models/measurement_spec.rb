require 'rails_helper'

RSpec.describe Measurement, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:date) }
  end

  describe 'associations' do
    it { should belong_to :expense }
    it { should belong_to :user }
  end
end
