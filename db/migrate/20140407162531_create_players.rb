class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, {id: false, primary_key: :playerid} do |t|
      t.string :playerid
      t.integer :birthyear
      t.string :namefirst
      t.string :namelast
      t.timestamps
    end
  end
end
