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

### User Manual
1. Main page that appears when you first navigate to http://localhost:3000
<img width="1280" alt="s1" src="https://user-images.githubusercontent.com/22601709/27989536-b7f27df0-6408-11e7-9c5a-eef402ead523.png">

2. When you click Login, you get navigated to the following page which allows you to login to your account or create a Spotify Account.
<img width="1280" alt="ss" src="https://user-images.githubusercontent.com/22601709/27989585-b12d8f72-6409-11e7-9a83-3efca3f91b17.png">

3. If you press Log In to Spotify, you will be presented with the following page.
<img width="1280" alt="correct" src="https://user-images.githubusercontent.com/22601709/27989619-b6c32d1a-640a-11e7-8144-84ddea68510e.png">

4. After you log in or create your account, you will be redirected to the following page. The home page will show you 21 of your current top tracks or 21 song suggestions if you are a new user. 
<img width="1280" alt="s3" src="https://user-images.githubusercontent.com/22601709/27989538-b804ddec-6408-11e7-8a1b-f1c71708d3aa.png">
<img width="1280" alt="s4" src="https://user-images.githubusercontent.com/22601709/27989539-b8083f50-6408-11e7-82e5-9ddcf2c6faa9.png">

5. On my page "My Playlists", you will be able to create, edit, view, and delete playlists.
<img width="1280" alt="new" src="https://user-images.githubusercontent.com/22601709/27989620-b96cb900-640a-11e7-98a4-8f4e0700f1e5.png">

6. When you click "New Playlist" the following page will appear where you can name your playlist.
<img width="1280" alt="new2" src="https://user-images.githubusercontent.com/22601709/27989621-b97c36e6-640a-11e7-8c9e-f25e2df46d52.png">

7. Once created, you can view, edit, or delete your playlist from the "My Playlist" page.
<img width="1280" alt="s5" src="https://user-images.githubusercontent.com/22601709/27989540-b808e6a8-6408-11e7-95da-43c08d6b79db.png">

8. "Edit" allows you to rename your playlist.
<img width="1280" alt="s6" src="https://user-images.githubusercontent.com/22601709/27989541-b80cd506-6408-11e7-8253-d9b013ebe4f8.png">

9. "Show" allows you to add songs to your playlist. You will be redirected to the following page.
<img width="1280" alt="s7" src="https://user-images.githubusercontent.com/22601709/27989542-b80dc588-6408-11e7-9af3-c2c3227dcea0.png">

10. When you click "New Song" you can type in a song name with an artist name to add the song to the playlist.
<img width="1280" alt="s8" src="https://user-images.githubusercontent.com/22601709/27989543-b812b91c-6408-11e7-8a4e-ca6913d5e860.png">

11. After clicking "Create Song" you will be redirected back to the playlist show page. Underneath the playlist, will be a list of 21 song recommendations based on your most recently added track to the playlist.
<img width="1280" alt="s9" src="https://user-images.githubusercontent.com/22601709/27989545-b8194624-6408-11e7-97bb-909a8e1fbc58.png">
<img width="1280" alt="s10" src="https://user-images.githubusercontent.com/22601709/27989546-b81b93ac-6408-11e7-9ef3-e6882186dd2a.png">

12. Adding another track will generate new recommendations based on that track.
<img width="1280" alt="s11" src="https://user-images.githubusercontent.com/22601709/27989544-b817fde6-6408-11e7-9239-c85d44fe0af8.png">
<img width="1280" alt="s12" src="https://user-images.githubusercontent.com/22601709/27989548-b81f03fc-6408-11e7-8a3f-098e847c486e.png">
<img width="1280" alt="s13" src="https://user-images.githubusercontent.com/22601709/27989547-b81d3e5a-6408-11e7-9ad5-d76fbe9adfb5.png">

13. Clicking "My Account" will redirect you to your spotify account page where you can log out. 
<img width="1280" alt="s14" src="https://user-images.githubusercontent.com/22601709/27989549-b827215e-6408-11e7-87ed-8cae6fab2d81.png">
