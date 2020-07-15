class Rawmaterial < ApplicationRecord
  include Discard::Model
  validates :name, presence: true, uniqueness: true
  belongs_to :foodcategory
  belongs_to :unit
  has_many :foodstuffs
  has_one :nutrient, inverse_of: :rawmaterial
  accepts_nested_attributes_for :nutrient, update_only: true
end
