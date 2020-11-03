class Sticker < ApplicationRecord
  has_many :stickers_tasks, dependent: :destroy
  has_many :tasks, through: :stickers_tasks
  validates :sticker_name, presence: true, length:{ maximum: 20 }
end
