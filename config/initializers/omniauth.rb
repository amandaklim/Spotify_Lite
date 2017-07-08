require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "<your_client_id>", "<your_client_secret>", scope: 'user-top-read user-read-private user-read-email playlist-modify-public user-library-read user-library-modify', show_dialog: 'true', callback_path: '/auth/spotify/callback'
end
