class AddCompletedToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :completed_at, :timestamp
  end
end
