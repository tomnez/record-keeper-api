class Student < ActiveRecord::Base
  has_many :user_students
  has_many :users, through: :user_students
  has_many :records
end
