class SongsController < ApplicationController

	def index
		@songs = Song.all
	end
	def show
		@song = Song.find(params.require(:id))
	end
	def new
		@song = Song.new
	end
	def create
		@song = Song.create(params.require(:song).permit(:name))
		@song.artist = Artist.find(params[:song][:artist_id])
		@song.genre = Genre.find(params[:song][:genre_id])
		@song.save
		redirect_to song_path(@song)
	end
	def edit
		@song = Song.find(params.require(:id))
		render 'new'
	end
	def update
		@song = Song.find(params.require(:id))
		@song.update(params.require(:song).permit(:name))
		redirect_to song_path(@song)
	end
end
