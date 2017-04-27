class SongsController < ApplicationController
  before_action :set_song, only: [:show, :destroy]

  # GET /songs
  def index
    @songs = Song.where(playlist_id: params[:playlist_id]) 
  end

  # GET /songs/1
  def show
  end

  def all
    @songs = Song.all
  end

  # GET /songs/new
  def new
    @song = Song.new
    @song.playlist = Playlist.find(params[:playlist_id])
  end

  # POST /songs
  def create
    @song = Song.new(name: song_params[:name], artist_name: song_params[:artist_name])
    @song.playlist = Playlist.find(params[:playlist_id])
    @song.playlist.player = Player.find(params[:player_id])
    if (@song.in_spotify? && !@song.playlist.songs.include?(@song))
      @song.playlist.songs.append(@song)
      @song.save
      redirect_to player_playlist_songs_url(@song.playlist.player,  @song.playlist, @song)
    else
      render :new
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
    redirect_to player_playlist_songs_url(@song.playlist.player, @song.playlist)
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :playlist_id, :artist_name)
  end
end