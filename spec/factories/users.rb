FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password"} 
    password_confirmation { "password" }
    status  {true}
    firstname {'abc'}
    phoneno {'xyz'}
    address {'jyewg'}
    role {"owner"}
  end
end
