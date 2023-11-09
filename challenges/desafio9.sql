SELECT COUNT(history.user_id) AS musicas_no_historico
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.history AS history
	ON users.user_id = history.user_id
WHERE users.user_id = 1;