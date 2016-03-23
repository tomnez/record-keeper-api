require 'jsonapi-serializers'

class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :admin

  has_many :students

  def type
    "user"
  end

  def self_link
    "#{base_url}/#{type}s/#{id}"
  end
end
