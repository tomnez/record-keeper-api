class ChangeUserStudentKeyDefaultType < ActiveRecord::Migration
  def change
    remove_column :user_students, :user_id, :integer
    remove_column :user_students, :student_id, :integer

    add_column :user_students, :user_id, :uuid
    add_column :user_students, :student_id, :uuid
  end
end
