FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password"} 
    password_confirmation { "password" }
    status  {true}
  end
end
