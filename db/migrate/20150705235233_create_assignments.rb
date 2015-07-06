class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :person_id
      t.integer :task_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
