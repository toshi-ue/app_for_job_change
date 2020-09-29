class Todaysmenu < ApplicationRecord
  belongs_to :cuisine
  belongs_to :user
  validates :serving_count, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates_uniqueness_of :cuisine_id, scope: :user_id
end
