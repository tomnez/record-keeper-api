require 'jsonapi-serializers'

class StudentSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :birthdate, :iep_date, :tx_frequency, :primary_disability, :secondary_disability, :goals

  has_many :users

  def type
    "student"
  end

  def self_link
    "#{base_url}/#{type}s/#{id}"
  end
end
