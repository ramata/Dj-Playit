class ArtistsController < ApplicationController
  # index
  def index
    @artists = Artist.all
  end

  # new
  def new
    @artist = Artist.new
  end

  # create
  def create
    # @artist = Artist.create!(artist_params)
    render text: params

    redirect_to "/artists/#{@artist.id}"
  end

  #show
  def show
    @artist = Artist.find(params[:id])
  end

  # edit
  def edit
    @artist = Artist.find(params[:id])
  end


  # update
  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)

    redirect_to "/artists/#{@artist.id}"
  end

  # destroy
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to "/artists"
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end
