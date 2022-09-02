module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    
    def connection
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        begin
          user_id = JWT.decode(cookies["X-Authorization"],"my_s3cr3t",true, algorithm:'HS256')[0]["user_id"]
        rescue JWT::DecodeError
          nil
        end

        if current_user = User.find_by(id:user_id)
          current_user
        else
          reject_unauthorized_connection
        end
      end
  end
end
