USE steam_dados;
SELECT * from jogos;

-- quais gêneros têm mais competição?
SELECT genres, COUNT(name) AS jogos_por_genero FROM jogos GROUP BY genres ORDER BY jogos_por_genero DESC LIMIT 10;

-- quais gêneros têm menos competição?
SELECT genres, COUNT(name) AS jogos_por_genero FROM jogos GROUP BY genres HAVING SUM(name) > 0 ORDER BY jogos_por_genero LIMIT 10;

-- quais gêneros têm mais competição (EXCLUNDO INDIES)?
SELECT genres, COUNT(name) AS jogos_por_genero FROM jogos WHERE genres NOT LIKE '%Indie%' GROUP BY genres ORDER BY jogos_por_genero DESC LIMIT 10;

-- quais gêneros têm menos competição (EXCLUNDO INDIES e apps de utilidade) com no mínimo 5 JOGOS E 10 mil vendas?
SELECT genres AS Gêneros, cOUNT(name) AS Jogos, SUM(owners_max) as Vendas, name AS Exemplo FROM jogos WHERE genres NOT LIKE '%Free To Play%' AND genres NOT LIKE '%Utilities%' AND genres NOT LIKE '%Animation%' AND genres NOT LIKE '%Web Publishing%' GROUP BY genres HAVING SUM(owners_max) > 10000 AND cOUNT(name) > 5 ORDER BY Jogos LIMIT 10;

-- exemplos do gênero com mais competição;
SELECT genres, name AS jogos, owners_min FROM jogos WHERE genres LIKE 'Action';

-- exemplos de gênero com menos competição;
SELECT genres, name AS jogos, owners_min FROM jogos WHERE genres LIKE 'Action;Adventure;Massively Multiplayer';

SELECT genres, name AS jogos, owners_min FROM jogos WHERE genres LIKE 'Action;RPG;Simulation';