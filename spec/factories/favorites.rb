# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    association :cuisine, :published
    association :user
  end
end
