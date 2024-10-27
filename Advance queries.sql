use fantasysportsleaguedb;

select * from user;
select * from teams;
/*Fetch all users and their corresponding fantasy teams.*/
Select u.username, t.team_name, t.total_points
from user u
join teams t on u.user_id= t.user_id;


/*Find the top 5 teams by total points.*/
select team_name, total_points 
from teams 
order by total_points desc
limit 5;

select * from players;
/*List all the players in a specific fantasy team (e.g., team_id = 1).*/
select 	p.player_name, p.Position , p.nationality
from fantasyteamplayer ftp
join players p on ftp.player_id = p.player_id
where ftp.team_id=1



select * from points;
/*Retrieve the total points earned by a specific fantasy team in a specific match.*/
select  t.team_name, sum(p.points_earned) as total_points
from fantasyteamplayer ftp
join points p on ftp.player_id = p.player_id AND ftp.match_id = p.match_id
join teams t on t.team_id = ftp.team_id
where ftp.team_id = 1 and ftp.match_id=1
group by t.team_name;





/*Find all players who earned more than 100 points in any match*/

select p.player_name , pts.points_earned, pts.match_id
from players p
join points pts on p.player_id= pts.player_id
where points_earned > 100;

/*Get the count of matches played by a specific player.*/
select p.player_name , count(ftp.match_id) as matches_played
from fantasyteamplayer ftp 
join players p on p.player_id = ftp.player_id
where p.player_id = 1
group by p.player_name;


/*Calculate the total points earned by a player across all matches.*/

select p.player_name , SUM(pts.points_earned) as total_points
from players p
join points pts on pts.player_id = p.player_id
where p.player_id = 2
group by p.player_name;
	select * from matches;
/*List all matches along with the teams that played and the match status.*/
select m.match_status , m.match_id , m.match_date , t1.team_name as team_1 , t2.team_name as team_2
from matches m
join teams t1 on m.team_1 = t1.team_id
join teams t2 on m.team_2= t2.team_id;



/*Find the highest-ranking team and its total points.*/
SELECT t.team_name, SUM(p.points_earned) AS total_points
FROM teams t
JOIN fantasyteamplayer ftp ON t.team_id = ftp.team_id
JOIN points p ON ftp.player_id = p.player_id AND ftp.match_id = p.match_id
GROUP BY t.team_name
ORDER BY total_points DESC
LIMIT 1;


/*List all players from a specific country (e.g., India) and their positions.*/
select p.player_name , p.position
from players p
where nationality = "india";

/*Retrieve the fantasy team with the most points in a specific match.*/
SELECT t.team_name, SUM(p.points_earned) AS total_points
FROM fantasyteamplayer ftp
JOIN points p ON ftp.player_id = p.player_id AND ftp.match_id = p.match_id
JOIN teams t ON ftp.team_id = t.team_id
WHERE ftp.match_id = 1  -- Replace 1 with the specific match_id
GROUP BY t.team_name
ORDER BY total_points DESC
LIMIT 1; 


/*Fetch the fantasy team that has the most number of players flagged as captains.*/
select t.team_name , count(*) as captain_count
from fantasyteamplayer ftp
join teams t on ftp.team_id = t.team_id 
where ftp.captain_flag= 1
group by t.team_name
order by captain_count desc
limit 1;

/*Get a list of all fantasy teams along with their ranks.*/
select t.team_name , sum(points_earned) as total_points
from fantasyteamplayer ftp 
join points p on ftp.player_id =p.player_id and ftp.match_id = p.match_id
join teams t on ftp.team_id = t.team_id
group by t.team_name
order by total_points desc;

/*List all fantasy teams that have players with more than 100 total points earned.*/
select distinct t.team_name
from teams t 
join fantasyteamplayer ftp on t.team_id = ftp.team_id
join points p on ftp.player_id = p.player_id AND ftp.match_id = p.match_id
group by ftp.player_id , t.team_name
having sum(p.points_earned)>100;



/*Fetch all completed matches along with the venue and match date.*/
SELECT match_id, match_date, venue
FROM  matches
WHERE match_status = 'completed';


/*Get the top 10 players based on total points earned across all matches.*/
select p.player_name , sum(points_earned) as total_points 
from players p 
join points pts on p.player_id = pts.player_id 
join matches m on pts.match_id = m.match_id
where match_status = "completed"
group by p.player_id
order by total_points desc
limit 10;

/*Find the number of players in each fantasy team.*/
select t.team_id , t.team_name ,count(ftp.player_id)  as no_of_players
from fantasyteamplayer ftp
join teams t on t.team_id = ftp.team_id
group by t.team_id , t.team_name
order by t.team_id;


select * from teams;
select * from players;
select * from points;
/*List all fantasy teams along with their total points earned from players in all matches.*/
select t.team_name , t.team_id, sum(points_earned) as total_points 
from fantasyteamplayer ftp
join points pts on ftp.player_id = pts.player_id
join teams t on ftp.team_id= t.team_id
group by t.team_name , t.team_id;

/*Retrieve the number of matches scheduled for a specific venue.*/
select * from matches;
select count(match_id) as total_matches
from matches
where venue = "Lord's";


/*Find players who have played for more than one fantasy team.*/
select p.player_name , p.player_id , count(t.team_id) as team_count
from players p 
join fantasyteamplayer  ftp on p.player_id = ftp.player_id 
join teams t on t.team_id = ftp.team_id
group by p.player_id , p.player_name 
having count(t.team_id)>1; 

