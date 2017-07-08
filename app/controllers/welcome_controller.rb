class WelcomeController < ApplicationController
def spotify
  @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  @tracks = @spotify_user.top_tracks(limit: 21, offset: 0, time_range: 'medium_term')
  @spotify_email = @spotify_user.email
  genre = @tracks[0].artists[0].genres[0]
  recommendations = RSpotify::Recommendations.generate(limit: 21, seed_tracks: [@tracks[0].id], seed_artists: [@tracks[1].artists[0].id], seed_genres: [@tracks[2].artists[0].genres[0]]) unless @tracks.empty?
  recommendations = RSpotify::Recommendations.generate(limit: 21, seed_genres: ['pop']) if @tracks.empty?
  @r_tracks = recommendations.tracks
  new_player = Player.new(email: @spotify_email)
  new_player.save unless Player.exists?(email: @spotify_email)
  @playerid = (Player.find_by(email: @spotify_email)).id
  end
end
