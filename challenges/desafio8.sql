SELECT artists.artist_name AS artista,
	albums.title AS album
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albums AS albums
	ON artists.artist_id = albums.artist_id
WHERE artists.artist_id = 3
ORDER BY album;