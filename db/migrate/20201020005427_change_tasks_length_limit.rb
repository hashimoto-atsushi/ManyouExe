class ChangeTasksLengthLimit < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :task_name, :string, limit: 25
  end
  def down
    change_column :tasks, :task_name, :string
  end
end
