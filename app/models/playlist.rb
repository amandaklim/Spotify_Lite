class Playlist < ActiveRecord::Base
  belongs_to :player, class_name: 'Player'
  has_many :songs, class_name: 'Song', dependent: :destroy
  validates :name, presence: true, uniqueness: :true

    def add_player(playlist_params)
    playerid = playlist_params[:player_id]
    self.player = player_to_add
    self.player.playlist.append(self) unless self.player.playlist.include? self
    save
  end

    def add_song(playlist_params)
    song_fields = playlist_params[:song_attributes]
    new_song = Song.new(song_fields)
    new_song.playlist = self
    if new_song.in_spotify? && self.in_spotify?
      songs.append(new_song) unless songs.include? new_song
      new_song.save
      true
    else
      false
    end
  end
end
