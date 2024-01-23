class Task < ApplicationRecord
  enum status: { active: 0, completed: 1 }
  enum priority: { low: 0, medium: 1, high: 2 }

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
end
