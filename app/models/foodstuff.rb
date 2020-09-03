class Foodstuff < ApplicationRecord
  before_validation :convert_specific_format # 空白を削除, 全角があれば半角に
  belongs_to :cuisine
  belongs_to :rawmaterial
  validates :cuisine_id,
    uniqueness: {
      scope: :rawmaterial_id,
      message: ->(object, data){
        I18n.t('activerecord.errors.models.cuisine.cannot_duplicate_rawmaterial')
        # "1つの料理に同じ材料を登録できません"
      }
    }
  validates :quantity, presence: true, format: { with: %r{\A[1-9１-９]*[/／]*[0-9０-９]*\z}, message: "は分数もしくは数字で入力してください(例: 1/2, 120など)" }
  # ranked-model
  include RankedModel
  ranks :row_order, with_same: :cuisine_id

  def convert_specific_format
    self.quantity = quantity.gsub(/ |　/, "").tr("／", "/").strip.tr('０-９', '0-9')
  end
end
