class StickersTask < ApplicationRecord
  belongs_to :sticker
  belongs_to :task
end
