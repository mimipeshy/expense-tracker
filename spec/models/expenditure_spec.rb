require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Expenditure, type: :model do
  DatabaseCleaner.clean
  let(:test_user) { User.create(username: 'Maria', target: 3000) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:category) }

    # VALUE TESTING

    it "expects the subject to be invalid for it doesn't have a value" do
      subject.date = '2021/07/05'
      subject.value = nil
      subject.description = "Am just tsting the sample"
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for it doesn't have a value" do
      subject.date = '2021/07/05'
      subject.value = 'this is invalid'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    # DATE TESTING

    it "expects the subject to be invalid for it doesn't have a date" do
      subject.date = nil
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for its date's format is not correct 1" do
      subject.date = 'this is invalid'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    it "expects the subject to be invalid for its date's format is not correct 2" do
      subject.date = '05-14-2021'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    # DESCRIPTION TESTING

    it "expects the subject to be invalid for it doesn't have a description" do
      subject.date = '2021/07/05'
      subject.value = '10'
      subject.description = nil
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    it 'expects the subject to be invalid for its description is too short' do
      subject.date = '2021/07/05'
      subject.value = '10'
      subject.description = '123456789'
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).not_to be_valid
    end

    # EXPENSE ID TESTING

    it "expects the subject to be invalid for it doesn't have a expense id" do
      subject.date = '20200705'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = nil
      expect(subject).not_to be_valid
    end

    it 'expects the subject to be invalid for it has an invalid expense id' do
      subject.date = '20200705'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 'this is a category'
      expect(subject).not_to be_valid
    end

    # USER ID TESTING

    it "expects the subject to be invalid for it doesn't have a user id" do
      subject.date = '20200705'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it 'expects the subject to be invalid for it has an invalid user id' do
      subject.date = '20200705'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = 'invalid user'
      expect(subject).not_to be_valid
    end

    # WORKING CASES

    it 'expects the subject to be valid 1' do
      subject.date = '20200705'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).to be_valid
    end

    it 'expects the subject to be valid 2' do
      subject.date = '2020/07/05'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).to be_valid
    end

    it 'expects the subject to be valid 3' do
      subject.date = '2020-07-05'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).to be_valid
    end

    it 'expects the subject to be valid 4' do
      subject.date = '05-07-2021'
      subject.value = '10'
      subject.description = "This is some expenditure decription, so we're just making some big text."
      subject.category = 1
      subject.user_id = test_user.id
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
