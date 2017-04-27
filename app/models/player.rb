class Player < ActiveRecord::Base
  has_many :playlists, class_name: 'Playlist', dependent: :destroy
  validates :email, presence: true

  def add_playlist(player_params)
    playlist_fields = player_params[:playlist_attributes]
    new_playlist = Playlist.new(playlist_fields)
    new_playlist.player = self
    playlists.append(new_playlist) unless playlists.include? new_playlist
    new_playlist.save
  end
end
