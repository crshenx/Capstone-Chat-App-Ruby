class Api::V1::MessagesController < ApplicationController

    def create 
        @message = Message.create(message_params)
        @room = Room.find(@message[:room_id])
        # RoomsChannel.broadcast_to(@room,@message)
        render json: @message
    end

    def index
        @messages = Message.where(room_id:params[:roomID])
       render json: @messages
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        #  only destroy if the user is the creator of the message        
        render json: @message, status: :no_content
    end
end
