# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    username { Faker::Lorem.word }
  end
end
