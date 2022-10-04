class UserSerializer < ActiveModel::Serializer
  # may need to add :picture symbol for response
  attributes :username, :avatar, :bio,



  def picture
    Rails.application.routes.url_helpers.rails_blob_path(object.picture, only_path: true)
  end

end
