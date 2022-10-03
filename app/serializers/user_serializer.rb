class UserSerializer < ActiveModel::Serializer
  # may need to add :picture symbol for response
  attributes :username, :avatar, :bio, :avatar
end
