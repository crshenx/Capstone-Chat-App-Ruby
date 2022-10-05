class UserSerializer < ActiveModel::Serializer
  # may need to add :picture symbol for response
  include Rails.application.routes.url_helpers
  attributes :username, :avatar, :bio,



  def picture
    # variant = object.picture.variant(resize:"100x100")
    # return rails_representation_url(variant, only_path: true)
    rails_blob_url(object.picture, only_path: true)
  end

end
