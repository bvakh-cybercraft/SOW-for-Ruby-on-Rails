class AddBelongsToTasks < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :task_checkboxes, :task
  end
end
