USE BMGT402_Project_0301_5;

DROP VIEW IF EXISTS GameView;
DROP VIEW IF EXISTS SeasonView;

GO
CREATE VIEW GameView(gameId, year, winLoseTie, opponentId, opponentName)
AS SELECT g.gameId, g.year,
		CASE WHEN g.terps > g.oppnt THEN 'W'
		WHEN g.terps < g.oppnt THEN 'L'
		ELSE 'T'
		END as winLoseTie, o.opponentId, o.opponentName
	FROM Game g, Opponent o
	WHERE g.opponentId = o.opponentId;

GO
CREATE VIEW SeasonView(seasonId, overallP)
AS SELECT s.seasonId, CAST(SUM(CASE g.winLoseTie WHEN 'W' THEN 1 WHEN 'T' THEN 0.5 ELSE NULL END)/CAST(COUNT(*) AS DECIMAL(5,3)) AS DECIMAL(5,3)) AS overallP
	FROM Season s, GameView g
	WHERE s.seasonId = g.year
	GROUP BY s.seasonId;

GO
SELECT * FROM GameView;
SELECT * FROM SeasonView ORDER BY seasonId;