class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :unprocessable_entity
    end
  end

  def attach
    #data:image/jpeg;base64,.....
    # args = params[:picture].split(',')
    # content_type = args[0].split(';')[0].split(':')[1]
    # puts(content_type)
    # file_ext = content_type.split("/")[1]
    # contents = args[1]
    # puts(file_ext)
    # blob =  ActiveStorage::Blob.create_and_upload!(
    #   io: StringIO.new(Base64.decode64(contents)),
    #   filename: "user." + file_ext,
    #   content_type: content_type
    # )


    

    
    

    # puts blob.class

    current_user.picture.attach(params[:picture])
    render json: current_user, status: :created

    # if current_user.picture.attached?
    # else
    #   render json: { error: 'picture not uploaded'}, status: :unprocessable_entity
    # end
  end
  

  private

  #maybe need to add picture to permit 

    def user_params
      params.require(:user).permit(:username, :password, :bio, :avatar)
    end
  end
