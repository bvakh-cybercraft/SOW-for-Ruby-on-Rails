class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
