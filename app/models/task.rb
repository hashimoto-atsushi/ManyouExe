class Task < ApplicationRecord
  validates :task_name, presence: true, length:{ maximum: 25 }
  validates :task_detail, presence: true
end
