class PhotosController < ApplicationController
    def index
        @photos = Photo.where(mode: "public_mode")
    end

    def new
        @photo = current_user.photos.new
    end

    def create
        params[:photo][:mode] = params[:photo][:mode].to_i 
        @photo = current_user.photos.new(photo_params)
        if @photo.save
            redirect_to photos_path
        else
            render :new
        end
    end

    def edit
    end

    def update 
    end
    private
        def photo_params
            params.require(:photo).permit!
        end
end
