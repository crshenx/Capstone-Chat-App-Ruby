class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms"  
  end
    # def createparams
    #   Rooms.create(room_params)

    #   ActionCable.server.broadcast(rooms,)
    # end

    # private

    #   def room_params()
    #     params.require(:room).permit(:name, :is_private)
end