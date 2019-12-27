FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end
  sequence :nickname do |n|
    "username#{n}"
  end

  factory :user do
    email
    nickname
    password { "password" }
    password_confirmation { "password" }
  end
end
