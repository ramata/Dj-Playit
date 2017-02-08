class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  # new
  def new
    # @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  # create
  def create
    # @artist = Artist.find(params[:artist_id])
    @song = Song.create!(params[:id])
    redirect_to songs_path
    # redirect_to artist_song_path(@artist, @song)
  end

  #show
  def show
    @song = Song.find(params[:id])
  end

  # edit
  def edit
    @song = Song.find(params[:id])
    # @song.edit(params[:id])
    redirect_to songs_path
  end

  # update
  def update
    @song = Song.find(params[:id])
    # @artist = Artist.find(params[:artist_id])
    @song.update(song_params)
    redirect_to songs_path
  end

  # destroy
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id, :comment_id)
  end
end
