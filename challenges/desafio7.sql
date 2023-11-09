SELECT artists.artist_name AS artista,
	albums.title AS album,
  COUNT(following.user_id) AS pessoas_seguidoras
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albums AS albums
	ON artists.artist_id = albums.artist_id
INNER JOIN SpotifyClone.following AS following
	ON artists.artist_id = following.artist_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;