class AddMemoToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :memo, :text
  end
end
