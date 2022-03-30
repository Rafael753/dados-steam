USE steam_dados;
SELECT * from jogos;

-- quais gêneros têm mais competição?
SELECT genres, COUNT(name) AS jogos_por_genero FROM jogos GROUP BY genres ORDER BY jogos_por_genero DESC LIMIT 10;

-- quais gêneros têm menos competição?
SELECT genres, COUNT(name) AS jogos_por_genero FROM jogos GROUP BY genres HAVING SUM(name) > 0 ORDER BY jogos_por_genero LIMIT 10;

-- quais gêneros têm mais competição (EXCLUNDO INDIES)?
SELECT genres, COUNT(name) AS jogos_por_genero FROM jogos WHERE genres NOT LIKE '%Indie%' GROUP BY genres ORDER BY jogos_por_genero DESC LIMIT 10;

-- quais gêneros têm menos competição (EXCLUNDO INDIES e apps de utilidade)?
SELECT genres, cOUNT(name) AS jogos_por_genero,  FROM jogos WHERE genres NOT LIKE '%Indie%' AND genres NOT LIKE '%Utilities%' AND genres NOT LIKE '%Animation%' GROUP BY genres HAVING SUM(name) > 0 ORDER BY jogos_por_genero LIMIT 10;

-- exemplos do gênero com mais competição;
SELECT genres, name AS jogos, owners_min FROM jogos WHERE genres LIKE 'Action';

-- exemplos de gênero com menos competição;
SELECT genres, name AS jogos, owners_min FROM jogos WHERE genres LIKE 'Massively Multiplayer;Simulation;Sports;Early Access';