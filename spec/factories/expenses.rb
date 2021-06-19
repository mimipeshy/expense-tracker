# spec/factories/expenses.rb
FactoryBot.define do
  factory :expense do
    name { Faker::Name.name }
    amount { Faker::Number.number(10) }
    date { Faker::Date.in_date_period }
    user_id nil
  end
end
