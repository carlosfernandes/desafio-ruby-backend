FactoryBot.define do
  factory :store do
    name { FFaker::Name.unique.name }
  end
end
