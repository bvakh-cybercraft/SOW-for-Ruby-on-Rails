class Task < ApplicationRecord
  scope :by_status, -> (status) { where(status: statuses[status]) }
  scope :by_priority, -> (priority) { where(priority: priorities[priority]) }

  enum status: { active: 0, completed: 1 }
  enum priority: { low: 0, medium: 1, high: 2 }

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  has_many_attached :images
end
