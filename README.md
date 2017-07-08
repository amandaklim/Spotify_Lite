# Spotify Lite

### Description
Spotify Lite is an app that allows users to log-in to their respective Spotify accounts, view their current top tracks and current top recommendations, create playlists, add songs to playlists, and view song recommendations to a playlist. A user can listen to songs, delete playlists, and delete songs from a playlist. 

### Information
This app uses https://github.com/guilhermesad/rspotify, a wrapper for the Spotify API for Ruby.

### Gems
To run locally, run 'gem install bundler' or 'bundle install'. This will install all gems listed in your 'Gemfile'.

### To execute the program
1. Access your Spotify Developer credentials [here](https://developer.spotify.com/my-applications).
2. Replace "<your_client_id>" and "<your_client_secret>" with your credentials in the following files.

```ruby
# config/application.rb

RSpotify::authenticate("<your_client_id>", "<your_client_secret>")
```

```ruby
# config/initializers/omniauth.rb

require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "<your_client_id>", "<your_client_secret>", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
```
3. Run `$ rake db:migrate` in the root directory of the project.
4. Next, execute `$ rails s` to start the server.
5. Navigate to `http://localhost:3000` on your browser. 

