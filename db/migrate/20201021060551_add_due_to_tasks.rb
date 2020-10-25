class AddDueToTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :due, :date, default: "2020-01-01".to_date
  end
  def down
    remove_column :tasks, :due, :date
  end
end
