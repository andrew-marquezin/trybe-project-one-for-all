SELECT albums.title AS album,
	COUNT(albums.album_id) AS favoritadas
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.fav_songs AS fav
	ON songs.song_id = fav.song_id
INNER JOIN SpotifyClone.albums AS albums
	ON songs.album_id = albums.album_id
GROUP BY album
ORDER BY favoritadas DESC, album
LIMIT 3;