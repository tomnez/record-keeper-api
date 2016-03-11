class AddColumnsToUserStudents < ActiveRecord::Migration
  def change
    add_column :user_students, :user_id, :integer
    add_column :user_students, :student_id, :integer
  end
end
