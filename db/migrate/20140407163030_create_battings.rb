class CreateBattings < ActiveRecord::Migration
  def up
    create_table :battings do |t|
      t.string :player_id
      t.integer :yearid
      t.string :league
      t.string :teamid
      t.integer :games
      t.integer :bats
      t.integer :runs
      t.integer :hits
      t.integer :doubles
      t.integer :triples
      t.integer :hr
      t.integer :rbi
      t.integer :sb
      t.integer :cs

      t.timestamps
    end
    add_index :battings, :player_id
  end

  def down
    drop_table :battings
  end

end
