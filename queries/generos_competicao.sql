USE steam_dados;
SELECT * from jogos;

-- quais gêneros têm mais competição?
SELECT genres, SUM(appid) AS jogos_por_genero FROM jogos GROUP BY genres ORDER BY jogos_por_genero DESC LIMIT 10;

-- quais gêneros têm menos competição?
SELECT genres, SUM(appid) AS jogos_por_genero FROM jogos GROUP BY genres ORDER BY jogos_por_genero LIMIT 10;