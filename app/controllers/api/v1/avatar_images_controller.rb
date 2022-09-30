class Api::V1::AvatarImagesController < ApplicationController
    #has_one_attached :picture
    
    def index
        render json: AvatarImage.all
    end

    def create
        image = AvatarImage.create(image_params)
        puts image
        render json: image, status: :created
    end

    private

    def image_params
        params.require(:user).permit(picture: [:name,:file])
    end

end
