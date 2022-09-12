class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_#{params[:room]}"  
    end

    def receive(data)
        @message = Message.create(user_id: @current_user, room_id:params[:room], content:data[:content])
        ActionCable.server.broadcast("chat_#{params[:room]}", @message)
    end

    def customevent(data)
        ActionCable.server.broadcast("chat_#{params[:rooms]}", data)
    end
end