FactoryGirl.define do
  factory :user do
    sequence :username do |n|
      "user#{n}"
    end
    sequence(:email) { |n| "test#{n}@example.com" }
    password "123456"
  end
end
