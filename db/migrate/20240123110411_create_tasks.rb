class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 120
      t.string :description, null: false, limit: 200
      t.date :due_date, null: false

      t.timestamps
    end
  end
end
