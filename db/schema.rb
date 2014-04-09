# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140407163030) do

  create_table "battings", :force => true do |t|
    t.string   "player_id"
    t.integer  "yearid"
    t.string   "league"
    t.string   "teamid"
    t.integer  "games"
    t.integer  "bats"
    t.integer  "runs"
    t.integer  "hits"
    t.integer  "doubles"
    t.integer  "triples"
    t.integer  "hr"
    t.integer  "rbi"
    t.integer  "sb"
    t.integer  "cs"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "battings", ["player_id"], :name => "index_battings_on_player_id"

  create_table "players", :id => false, :force => true do |t|
    t.string   "playerid"
    t.integer  "birthyear"
    t.string   "namefirst"
    t.string   "namelast"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
