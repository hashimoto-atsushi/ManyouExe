class ChangeColumnDuesDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :due, false
  end
end
