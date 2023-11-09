SELECT users.user_name AS pessoa_usuaria,
  COUNT(history.song_id) AS musicas_ouvidas,
  ROUND(SUM(songs.song_length) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS users 
INNER JOIN SpotifyClone.history AS history
  ON users.user_id = history.user_id
INNER JOIN SpotifyClone.songs AS songs
  ON songs.song_id = history.song_id
GROUP BY users.user_name
ORDER BY users.user_name;