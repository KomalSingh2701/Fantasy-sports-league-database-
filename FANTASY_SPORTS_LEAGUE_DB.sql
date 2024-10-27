CREATE DATABASE FantasySportsLeagueDB;
USE FantasySportsLeagueDB;
CREATE TABLE USER(
user_id 	INT PRIMARY KEY,
username	VARCHAR	(50),
email	VARCHAR (50),
password	VARCHAR	(15),
created_at	TIMESTAMP 
);
drop table teams;
CREATE TABLE Teams (
team_id 	INT	 PRIMARY KEY,
team_name	VARCHAR	(50),
user_id 	INT	,
total_points	INT,
FOREIGN KEY (user_id)  REFERENCES USER (user_id)
);

CREATE TABLE Players(
player_id 	INT	PRIMARY KEY,
player_name	VARCHAR	(50),
team_name	VARCHAR (50),	
position	VARCHAR (20),
nationality VARCHAR	(20),
status	VARCHAR (20)
);

CREATE TABLE Matches(
match_id 	INT	PRIMARY KEY,
match_date	DATE,
team_1	VARCHAR	(20),
team_2	VARCHAR	(20),
venue	VARCHAR	(20),
match_status	VARCHAR (20)
);

drop table FantasyTeamPlayer;
CREATE TABLE FantasyTeamPlayer(
fantasy_team_player_id 	INT	PRIMARY KEY,
team_id int,
player_id 	INT ,
match_id 	INT,
captain_flag	BOOLEAN,
FOREIGN KEY (player_id)  REFERENCES Players (player_id),
FOREIGN KEY (match_id)  REFERENCES Matches (match_id)
);

alter table FantasyTeamPlayer
add column team_id int;

CREATE TABLE Points(
point_id 	INT	PRIMARY KEY,
player_id 	INT	,
match_id 	INT	,
points_earned	INT,
FOREIGN KEY (player_id)  REFERENCES Players (player_id),
FOREIGN KEY (match_id)  REFERENCES Matches (match_id)
);


CREATE TABLE ScoringRules(
rule_id	INT	PRIMARY KEY ,
event	VARCHAR	(50),
points_awarded	INT);


CREATE TABLE Rankings(
ranking_id 	INT	PRIMARY KEY ,
team_id	INT	,
ranks	INT	,
total_points INT,
FOREIGN KEY (team_id)  REFERENCES Teams (team_id)
);

INSERT INTO User (user_id,	username,	email,	password, created_at)
VALUES
(1,	"KomalSingh",	"komal@example.com",	"pass123"	,"2024-01-10 10:00:00"),
(2,	"JohnDoe",	"john@example.com",	",doe123",	"2024-01-11 11:00:00"),
(3,	"JaneDoe",	"jane@example.com",	"janedoe123",	"2024-01-12 12:00:00"),
(4,	"MikeTyson",	"mike@example.com",	"mike456",	"2024-01-14 14:00:00"),
(5,	"SarahConnor",	"sarah@example.com",	"terminator",	"2024-01-16 16:30:00"),
(6,	"PeterParker",	"peter@example.com",	"spiderman12",	"2024-02-01 09:45:00"),
(7,"BruceWayne",	"bruce@example.com",	"gotham123",	"2024-02-05 10:00:00"),
(8,	"ClarkKent",	"clark@example.com",	"superman456",	"2024-02-08 14:15:00"),
(9,"TonyStark",	"tony@example.com", "ironman789",	"2024-02-12 16:00:00"),
(10,	"NatashaRomanoff",	"natasha@example.com","blackwidow",	"2024-02-15 18:00:00");

INSERT INTO Teams 
VALUES
(1,	"KomalWarriors"	,1,	1050),
(2,	"John's Giants", 2,	980),
(3,	"Jane's Legends",	3,	1020),
(4,	"Mike's Knockout",	4,	950),
(5,	"Sarah's Warriors",	5,	990),
(6,	"Spidey's Strikers",	6,	1025),
(7,	"Bruce's Defenders",	7,	1000),
(8,	"Superman's Saviors",	8,	1010),
(9,	"Stark's Engineers",	9,	1030),
(10,	"Widow's Shadow",	10,	985);

