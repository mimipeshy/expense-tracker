# spec/factories/items.rb
FactoryBot.define do
  factory :review do
    title { Faker::Lorem.word }
    description { Faker::Lorem.word }
    score {Faker::Number.number(10) }
    book_id nil
  end
end