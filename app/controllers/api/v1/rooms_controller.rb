class Api::V1::RoomsController < ApplicationController

  def index
    if current_user
      @current_user = current_user
    # redirect_to '/login' unless @current_user
      @rooms = Room.public_rooms
      render json: {rooms: @rooms}
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def create
    @room = Room.create(room_params)
    ActionCable.server.broadcast('rooms',{rooms: Room.public_rooms })
    render json: {room: @room}, status: :created
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    render json:  @room, status: :no_content
  end

  private 
    def room_params
      params.require(:room).permit(:name,:is_private)
    end
end
