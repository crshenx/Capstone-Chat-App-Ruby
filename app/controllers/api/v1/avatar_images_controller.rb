class Api::V1::AvatarImagesController < ApplicationController
    # has_one_attached :picture
    
    def index
        render json: AvatarImage.all.with_attached_attachment.order(id: :desc)
    end

    def create
        image = AvatarImage.create(image_params)
        render json: image, status: :created
    end

    private

    def image_params
        params.require(:avatar_image).permit(:picture)
    end

end
