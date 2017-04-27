SpotifyJukebox::Application.routes.draw do
  resources :players do 
    resources :recommendations
    resources :playlists do
      resources :songs
    end
  end
  root 'welcome#index'
  resources :artists
  post '/songs' => 'songs#create'
  get '/playlists/spotify' => 'playlists#spotify'
  get '/auth/spotify/callback', to: 'welcome#spotify'
end
