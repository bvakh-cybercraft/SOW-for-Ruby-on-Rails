class AddTaskCheckboxToTask < ActiveRecord::Migration[7.1]
  def change
    create_table :task_checkboxes do |t|
      t.string :name, null: false, limit: 120
      t.boolean :checked, null: false
    end
  end
end
