# spec/factories/expenses.rb
FactoryBot.define do
    factory :expense do
      name { Faker::StarWars.character }
      amount { Faker::Number.number(10) }
      date nil
      user_id nil
    end
  end