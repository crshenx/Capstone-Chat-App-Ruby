class FallbackController < ApplicationController
  skip_before_action :authorized
    def index
        render file: 'public/index.html'
      end
end
