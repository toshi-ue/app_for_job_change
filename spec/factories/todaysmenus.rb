FactoryBot.define do
  factory :todaysmenu do
    association :cuisine
    association :user
    serving_count { 1 }
  end
end
