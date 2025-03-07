DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans 
(
    plan_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50),
    price DECIMAL(10, 2)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_name, price) VALUES
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);

CREATE TABLE SpotifyClone.artists 
(
    artist_id	INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_name	VARCHAR(50) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artists (artist_name) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE SpotifyClone.albums 
(
    album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    artist_id	INT NOT NULL,
    title	VARCHAR(50) NOT NULL,
    release_year YEAR NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.albums (artist_id, title, release_year) VALUES
	(1, 'Renaissance', '2022'),
	(2, 'Jazz', '1978'),
	(2, 'Hot Space', '1982'),
	(3, 'Falso Brilhante', '1998'),
	(3, 'Vento de Maio', '2001'),
	(4, 'QVVJFA?', '2003'),
	(5, 'Somewhere Far Beyond', '2007'),
	(6, 'I Put A Spell On You', '2012');

CREATE TABLE SpotifyClone.songs 
(
    song_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    song_name	VARCHAR(50) NOT NULL,
    song_length	INT NOT NULL,
    album_id	INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs (song_name, song_length, album_id) VALUES
	('BREAK MY SOUL', 279, 1),
	("VIRGO'S GROOVE", 369, 1),
	('ALIEN SUPERSTAR', 116, 1),
	("Don't Stop Me Now", 203, 2),
	('Under Pressure', 152, 3),
	('Como Nossos Pais', 105, 4),
	('O Medo de Amar é o Medo de Ser Livre', 207, 5),
	('Samba em Paris', 267, 6),
	("The Bard's Song", 244, 7),
	('Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.users 
(
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_name	VARCHAR(50) NOT NULL,
    user_age	INT NOT NULL,
    plan_id	INT NOT NULL,
    sign_date	DATE NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.users (user_name, user_age, plan_id, sign_date) VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 2, '2017-12-30'),
	('Martin Fowler', 46, 2, '2017-01-17'),
	('Sandi Metz', 58, 2, '2018-04-29'),
	('Paulo Freire', 19, 3, '2018-02-14'),
	('Bell Hooks', 26, 3, '2018-01-05'),
	('Christopher Alexander', 85, 4, '2019-06-05'),
	('Judith Butler', 45, 4, '2020-05-13'),
	('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE SpotifyClone.history 
(
    user_id	INT NOT NULL,
    song_id	INT NOT NULL,
    reproduction_date	DATETIME NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.history (user_id, song_id, reproduction_date) VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.following 
(
    user_id	INT NOT NULL,
    artist_id	INT NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.following (user_id, artist_id) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);