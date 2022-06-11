USE BMGT402_Project_0301_5;

--SELECT * FROM Season;
--SELECT * FROM Opponent;
--SELECT * FROM Location;
--SELECT * FROM Game;

-- 1. What were the top ten games with the highest number of runs by the Terrapins Baseball Team?
SELECT TOP(10) g.gameId AS 'Game ID', g.day AS 'Day', g.year AS 'Year', g.time AS 'Time', g.terps AS 'Terp''s Number of Runs',
	o.opponentName AS 'Opponent', l.city AS 'City', l.state AS 'State'
FROM Game g, Location l, Opponent o
WHERE g.locationId = l.locationId AND g.opponentId = o.opponentId
ORDER BY g.terps DESC;

-- 2. Where were the top ten locations with the highest number of runs by the Terrapins Baseball Team?
SELECT TOP (10) l.locationId AS 'Location ID', l.city AS 'City', l.state AS 'State', g.terps AS 'Terp''s Number of Runs'
FROM Location l, Game g
WHERE l.locationId = g.locationId
ORDER BY g.terps DESC;

-- 3. Who were the top ten opponents that won most often against the Terrapins Baseball Team?
SELECT TOP (10) opponentId AS 'Opponent ID', opponentName AS 'Opponent Name', COUNT(opponentId) as 'Number of Wins Against Terps'
FROM GameView
WHERE winLoseTie = 'L'
GROUP BY opponentId, opponentName
ORDER BY 'Number of Wins Against Terps' DESC;

-- 4. What was the Terrapins Baseball Team's average number of runs per game per season?
SELECT s.seasonId AS 'Season', CAST(AVG(CAST(terps AS DECIMAL(5,3))) as DECIMAL(5,3)) as 'Average Number of Runs'
FROM Game g, Season s
WHERE g.year = s.seasonId
GROUP BY s.seasonId
ORDER BY 'Season';

-- 5. Which season had the Terrapins Baseball Team's highest overall winning percentage?
SELECT TOP (1) seasonId AS 'Season', overallP AS 'Winning Percentage'
FROM SeasonView
ORDER BY overallP DESC;
