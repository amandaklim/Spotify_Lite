require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "2920a92ec30342ef9e2f04ebaeb98d28", "5d8597c48e2247c99a156d9635afae6e", scope: 'user-top-read user-read-private user-read-email playlist-modify-public user-library-read user-library-modify', show_dialog: 'true', callback_path: '/auth/spotify/callback'
end