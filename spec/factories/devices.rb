FactoryBot.define do
  factory :device do
    association :site
    variant_name { Faker::Device.model_name }
    manufacturer { Faker::Device.manufacturer }
  end
end
