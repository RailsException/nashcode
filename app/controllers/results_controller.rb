class ResultsController < ApplicationController
  def index
  end

  def battingavg
  	@battingAvg = Batting.where("yearid > 2008 and yearid < 2012 and hits >= 200").average("(([hits]+0.0) / ([bats]+0.0))" )
  end

  def slugging
  			@slugging = Batting.sluggingp
  end

  def crownwinner
  	b = Batting.crownquery
  		@crownwinner= b.getmaxHR(b.maximum('hr'),b.maximum('rbi')).getBattingAvg(b.average("([hits]+0.0) / ([bats]+0.0)")).joins(:player).map
     
  		
  end
end


 