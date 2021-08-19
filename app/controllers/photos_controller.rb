class PhotosController < ApplicationController
    before_action :get_photo, only: [:edit, :update, :destroy]
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
            flash[:error] = "Error adding photos!"
            render :new
        end
    end

    def edit
    end

    def update 
        params[:photo][:mode] = params[:photo][:mode].to_i 
       if @photo.update(photo_params)
        redirect_to pages_path
       else
        flash[:error] = "Error edited!"
        redirect_to :edit
       end
    end

    def destroy
        if @photo.destroy
            flash[:success] = "Photo has been deleted!"
            redirect_to pages_path
        else
            flash[:error] = "Error delete"
            render :edit
        end
    end

    private
        def photo_params
            params.require(:photo).permit!
        end

        def get_photo
            @photo = current_user.photos.find(params[:id])
        end
end
