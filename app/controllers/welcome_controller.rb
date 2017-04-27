class WelcomeController < ApplicationController
def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    @spotify_email = @spotify_user.email
    new_player = Player.new(email: @spotify_email)
    new_player.save unless Player.exists?(email: @spotify_email)
    @playerid = (Player.find_by(email: @spotify_email)).id
    @tracks = @spotify_user.top_tracks(limit: 21, offset: 0, time_range: 'medium_term')
  end


end
