require 'jsonapi-serializers'

class RecordSerializer
  include JSONAPI::Serializer

  attributes :student_id, :date, :attendance, :time_in, :time_out, :hw, :activity, :final_data

  has_one :student

  def type
    "record"
  end

  def self_link
    "#{base_url}/#{type}s/#{id}"
  end
end
