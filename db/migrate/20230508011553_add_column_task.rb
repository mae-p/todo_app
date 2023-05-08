class AddColumnTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :done_at, :datetime
  end
end
