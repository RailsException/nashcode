# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

#INSERT INTO PLAYERS TABLES
csv_data =CSV.read("#{File.dirname(__FILE__)}/Master-small.csv")
headers=csv_data.shift.map{|i| i.to_s}
s_data=csv_data.map {|row| row.map {|cell| cell.to_s }}
hash_data=s_data.map {|row| Hash[*headers.zip(row).flatten]}

hash_data.each do |row|
	if !Player.exists?(:playerid => row['playerID'])

		if  !row['playerID'].blank?

			p=Player.new
			p.playerid=row['playerID']
			p.birthyear=row['birthYear']
			p.namefirst=row['nameFirst']
			p.namelast=row['nameLast']
			if p.save!  #just ignoring if not saved.. 
			end
		end
	end
end


#REMOVE AND INSERT INTO BATTING TABLE.
Batting.delete_all
csv_data =CSV.read("#{File.dirname(__FILE__)}/Batting-07-12.csv")
headers=csv_data.shift.map{|i| i.to_s}
s_data=csv_data.map {|row| row.map {|cell| cell.to_s }}
s_data.each { |row|
	(5..13).each do |i|
		row[i] = row[i].blank? ? 0 : row[i]
	end
 }

hash_data=s_data.map {|row| Hash[*headers.zip(row).flatten]}

hash_data.each do |row|
	if !row['playerID'].nil? 
		#player=Player.find_by_playerid(row['playerid'])
			B = Batting.new
			B.player_id = row['playerID']
			B.yearid=row['yearID']
			B.league=row['league']
			B.teamid=row['teamID']
			B.games=row['G']
			B.bats=row['AB']
			B.runs=row['R']
			B.hits=row['H']
			B.doubles=row['2B']
			B.triples=row['3B']
			B.hr=row['HR']
			B.rbi=row['RBI']
			B.sb=row['SB']
			B.cs=row['CS']
			if B.save!
			end
	end 


end