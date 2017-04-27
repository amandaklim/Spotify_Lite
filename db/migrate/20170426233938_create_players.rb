class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
