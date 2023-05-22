class Task < ApplicationRecord
  validates :title,  presence: true
  validates :deadline, presence: true
  enum priority: { high: 0, middle: 1, low: 2 }
  validates :priority, presence: true
  validate :validate_deadline_is_future

  def remaining_days
    self.deadline.day - Time.zone.now.day
  end

  private 
    def validate_deadline_is_future
      if deadline.present? && deadline.past?
        errors.add(:deadline, "を未来の日付にしてください") 
      end
    end
end