INSERT INTO PLAYERS
VALUES 
(1,	"Virat Kohli",	"India",	"Batter",	"India",	"Active"),
(2,	"Ben Stokes",	"England"	,"All-rounder",	"England",	"Active"),
(3,	"Babar Azam",	"Pakistan",	"Batter",	"Pakistan",	"Active"),
(4,	"Jasprit Bumrah",	"India",	"Bowler",	"India",	"Active"),
(5,	"Rashid Khan",	"Afghanistan",	"Bowler",	"Afghanistan",	"Active"),
(6,	"Kane Williamson",	"New Zealand",	"Batter",	"New Zealand",	"Injured"),
(7,	"Joe Root",	"England",  "Batter",	"England",	"Active"),
(8,	"Pat Cummins",	"Australia",	"Bowler",	"Australia",	"Active"),
(9,	"Rohit Sharma",	"India",	"Batter",	"India",	"Active"),
(10,	"David Warner",	"Australia",	"Batter",	"Australia",	"Active"),
(11,	"Kagiso Rabada",	"South Africa",		"Bowler",	"South Africa",	"Active"),
(12,	"Mitchell Starc",	"Australia",	"Bowler",	"Australia",	"Active"),
(13,	"Shakib Al Hasan",	"Bangladesh",	"All-rounder"	,"Bangladesh",	"Active"),
(14,	"Trent Boult",	"New Zealand",	"Bowler",	"New Zealand",	"Active"),
(15,	"Faf du Plessis",	"South Africa",	"Batter",	"South Africa",	"Retired");


INSERT INTO Matches
VALUES
(1,	"2024-10-10",	"India",	"Pakistan",	"Mumbai Stadium",	"Completed"),
(2,	"2024-10-12",	"England",	"Australia",	"Lord's"	,"Scheduled"),
(3,	"2024-10-15",	"New Zealand",	"South Africa",	"Auckland Stadium",	"Scheduled"),
(4,	"2024-10-18",	"Australia",	"India",	"Melbourne Stadium",	"Scheduled"),
(5,	"2024-10-22",	"South Africa",	"Pakistan",	"Johannesburg Stadium",	"Scheduled"),
(6,	"2024-10-25",	"England",	"New Zealand",	"Old Trafford",	"Scheduled"),
(7,	"2024-10-28",	"Bangladesh",	"Sri Lanka",	"Dhaka Stadium",	"Scheduled"),
(8,	"2024-11-01",	"Afghanistan",	"West Indies",	"Kabul Stadium"	,"Scheduled"),
(9,	"2024-11-05",	"India",	"England",	"Eden Gardens",	"Scheduled"),
(10,	"2024-11-08",	"Australia",	"South Africa","Sydney Ground",	"Scheduled");

INSERT INTO FantasyTeamPlayer
VALUES
(1,	1,	1,	1,	1),
(2,	1,	4,	1,	0),
(3,	2,	2,	1,	1),
(4,	2,	3,	1,	0),
(5,	3,	5,	1,	1),
(6,	3,	6,	1,	0),
(7,	4,	7,	1,	1),
(8,	4,	8,	1,	0),
(9,	5,	9,	1,	1),
(10,5,	10,	1,	0);


INSERT INTO POINTS
VALUES 
(1,	1,	1,	120),
(2,	2,	1,	90),
(3,	3,	1,	110),
(4,	4,	1,	85),
(5,	5,	1,	105),
(6,	6,	1,	0),
(7,	7,	1,	80),
(8,	8,	1,	95),
(9,	9,	1,	105),
(10, 10, 1,	65);
INSERT INTO ScoringRules 
VALUES
(1,	"Run scored",	1),
(2,"Wicket taken",	25),
(3,	"Catch taken",	10),
(4,	"Half-century",	50),
(5,	"Century scored",	100),
(6,	"Five-wicket haul",	50),
(7,	"Six hit by a batter",	10),
(8,	"Four hit by a batter",	5),
(9,	"Maiden over by bowler",	20),
(10,	"Stumping",	15);

INSERT INTO RANKINGS  
VALUES
(1,	1,	1,	1050),
(2,	3,	2,	1020),
(3,	2,	3,	980),
(4,	6,	4,	1025),
(5,	5,	5,	990),
(6,	4,	6,	950),
(7,	7,	7,	1000),
(8,	9,	8,	1030),
(9,	8,	9,	1010),
(10,	10,	10,	985);
