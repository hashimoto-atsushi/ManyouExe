ActiveRecord::Schema.define(version: 2020_10_20_005427) do
  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "task_name", limit: 25, null: false
    t.text "task_detail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
