class Api::V1::RoomsController < ApplicationController

  def index
    if current_user
      @current_user = current_user
    # redirect_to '/login' unless @current_user
      @rooms = Room.public_rooms
      @users = User.all_except(@current_user)
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    render :json { room: @room }, status: :created
  end

  def public_rooms
    
  end
end
