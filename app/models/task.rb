class Task < ApplicationRecord
  validates :title,  presence: true
  validates :deadline, presence: true

  enum priority: { higth: 0, middle: 1, low: 2 }
  validates :priority, presence: true
end
