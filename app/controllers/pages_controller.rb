class PagesController < ApplicationController
    def index
        @photos = current_user.photos.all
    end
end
