ActiveRecord::Schema.define(version: 2020_10_29_055909) do

  enable_extension "plpgsql"

  create_table "stickers", force: :cascade do |t|
    t.string "sticker_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stickers_tasks", force: :cascade do |t|
    t.bigint "sticker_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sticker_id"], name: "index_stickers_tasks_on_sticker_id"
    t.index ["task_id"], name: "index_stickers_tasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name", limit: 25, null: false
    t.text "task_detail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due", default: "2020-01-01", null: false
    t.string "status", default: "選択してください", null: false
    t.integer "priority", default: 0, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "email", limit: 128, null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "stickers_tasks", "stickers"
  add_foreign_key "stickers_tasks", "tasks"
  add_foreign_key "tasks", "users"
end
