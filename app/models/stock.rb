class Stock < ApplicationRecord
  before_validation :convert_specific_format
  belongs_to :rawmaterial
  belongs_to :user
  validates :quantity, presence: true, format: { with: %r{\A[1-9１-９]*[/／]*[0-9０-９]*\z}, message: "は数字(整数)で入力してください" }
  validates :user_id, presence: true

  scope :unused, lambda {
    not_abandoned.not_consumed
  }

  scope :not_abandoned, lambda {
    where(abandoned_at: nil)
  }
  scope :not_consumed, lambda {
    where(consumed_at: nil)
  }

  def convert_specific_format
    # 空白を削除、 全角があれば半角に、文字列はそのまま
    self.quantity = quantity.gsub(/ 　/, "").tr("／", "/").strip.tr('０-９', '0-9')
  end

  def self.remaining_amount(stocks, todaysmenus)
    stocks_result = {}
    stocks.each do |st|
      todaysmenus.each do |tm|
        stocks_result.store(st[0].to_s, st[1] - tm[1]) if st[0] == tm[0]
      end
      stocks_result.store(st[0].to_s, st[1]) unless stocks_result.key?(st[0].to_s)
    end
    stocks_result.delete_if { |_key, value| value <= 0 }
  end

  def store_rotted_at
    self.rotted_at = Time.zone.now + Rawmaterial.find(self.rawmaterial_id).expiry_period.to_i.days
  end
end
