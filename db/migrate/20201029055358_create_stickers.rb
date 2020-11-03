class CreateStickers < ActiveRecord::Migration[5.2]
  def change
    create_table :stickers do |t|
      t.string :sticker_name, null: false, limit: 20

      t.timestamps
    end
  end
end
