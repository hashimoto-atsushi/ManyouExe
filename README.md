# README
#テーブルのスキーマ

##tasksテーブル
  - t.strig :"task_name" **実装済**
  - t.text :"task_detail" **実装済**
  - t.date :"due"
  - t.string :"status"
  - t.string :"priority"
  - t.string :"charge"
  - t.bigint :"user_id"
  - t.datetime :"created_at" **実装済**
  - t.datetime :"datetime"  **実装済**
  - t.index ["user_id"], name: "index_tasks_on_user_id"

##usersテーブル
  - t.string :"name"
  - t.string :"email"
  - t.string :"password_digest"
  - t.datetime :created_at"
  - t.datetime :"datetime"
  - t.booleam :"admin"
  - t.index["email"], name: "index_users_on_email", unique: true

##labels_tasks (多対多用)
  - t.integer :"label_id"
  - t.integer :"task_id"
  - t.datetime :"created_at"
  - t.datetime :"datetime"

##labels
  - t.text :"label_name"
  - t.datetime :"created_at"
  - t.datetime :"datetime"
