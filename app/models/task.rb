class Task < ApplicationRecord
  validates :task_name, presence: true, length:{ maximum: 25 }
  validates :task_detail, :due, :status, :priority, presence: true
  scope :search_by_task_name, -> (search){where('task_name LIKE ?', "%#{search}%" )}
  scope :search_by_status, -> (search){where('status LIKE?', "%#{search}%")}
  scope :search_by_sticker_id, -> (search){ joins(:stickers).where('id LIKE?', "%#{search}%") }
  enum priority: {高:0, 中:1, 低:3}
  belongs_to :user
  has_many :stickers_tasks, dependent: :destroy
  has_many :stickers, through: :stickers_tasks
end
