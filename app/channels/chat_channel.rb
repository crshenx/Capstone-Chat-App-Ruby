class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_#{params[:room]}"  
    end

    def receive(data)
        ActionCable.server.broadcast("chat_#{params[:room]}", data)
    end

    def customevent(data)
        ActionCable.server.broadcast("chat_#{params[:rooms]}", data)
    end
end