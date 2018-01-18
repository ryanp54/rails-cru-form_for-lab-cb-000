class GenresController < ApplicationController
	def index
		@genres = Genre.all
	end
	def show
		@genre = Genre.find(params.require(:id))
	end
	def new
		@genre = Genre.new
	end
	def create
		@genre = Genre.create(params.require(:genre).permit(:name))
		redirect_to genre_path(@genre)
	end
	def edit
		@genre = Genre.find(params.require(:id))
		render 'new'
	end
	def update
		@genre = Genre.find(params.require(:id))
		@genre.update(params.require(:genre).permit(:name))
		redirect_to genre_path(@genre)
	end
end
