USE BMGT402_Project_0301_5;

PRINT 'dropping tables'
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Opponent
DROP TABLE IF EXISTS Season;

PRINT 'creating tables'
CREATE TABLE Season (
	seasonId CHAR(4) NOT NULL,
	CONSTRAINT pk_Season_seasonId PRIMARY KEY (seasonId));

CREATE TABLE Opponent (
	opponentId CHAR(4) NOT NULL,
	opponentName VARCHAR(30),
	CONSTRAINT pk_Opponent_opponentId PRIMARY KEY (opponentId));

CREATE TABLE Location (
	locationId CHAR(3) NOT NULL,
	city VARCHAR(20),
	state CHAR(2),
	CONSTRAINT pk_Location_locationId PRIMARY KEY (locationId));

CREATE TABLE Game (
	gameId CHAR(5) NOT NULL,
	day VARCHAR(6),
	year CHAR(4),
	dayOfWeek CHAR(3),
	time TIME(0),
	at VARCHAR(7),
	terps INT,
	oppnt INT,
	opponentId CHAR(4),
	locationId CHAR (3),
	CONSTRAINT pk_Game_gameId PRIMARY KEY (gameId),
	CONSTRAINT fk_Game_year FOREIGN KEY (year)
		REFERENCES Season (seasonId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	CONSTRAINT fk_Game_opponentId FOREIGN KEY (opponentID)
		REFERENCES Opponent (opponentID)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT fk_Game_locationId FOREIGN KEY (locationId)
		REFERENCES Location (locationId)
		ON DELETE NO ACTION
		ON UPDATE CASCADE);
