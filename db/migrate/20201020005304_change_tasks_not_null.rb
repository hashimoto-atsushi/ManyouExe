class ChangeTasksNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :task_name, false
    change_column_null :tasks, :task_detail, false
  end
end
