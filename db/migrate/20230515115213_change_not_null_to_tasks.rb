class ChangeNotNullToTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :priority, :integer, default: "", null: false
  end
end
