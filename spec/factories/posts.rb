FactoryBot.define do
  sequence :name do |n|
    "Post #{n}"
  end
  factory :post do
    name
    body
    user

    trait :invalid do
      body {nil}
    end
  end
end
