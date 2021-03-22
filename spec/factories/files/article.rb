FactoryBot.define do
  factory :article do
    title { Faker::Movies::Hobbit.character }
    description { Faker::Lorem.sentence(word_count: 230) }
    user
  end
end
