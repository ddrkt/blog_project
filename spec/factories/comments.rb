FactoryBot.define do
  sequence :body do |n|
    "Comment #{n}"
  end
  factory :comment do
    body
    user
  end

  trait :invalid do
    body {nil}
  end
end
