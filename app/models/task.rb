class Task < ApplicationRecord

  validates :title,      presence: true, length: { maximum: 50 }
  validates :start_date, presence: true
  validates :end_date,   presence: true
  validate :start_end_check

  # 開始日より終了日の方が前だった場合にfalseを返す

  def start_end_check
    if self.start_date && self.end_date
      errors.add(:end_date, "は開始日より前の日付には登録できません。") unless self.start_date <= self.end_date 
    end
  end
end
