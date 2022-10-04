class UserSerializer < ActiveModel::Serializer
  # may need to add :picture symbol for response
  include Rails.application.routes.url_helpers
  attributes :username, :avatar, :bio,



  def picture
    rails_blob_url(object.picture, only_path:true) if object.picture.attached?
  end

end
