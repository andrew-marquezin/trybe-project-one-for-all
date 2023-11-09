SELECT artists.artist_name AS artista,
	CASE
		WHEN COUNT(fav.song_id) >= 5 THEN 'A'
		WHEN COUNT(fav.song_id) IN (3, 4) THEN 'B'
		WHEN COUNT(fav.song_id) IN (1, 2) THEN 'C'
		WHEN COUNT(fav.song_id) = 0 THEN '-'
	END AS ranking
FROM SpotifyClone.artists AS artists
LEFT JOIN SpotifyClone.albums AS albums
	ON artists.artist_id = albums.artist_id
LEFT JOIN SpotifyClone.songs AS songs
	ON albums.album_id = songs.album_id
LEFT JOIN SpotifyClone.fav_songs AS fav
	ON songs.song_id = fav.song_id
GROUP BY artista
ORDER BY COUNT(fav.song_id) DESC, artista;