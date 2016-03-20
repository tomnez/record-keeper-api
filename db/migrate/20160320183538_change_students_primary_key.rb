class ChangeStudentsPrimaryKey < ActiveRecord::Migration
  def change
    add_column :students, :uuid, :uuid, default: "uuid_generate_v4()", null: false

    change_table :students do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE students ADD PRIMARY KEY (id);"
  end
end
