class Api::V1::FallbackController < ApplicationController
    def index
        render file: 'public/index.html'
      end
end
