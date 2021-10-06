FactoryBot.define do
  factory :cuisine do
    association :genre
    sequence(:name) { |n| "料理名#{n}" }
    difficulty { Cuisine.difficulties.keys.sample }
    cooking_time {Cuisine.cooking_times.keys.sample}
    sequence(:description) { |n| "料理名#{n}の説明" }
    sequence(:main_image) { File.new("#{Rails.root}/app/assets/images/test.jpg") }
  end
end
