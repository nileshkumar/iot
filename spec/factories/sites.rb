FactoryBot.define do
  factory :site do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
