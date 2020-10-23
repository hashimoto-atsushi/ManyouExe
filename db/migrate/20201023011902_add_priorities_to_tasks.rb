class AddPrioritiesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority, :integer, null: false, default: "選択してください"
  end
end
