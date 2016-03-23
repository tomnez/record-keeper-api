class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records, id: :uuid do |t|
      t.uuid :student_id
      t.datetime :date
      t.string :attendance
      t.datetime :time_in
      t.datetime :time_out
      t.string :hw
      t.string :activity
      t.string :final_data
      t.timestamps null: false
    end

    add_index :records, :student_id
  end
end
