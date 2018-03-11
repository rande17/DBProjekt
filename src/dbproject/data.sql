INSERT INTO People (name, email, nickname) VALUES
	('Thea Armand','ta@gmail.com','ta'),
	('Liesje Moriah','lm@gmail.com','lm'),
	('Fuat Bogdana','fb@gmail.com','fb'),
	('Elvira Jakša','ej@gmail.com','ej'),
	('Tiên Malte','tm@gmail.com','tm'),
	('Brutus Sri','bs@gmail.com','bs'),
	('Radha Johanna','rj@gmail.com','rj'),
	('Alfher Jonathon','aj@gmail.com','aj'),
	('Roxanna Ira','ri@gmail.com','ri'),
	('Marika Larunda','ml@gmail.com','ml'),
	('Saraswati Yejide','sy@gmail.com','sy'),
	('Byeong-Ho Anthony','bha@gmail.com','bha'),
	('Teman Andre','tan@gmail.com','tan'),
	('Larisa Muhtar','lmu@gmail.com','lmu'),
	('Miloslava Danica','md@gmail.com','md'),
	('Rahul Rohit','rr@gmail.com','rr'),
	('Lauressa Arjun','la@gmail.com','la'),
	('Reva Vladimira','rv@gmail.com','rv'),
	('Shir Aatami','sa@gmail.com','sa'),
	('Iñaki Mahmut','im@gmail.com','im');

INSERT INTO is_on (teamname,nickname) VALUES
	('TargeTAcuired' , 'ta'),
	('TargeTAcuired' , 'lm'),
	('TargeTAcuired' , 'fb'),
	('TargeTAcuired' , 'ej'),
	('TargeTAcuired' , 'tm'),
	('TargeTAcuired' , 'bs'),
	('HeadShotCrew' , 'rj'),
	('HeadShotCrew' , 'aj'),
	('HeadShotCrew' , 'ri'),
	('HeadShotCrew' , 'ml'),
	('HeadShotCrew' , 'sy'),
	('HeadShotCrew' , 'bha'),
	('HeadShotCrew' , 'ta'),
	('LazyCamperZ' , 'lm'),
	('LazyCamperZ' , 'md'),
	('LazyCamperZ' , 'rr'),
	('LazyCamperZ' , 'la'),
	('LazyCamperZ' , 'rv'),
	('LazyCamperZ' , 'sa'),
	('LazyCamperZ' , 'im');
 


INSERT INTO Teams (name, country, coach) VALUES
	('TargeTAcuired', 'DE', 'Błażej Eloisa'),
	('HeadShotCrew', 'GB', 'Dido Nina'), 
	('LazyCamperZ', 'DA', 'Thore Hakim');


INSERT INTO plays_in(teamname, tournamentname) VALUES
	('TargeTAcuired', 'Blodthirsty'),
	('TargeTAcuired', 'qualifiers'),
	('TargeTAcuired', 'boomtown'),
	('TargeTAcuired', 'SLAP - LAN PARTY'),
	('TargeTAcuired', 'SLAP - LAN PARTY 2018'),
	('HeadShotCrew', 'Blodthirsty'),
	('HeadShotCrew', 'qualifiers'),
	('HeadShotCrew', 'boomtown'),
	('HeadShotCrew', 'SLAP - LAN PARTY'),
	('HeadShotCrew', 'SLAP - LAN PARTY 2018'),
	('LazyCamperZ', 'SLAP - LAN PARTY'),
	('LazyCamperZ', 'boomtown'),
	('LazyCamperZ', 'qualifiers'),
	('LazyCamperZ', 'Blodthirsty');

INSERT INTO Tournaments VALUES
	('Blodthirsty',10000, NOW(), 'TargeTAcuired'),
	('qualifiers',1000, NOW(), 'TargeTAcuired'),
	('boomtown',100, NOW(), 'TargeTAcuired'),
	('SLAP - LAN PARTY',500, NOW(), 'LazyCamperZ'),
	('SLAP - LAN PARTY 2018',500, NOW(), 'TargeTAcuired');
