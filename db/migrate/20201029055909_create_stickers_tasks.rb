class CreateStickersTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :stickers_tasks do |t|
      t.references :sticker, foreign_key: true
      t.references :task, foreign_key: true
      
      t.timestamps
    end
  end
end
