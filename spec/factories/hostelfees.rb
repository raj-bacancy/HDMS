FactoryBot.define do
  factory :hostelfee do
  	year {Faker::Number.between(from: 2020, to: 2030)}
  end
end
