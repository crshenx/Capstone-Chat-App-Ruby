class UserSerializer < ActiveModel::Serializer
  # may need to add :picture symbol for response
  attributes :username, :avatar, :bio,  :picture



  def picture
    rails_blob_path(object.picture, only_path: true) if object.picture.attached?
  end

end
