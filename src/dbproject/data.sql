
CREATE TABLE tournaments (
    name text NOT NULL,
    prize integer,
    date date,
    teams text,
    winner text
);

CREATE TABLE teams (
    name text NOT NULL,
    country text,
    player text,
    couch text
);

CREATE TABLE people (
    email text NOT NULL,
    nickname text,
    name text
);

INSERT INTO People VALUES
('Thea Armand','ta@gmail.com','ta')
('Liesje Moriah','lm@gmail.com','lm')
('Fuat Bogdana','fb@gmail.com','fb')
('Elvira Jakša','ej@gmail.com','ej')
('Tiên Malte','tm@gmail.com','tm')
('Brutus Sri','bs@gmail.com','bs')
('Radha Johanna','rj@gmail.com','rj')
('Alfher Jonathon','aj@gmail.com','aj')
('Roxanna Ira','ri@gmail.com','ri')
('Marika Larunda','ml@gmail.com','ml')
('Saraswati Yejide','sy@gmail.com','sy')
('Byeong-Ho Anthony','bha@gmail.com','bha')
('Teman Andre','ta@gmail.com','ta')
('Larisa Muhtar','lm@gmail.com','lm')
('Miloslava Danica','md@gmail.com','md')
('Rahul Rohit','rr@gmail.com','rr')
('Lauressa Arjun','la@gmail.com','la')
('Reva Vladimira','rv@gmail.com','rv')
('Shir Aatami','sa@gmail.com','sa')
('Iñaki Mahmut','im@gmail.com','im')

INSERT INTO Teams VALUES
    ('TargeTAcuired', 'DE', 'ta', 'Błażej Eloisa'),
    ('TargeTAcuired', 'DE', 'lm', 'Błażej Eloisa'), 
    ('TargeTAcuired', 'DE', 'fb', 'Błażej Eloisa'), 
    ('TargeTAcuired', 'DE', 'ej', 'Błażej Eloisa'), 
    ('TargeTAcuired', 'DE', 'tm', 'Błażej Eloisa'), 
    ('TargeTAcuired', 'DE', 'ta', 'Błażej Eloisa'), 
    ('HeadShotCrew', 'GB', 'bs', 'Dido Nina'), 
    ('HeadShotCrew', 'GB', 'rj', 'Dido Nina'), 
    ('HeadShotCrew', 'GB', 'aj', 'Dido Nina'), 
    ('HeadShotCrew', 'GB', 'ri', 'Dido Nina'), 
    ('HeadShotCrew', 'GB', 'ml', 'Dido Nina'), 
    ('HeadShotCrew', 'GB', 'sy', 'Dido Nina'), 
    ('HeadShotCrew', 'GB', 'bha', 'Dido Nina'), 
    ('LazyCamperZ', 'DA', 'lm', 'Thore Hakim'), 
    ('LazyCamperZ', 'DA', 'md', 'Thore Hakim'), 
    ('LazyCamperZ', 'DA', 'rr', 'Thore Hakim'), 
    ('LazyCamperZ', 'DA', 'la', 'Thore Hakim'), 
    ('LazyCamperZ', 'DA', 'rv', 'Thore Hakim'), 
    ('LazyCamperZ', 'DA', 'sa', 'Thore Hakim'), 
    ('LazyCamperZ', 'DA', 'im', 'Thore Hakim');

CREATE TABLE tournaments (
    name text NOT NULL,
    prize integer,
    date date,
    teams text,
    winner text
);

INSERT INTO Tournaments VALUES
	('Blodthirsty',10000, NOW(), 'TargeTAcuired', 'TargeTAcuired'),
	('qualifiers',1000, NOW(), 'TargeTAcuired', 'TargeTAcuired'),
	('boomtown',100, NOW(), 'TargeTAcuired', 'TargeTAcuired'),
	('SLAP - LAN PARTY',500, NOW(), 'TargeTAcuired', 'LazyCamperZ'),
	('SLAP - LAN PARTY 2018',500, NOW(), 'TargeTAcuired', 'TargeTAcuired'),
	
	('Blodthirsty',10000, NOW(), 'LazyCamperZ', 'TargeTAcuired'),
	('qualifiers',1000, NOW(), 'LazyCamperZ', 'TargeTAcuired'),
	('boomtown',100, NOW(), 'LazyCamperZ', 'TargeTAcuired'),
	('SLAP - LAN PARTY',500, NOW(), 'LazyCamperZ', 'LazyCamperZ'),
	
	('Blodthirsty',10000, NOW(), 'HeadShotCrew', 'TargeTAcuired'),
	('qualifiers',1000, NOW(), 'HeadShotCrew', 'TargeTAcuired'),
	('boomtown',100, NOW(), 'HeadShotCrew', 'TargeTAcuired'),
	('SLAP - LAN PARTY',500, NOW(), 'HeadShotCrew', 'LazyCamperZ')
;
