# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :system do
    user_id 1
    active false
    start_time "2012-04-16 14:31:13"
    stop_time "2012-04-16 14:31:13"
  end
end
