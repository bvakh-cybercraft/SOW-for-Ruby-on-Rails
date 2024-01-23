class Task < ApplicationRecord
  enum status: { active: 0, completed: 1 }

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
end
