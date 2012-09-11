# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    user
    name { Faker::Lorem.sentence }
  end
end
