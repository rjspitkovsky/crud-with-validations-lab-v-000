class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  def song_params(*args) 
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)


end
