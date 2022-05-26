CREATE TABLE music_styles(
id SERIAL PRIMARY KEY,
style_name VARCHAR(50) NOT NULL
);

CREATE TABLE musicians(
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
pseudonymous VARCHAR(50),
);

 CREATE TABLE albums(
id SERIAL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
release_year YEAR,
);

CREATE TABLE songs(
id SERIAL PRIMARY KEY,
song_name VARCHAR(50) NOT NULL,
latency FLOAT(20),
album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE collections(
id SERIAL PRIMARY KEY,
collect_name VARCHAR(50) NOT NULL,
release_year YEAR,
);

CREATE TABLE musician_album(
musician_id INTEGER REFERENCES musicians(id) ,
album_id INTEGER REFERENCES albums(id),
CONSTRAINT musician_alb_id PRIMARY KEY(musician_id,album_id)
);

CREATE TABLE musician_style(
musician_id INTEGER REFERENCES musicians(id) ,
style_id INTEGER REFERENCES music_styles(id),
CONSTRAINT musician_style_pk PRIMARY KEY(musician_id,style_id)
);

CREATE TABLE song_collection(
song_id INTEGER REFERENCES songs(id) ,
collection_id INTEGER REFERENCES collections(id),
CONSTRAINT song_collection_pk PRIMARY KEY(song_id,collection_id)
);

INSERT INTO albums(id,title,release_year)
VALUES
(1,'Revolver',1966),
(2,'Kind of Blue',1959),
(3,'The Eminem Show',2002),
(4,'Thriller',1982),
(5,'Trans Europe Express',1977),
(6,'Bird of Paradise',1995),
(7,'Master Of Puppets',1986),
(8,'Nevermind',1991),
(9,'Kamikaze',2018),
(10,'The Slim Shady LP',1999);

INSERT INTO music_styles(id,style_name)
VALUES
(1,'Rock'),
(2,'Electro'),
(3,'Rap'),
(4,'Pop'),
(5,'Jazz');

INSERT INTO musicians(id,first_name,last_name,pseudonymous)
VALUES
(1,'Beatles',NULL,NULL,NULL),
(2,'Miles,Davis',NULL),
(3,'Marshall','Bruce Mathers III','Eminem'),
(4,'Michael,Jackson',NULL),
(5,'Kraftwerk',NUll,NULL),
(6,'Charlie,Parker',NULL),
(7,'Metallica',NULL,NULL,NULL),
(8,'Nirvana',NULL,NULL,NULL);

INSERT INTO songs(id,song_name,latency,album_id)
VALUES
(1,'Without Me',4.53,3),
(2,'So What',9.07,2),
(3,'All Blues',11.32,2),
(4,'Thriller',4.15,4),
(5,'Billie Jean',4.44,4),
(6,'Yardbird Suite',2.55,6),
(7,'Master of Puppets',8.36,7),
(8,'Smells Like Teen Spirit',6.06,8),
(9,'Come as You Are',4.16,8),
(10,'Das Model',3.39,5),
(11,'Breed',2.59,8),
(12,'Lithium',5.50,8),
(13,'Europe Endless',9.35,5),
(14,'The Hall of Mirrors',7.50,5),
(15,'Yellow Submarine',2.45,1),
(16,'The Ringer',5.37,9),
(17,'My Name Is',4.08);

INSERT INTO collections(id,collect_name,release_year)
VALUES
(1,'collection1',2010),
(2,'collection2',1998),
(3,'collection3',2005),
(4,'collection4',1999),
(5,'collection5',2020),
(6,'collection6',2019),
(7,'collection7',2004),
(8,'collection8',2018);

INSERT INTO musician_album(musician_id,album_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(3,9);

INSERT INTO musician_style(musician_id,style_id)
VALUES
(1,1),
(2,5),
(3,3),
(4,4),
(4,1),
(5,2),
(6,5),
(7,1),
(8,1);

INSERT INTO song_collection(song_id,collection_id)
VALUES
(1,2),
(1,7),
(2,2),
(3,3),
(3,4),
(4,1),
(5,1),
(6,6),
(7,3),
(8,3),
(8,5),
(9,3),
(10,8),
(11,3),
(12,4),
(13,5),
(13,7),
(13,8),
(14,6),
(14,1),
(15,7);

SELECT title,release_year
FROM albums
WHERE release_year = 2018;

SELECT song_name,latency
FROM songs
ORDER BY DESC
LIMIT 1;

SELECT song_name
FROM songs
WHERE latency<3.5;

SELECT collect_name
FROM collections
WHERE release_year BETWEEN 2018 AND 2020;

SELECT first_name,last_name
FROM musicians
WHERE first_name NOT LIKE '% %';

SELECT song_name
FROM songs
WHERE song_name ILIKE '%мой%' OR ILIKE '%my%';
