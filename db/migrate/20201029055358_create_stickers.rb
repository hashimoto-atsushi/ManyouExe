class CreateStickers < ActiveRecord::Migration[5.2]
  def change
    create_table :stickers do |t|
      t.string :sticker_name
      
      t.timestamps
    end
  end
end
