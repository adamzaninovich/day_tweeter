# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    user_id 1
    date "2012-03-07"
    body "MyText"
    published false
    published_at "2012-03-07 01:12:19"
    active false
  end
end
