class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :player_id
      t.string :name

      t.timestamps null: false
    end
  end
end
