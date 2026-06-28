-- ============================================================
-- PROJECT: Football League Analysis
-- Author: Lena Papadopoulou
-- Date: 2026-06
-- Description: Analysis of a fictional football league
--              with teams, players, matches and goals.
-- ============================================================


-- ============================================================
-- STEP 1: CREATE DATABASE & TABLES
-- ============================================================

CREATE DATABASE IF NOT EXISTS football_league;
USE football_league;

CREATE TABLE IF NOT EXISTS Teams (
    team_id     INT AUTO_INCREMENT PRIMARY KEY,
    team_name   VARCHAR(100) NOT NULL,
    city        VARCHAR(100) NOT NULL,
    founded     YEAR,
    coach       VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Players (
    player_id   INT AUTO_INCREMENT PRIMARY KEY,
    full_name   VARCHAR(100) NOT NULL,
    position    VARCHAR(50),       -- e.g. Forward, Midfielder, Defender, Goalkeeper
    age         INT,
    nationality VARCHAR(50),
    team_id     INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE IF NOT EXISTS Matches (
    match_id        INT AUTO_INCREMENT PRIMARY KEY,
    home_team_id    INT,
    away_team_id    INT,
    match_date      DATE,
    stadium         VARCHAR(100),
    home_score      INT DEFAULT 0,
    away_score      INT DEFAULT 0,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);

CREATE TABLE IF NOT EXISTS Goals (
    goal_id     INT AUTO_INCREMENT PRIMARY KEY,
    match_id    INT,
    player_id   INT,
    minute      INT,   -- minute the goal was scored
    goal_type   VARCHAR(30),  -- e.g. Open Play, Penalty, Free Kick, Own Goal
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);


-- ============================================================
-- STEP 2: INSERT DATA
-- ============================================================

INSERT INTO Teams (team_name, city, founded, coach) VALUES
('Olympiakos FC',    'Piraeus',       1925, 'Michel'),
('Panathinaikos',    'Athens',        1908, 'Ivan Jovanovic'),
('AEK Athens',       'Athens',        1924, 'Matias Almeyda'),
('PAOK FC',          'Thessaloniki',  1926, 'Razvan Lucescu'),
('Aris FC',          'Thessaloniki',  1914, 'Akis Mantzios');

INSERT INTO Players (full_name, position, age, nationality, team_id) VALUES
('Ayoub El Kaabi',   'Forward',    28, 'Moroccan',  1),
('Mathieu Valbuena', 'Midfielder', 39, 'French',    1),
('Giorgos Masouras', 'Forward',    30, 'Greek',     1),
('Fotis Ioannidis',  'Forward',    24, 'Greek',     2),
('Robertas Puncas',  'Midfielder', 28, 'Lithuanian',2),
('Nordin Amrabat',   'Midfielder', 37, 'Moroccan',  2),
('Sergio Araujo',    'Forward',    33, 'Argentinian',3),
('Takuto Oshima',    'Midfielder', 29, 'Japanese',  3),
('Christos Tzolis',  'Forward',    23, 'Greek',     4),
('Andrija Zivkovic', 'Midfielder', 28, 'Serbian',   4),
('Marios Psaltis',   'Goalkeeper', 27, 'Greek',     5),
('Lazaros Rota',     'Forward',    29, 'Greek',     5);

INSERT INTO Matches (home_team_id, away_team_id, match_date, stadium, home_score, away_score) VALUES
(1, 2, '2025-09-14', 'Georgios Karaiskakis',  2, 1),
(3, 4, '2025-09-15', 'OPAP Arena',            0, 2),
(5, 1, '2025-09-21', 'Kleanthis Vikelidis',   1, 3),
(2, 3, '2025-09-22', 'Apostolos Nikolaidis',  2, 2),
(4, 5, '2025-10-05', 'Toumba Stadium',        3, 0),
(1, 3, '2025-10-19', 'Georgios Karaiskakis',  1, 0),
(2, 4, '2025-10-20', 'Apostolos Nikolaidis',  1, 2),
(5, 3, '2025-11-02', 'Kleanthis Vikelidis',   0, 1),
(1, 4, '2025-11-09', 'Georgios Karaiskakis',  2, 2),
(2, 5, '2025-11-23', 'Apostolos Nikolaidis',  3, 1);

INSERT INTO Goals (match_id, player_id, minute, goal_type) VALUES
-- Match 1: Olympiakos 2-1 Panathinaikos
(1, 1, 23, 'Open Play'),
(1, 3, 67, 'Open Play'),
(1, 4, 80, 'Penalty'),
-- Match 2: AEK 0-2 PAOK
(2, 9, 34, 'Open Play'),
(2, 10, 71, 'Free Kick'),
-- Match 3: Aris 1-3 Olympiakos
(3, 12, 18, 'Open Play'),
(3, 1,  29, 'Open Play'),
(3, 1,  55, 'Penalty'),
(3, 3,  88, 'Open Play'),
-- Match 4: Panathinaikos 2-2 AEK
(4, 4,  12, 'Open Play'),
(4, 6,  45, 'Open Play'),
(4, 7,  60, 'Open Play'),
(4, 8,  90, 'Free Kick'),
-- Match 5: PAOK 3-0 Aris
(5, 9,  10, 'Open Play'),
(5, 10, 38, 'Open Play'),
(5, 9,  77, 'Penalty'),
-- Match 6: Olympiakos 1-0 AEK
(6, 2,  52, 'Free Kick'),
-- Match 7: Panathinaikos 1-2 PAOK
(7, 5,  33, 'Open Play'),
(7, 9,  60, 'Open Play'),
(7, 10, 85, 'Open Play'),
-- Match 8: Aris 0-1 AEK
(8, 7,  44, 'Open Play'),
-- Match 9: Olympiakos 2-2 PAOK
(9, 3,  22, 'Open Play'),
(9, 1,  70, 'Penalty'),
(9, 9,  15, 'Open Play'),
(9, 10, 80, 'Open Play'),
-- Match 10: Panathinaikos 3-1 Aris
(10, 4, 8,  'Open Play'),
(10, 4, 55, 'Open Play'),
(10, 6, 78, 'Open Play'),
(10, 12,90, 'Penalty');


-- ============================================================
-- STEP 3: ANALYSIS QUERIES
-- ============================================================

-- Query 1: Select all teams
select * 
from Teams

-- Query 2: All players who are Forwards
select *
from Players 
where position='Forward';

-- Query 3: All matches with team names (not just IDs)
select m.match_date,
 t1.team_name as home_team,
 m.home_score,
 m.away_score,
 t2.team_name as away_team
from Matches as m
join  Teams  as t1 on m.home_team_id=t1.team_id
join Teams  as t2 on m.away_team_id = t2.team_id;



-- Query 4: Top scorers (goals per player)
select p.full_name,count(g.goal_id) as score
from goals as g
join players as p on
g.player_id=p.player_id
group by p.full_name,p.player_id
order by count(g.goal_id)
desc;

-- Query 5: Goals scored per team
select t.team_name, count(g.goal_id) as score
from players as p
join goals as g on
p.player_id=g.player_id
join teams as t on 
p.team_id=t.team_id
group by t.team_name
order by count(g.goal_id)
desc;



-- Query 6: Players with more than 2 goals
select p.full_name , count(g.goal_id) as total_goals
from players as p
join goals as g on
p.player_id=g.player_id
group by p.full_name, p.player_id
having count(g.goal_id) > 2;


-- Query 7: Goals scored per goal type
select goal_type,count(goal_id) as total_goals
from goals
group by goal_type;

-- Query 8: Matches that ended in a draw
select t1.team_name as team_1 , t2.team_name as team_2
from matches as m
join teams as t1 on
m.home_team_id = t1.team_id
join teams as t2 on
m.away_team_id = t2.team_id
where home_score=away_score;


-- Query 9: which team has the most players in the squad
select t.team_name,count(p.player_id) as total_players
from teams as t
join players as p
on p.team_id=t.team_id
group by t.team_name
order by total_players desc; 


-- Query 10: Goals scored after the 75th minute 
select p.full_name , g.minute
from goals as g
join players as p
on g.player_id=p.player_id
where minute > 75;

