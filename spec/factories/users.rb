# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    twitter_id 1
    username "MyString"
    name "MyString"
    image "MyString"
    auth_token "MyString"
    auth_secret "MyString"
  end
end
