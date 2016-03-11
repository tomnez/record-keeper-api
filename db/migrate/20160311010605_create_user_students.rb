class CreateUserStudents < ActiveRecord::Migration
  def change
    create_table :user_students do |t|

      t.timestamps null: false
    end
  end
end
