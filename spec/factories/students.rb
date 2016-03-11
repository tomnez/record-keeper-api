# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    first_name "MyString"
    last_name "MyString"
    birthdate ""
    iep_date "2016-03-10"
    tx_frequency "MyString"
    primary_disability "MyString"
    secondary_disability "MyString"
    goals "MyText"
  end
end
