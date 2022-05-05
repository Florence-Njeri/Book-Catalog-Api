#Book dynamic test data
FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    rating { Faker::Number.between(from: 0.0, to: 5.0) }
  end
end
