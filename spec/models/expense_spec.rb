require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should belong_to :user }
end
