class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 30
      t.string :email, null: false, limit: 128
      t.string :password_digest, null: false
      t.boolean :admin, null: false, default: false
      t.timestamps
      t.index :email, unique: true
    end
  end
end
