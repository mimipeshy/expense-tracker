require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should belong_to :user }
  it { should have_many :measurement }

  ## Validations
  it { should validate_presence_of(:name) }
end
