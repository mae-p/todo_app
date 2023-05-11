class Task < ApplicationRecord
  validates :title,  presence: true
  validates :deadline, presence: true
  validate :deadline_before_today
    
    
    def deadline_before_today
      return if deadline.blank?
      errors.add(:deadline, "今日以降のものを選択する") if deadline < Date.today
    end
end
