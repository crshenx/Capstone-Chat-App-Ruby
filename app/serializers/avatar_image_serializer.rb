class AvatarImageSerializer < ActiveModel::Serializer
  #This may need to be handled in routes
  #include Rails.application.routes.url_helpers
  attributes :id, :picture
  has_one :user

  def picture
    rails_blob_path(object.picture, only_path: true) if object.picture.attached?
  end
end
