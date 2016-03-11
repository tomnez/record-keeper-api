class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.date :iep_date
      t.string :tx_frequency
      t.string :primary_disability
      t.string :secondary_disability
      t.text :goals

      t.timestamps null: false
    end
  end
end
