require 'jsonapi-serializers'

class UserSerializer
  include JSONAPI::Serializer

  attributes :email, :admin

  def type
    "user" # Ember JSONAPIAdapter wants singular. Boo urns.
  end
end
