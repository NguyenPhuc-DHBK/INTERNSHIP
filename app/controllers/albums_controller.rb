class AlbumsController < ApplicationController
    def index
        @albums = Album.where(mode: "public_mode")
    end

    def new 
        @album = current_user.albums.new
    end

    def create
        params[:album][:mode] = params[:album][:mode].to_i
        @album = current_user.albums.new(album_params)
        if @album.save
            flash[:success] = "Photo has been uploaded!"
            redirect_to new_album_path
        else
            flash[:error] = "Error upload"
            render :new
        end
    end
    private 
        def album_params 
            params.require(:album).permit!
        end
end
