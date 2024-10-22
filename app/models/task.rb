class Task < ApplicationRecord
  belongs_to :user
  has_many :task_checkboxes, dependent: :destroy
  accepts_nested_attributes_for :task_checkboxes

  scope :by_status, ->(status) { where(status: statuses[status]) }
  scope :by_priority, ->(priority) { where(priority: priorities[priority]) }

  enum status: { active: 0, completed: 1 }
  enum priority: { low: 0, medium: 1, high: 2 }

  validates :title, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :due_date, presence: true

  has_many_attached :images
end
