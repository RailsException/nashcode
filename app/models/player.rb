class Player < ActiveRecord::Base
  attr_accessible :birthyear, :namefirst, :namelast, :playerid

  set_primary_key :playerid

  has_many :battings
end
