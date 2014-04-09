class Batting < ActiveRecord::Base
  attr_accessible :bats, :cs, :doubles, :games, :hr, :league, :player_id, :rbi, :runs, :sb, :teamid, :triples, :yearid

  belongs_to :player, :foreign_key => :player_id



   scope :sluggingp, lambda {|teamid='OAK', yearid=2007| 
  	select("players.namefirst, players.namelast, 
  			sum(hits) as hits
  			, sum(bats) as bats
			, sum(runs) as runs
			, sum(hits) as hits
			, sum(doubles) as doubles
			, sum(triples) as triples
			, sum(hr) as hr
			, sum(rbi) as rbi
			, sum(sb) as sb
			, sum(cs) as cs
		").joins(:player).where("yearid = #{yearid} and teamid='#{teamid}'").group(:player_id) 
   }


    scope :crownquery,
    select("battings.*,players.namefirst
    ").joins(:player).where("league ='AL' and yearid = 2012 ")



	 def self.getmaxHR(hrm=0,rbim=0)
 		where("hr >= #{hrm} and rbi >= #{rbim}")
	end

	  #b.searchbyhr(b.maximum('hr')).searchbyrbi(b.maximum('rbi'))
	 def self.getBattingAvg(query)
	    where("(([hits]+0.0) / ([bats]+0.0)) >= #{query}")
	 end

  
end
