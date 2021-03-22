FactoryBot.define do
  factory :room do
    room_no {Faker::Number.number(digits: 4)}
    capacity {'4'}
  end
end
