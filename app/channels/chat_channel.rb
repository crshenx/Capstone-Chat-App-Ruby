class ChatChannel < ApplicationCable::Channel
    def subscribed
      stream_from "chat_#{params[:room]}"  
    end

    def receive(data)
        puts current_user.id
        puts data['content']
        @message = Message.create(user_id: current_user.id, room_id:params[:room], content:data['content'])
        ActionCable.server.broadcast("chat_#{params[:room]}", {"message" => @message, "user" => @message.user})
    end

    def customevent(data)
        ActionCable.server.broadcast("chat_#{params[:rooms]}", data)
    end
end