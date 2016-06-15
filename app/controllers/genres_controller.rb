class GenresController < ApplicationController
  def index
    @genres = Genre.all.sort_by { |genre| genre.songs.size }.reverse
  end

  def show
    @genre = Genre.find( params[:id] )
  end
end
