require 'jsonapi-serializers'

class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :admin

  has_many :students

  def type
    "user" # Ember JSONAPIAdapter wants singular. Boo urns.
  end

  def self_link
    "#{base_url}/#{type}s/#{id}" # Aaaand re-add the pluralization for relationship links.
  end
end
