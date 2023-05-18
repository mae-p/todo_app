class Task < ApplicationRecord
  validates :title,  presence: true
  validates :deadline, presence: true
  validate :validate_deadline_is_future
    
  private 
    def validate_deadline_is_future
      if deadline.present? && deadline.past?
        errors.add(:deadline, "未来の日付を選択“てください") 
      end
    end
end
