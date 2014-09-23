class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :student_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
