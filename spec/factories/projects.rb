# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    user
    sequence :name do |n|
      "project#{n}"
    end
    description "blahblahblahblah"
    is_publish false
  end
end
