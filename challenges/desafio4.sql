SELECT users.user_name AS pessoa_usuaria,
  IF(YEAR(MAX(history.reproduction_date)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.history AS history
  ON users.user_id = history.user_id
GROUP BY users.user_name
ORDER BY users.user_name;