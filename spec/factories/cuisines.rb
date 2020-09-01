FactoryBot.define do
  factory :cuisine do
    sequence(:name) {|n| "料理名#{n}" }
    sequence(:difficulty) {|n| n }
    # sequence(:calories) {|n| n }
    sequence(:cooking_time) {|n| n }
    sequence(:description) {|n| "料理名#{n}の説明" }
    sequence(:main_image) {File.new("#{Rails.root}/spec/factories/images/test.jpg") }
  end
end
