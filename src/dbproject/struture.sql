DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS is_on;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS plays_in;
DROP TABLE IF EXISTS Tournaments;

CREATE TABLE People(
	name 		TEXT,
	email 		TEXT,
	nickname 	TEXT UNIQUE
);


CREATE TABLE is_on(
	teamname TEXT,
	nickname TEXT
);

CREATE TABLE Teams(
	name 	TEXT UNIQUE,
	country TEXT,
	coach 	TEXT
);

CREATE TABLE plays_in(
	teamname 	TEXT,
	tournamentname 	TEXT
);

CREATE TABLE Tournaments(
	name 	TEXT UNIQUE,
	prize 	INT,
	date 	DATE,
	winner 	TEXT
);
