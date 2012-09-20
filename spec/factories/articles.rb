# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    user
    project
    content "MyText"
    title "MyString"
    is_publish false
  end
end
