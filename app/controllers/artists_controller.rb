class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
	end
	def show
		@artist = Artist.find(params.require(:id))
	end
	def new
		@artist = Artist.new
	end
	def create
		@artist = Artist.create(params.require(:artist).permit(:name, :bio))
		redirect_to artist_path(@artist)
	end
	def edit
		@artist = Artist.find(params.require(:id))
		render 'new'
	end
	def update
		@artist = Artist.find(params.require(:id))
		@artist.update(params.require(:artist).permit(:name, :bio))
		redirect_to artist_path(@artist)
	end

end
