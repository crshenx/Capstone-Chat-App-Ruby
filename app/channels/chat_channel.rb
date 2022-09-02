class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_#{params[:room]}"  
    end

    def recieve(data)
        ActionCable.server.broadcast("chat#{params:rooms}")
    end
end