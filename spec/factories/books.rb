# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    name { Faker::Lorem.word }
    author { Faker::Lorem.word }
    image_url nil
  end
end
