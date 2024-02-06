class AddTasksToUser < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :tasks, :user
  end
end
