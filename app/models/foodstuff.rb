class Foodstuff < ApplicationRecord
  before_validation :convert_specific_format # 空白を削除, 全角があれば半角に
  belongs_to :cuisine
  belongs_to :rawmaterial

  # FIXME: validationはかかる
  #         ただしvalidationメッセージは"数量を入力してください"と表示される
  validates :quantity, presence: true, format: { with: %r{\A[1-9１-９]*[/／]*[0-9０-９]*\z}, message: "は分数もしくは数字(整数)で入力してください" }
  # FIXME: validationなしでもrawmaterial_id は validationがかかる
  #         なぜ?
  # validates :rawmaterial_id, presence: { message: "を追加してください"}

  def convert_specific_format
    self.quantity = quantity.gsub(/ |　/, "").tr("／", "/").strip.tr('０-９', '0-9')
  end
end
