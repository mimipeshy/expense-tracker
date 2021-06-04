# spec/factories/items.rb
FactoryBot.define do
  factory :review do
    name { Faker::Lorem.word }
    amount { Faker::Number.numer(1000) }
    date { Faker::Date.date }
    book_id nil
  end
end
