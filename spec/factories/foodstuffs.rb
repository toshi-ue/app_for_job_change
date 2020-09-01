FactoryBot.define do
  factory :foodstuff do
    association :cuisine
    association :rawmaterial
    sequence(:quantity) {|n| "#{n}" }
    # sequence(:row_order) {|n| "#{n}" }
  end
end
