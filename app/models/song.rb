class Song < ActiveRecord::Base
  belongs_to :playlist, class_name: 'Playlist'
  validates :name, presence: true
  validates :artist_name, presence: true

  def in_spotify?
    data = JSON.parse(open("https://api.spotify.com/v1/search?q=#{song_search}&type=track").read)
    tracks_data = data['tracks']
    !tracks_data['items'].empty?
  end

  def song_search
    new_song_name = name.gsub(/\s+/, '+')
    new_artist_name = artist_name.gsub(/\s+/, '+')
    new_song_name + '+' + new_artist_name
  end

  def spotify_uri
    data = JSON.parse(open("https://api.spotify.com/v1/search?q=#{song_search}&type=track").read)
    return nil unless in_spotify?
    return data['tracks']['items'][0]['uri'] unless data['tracks']['items'][0]['uri'].empty?
    return nil if data['tracks']['items'][0]['uri'].empty?
  end

  def add_playlist(song_params)
    playlist_to_add = Playlist.find(song_params[:playlist_id])
    self.playlist = playlist_to_add
    if in_spotify?
      playlist.songs.append(self) unless playlist.songs.include? self
      save
      return true
    end
    false
  end
end
