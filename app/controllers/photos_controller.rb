class PhotosController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :get_user, only: [:new, :create]
    def index
        @photos = Photo.where(mode: 0)
    end

    def new
        @photo = @user.photos.new
    end

    def create
        title = params[:photo][:title]
        description = params[:photo][:description]
        image = params[:photo][:image]
        mode = params[:photo][:mode].to_i
        @photo = @user.photos.new(title: title, description: description, image: image, mode: mode)
        if @photo.save
            redirect_to photos_path
        else
            render :new
        end
    end
    private
        def get_user
            @user = User.find(current_user.id)
        end
end
