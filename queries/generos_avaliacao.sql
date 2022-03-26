USE steam_dados;

-- mostrando jogos e suas avaliações;
SELECT appid, name, genres, positive_ratings, negative_ratings FROM jogos ORDER BY positive_ratings DESC;

-- mostrando jogos e suas avaliações em percentual:
SELECT appid, name, genres, (positive_ratings + negative_ratings) AS avaliacoes_totais, (positive_ratings/(positive_ratings + negative_ratings))*100 AS avaliacoes_positivas_percentual, (negative_ratings/(positive_ratings + negative_ratings))*100 AS avaliacoes_negativas_percentual FROM jogos;

-- mostrando jogos e suas avaliações em percentual (excluindo jogos grátis):
SELECT appid, name, genres, (positive_ratings + negative_ratings) AS avaliacoes_totais, (positive_ratings/(positive_ratings + negative_ratings))*100 AS avaliacoes_positivas_percentual, (negative_ratings/(positive_ratings + negative_ratings))*100 AS avaliacoes_negativas_percentual FROM jogos WHERE price > 0;

-- listar 10 gêneros mais bem avaliados e a quantidade de jogos concorrentes:
SELECT genres, AVG((positive_ratings/(positive_ratings + negative_ratings))*100) AS avaliacoes_positivas_percentual, COUNT(appid) AS concorrentes FROM jogos WHERE price > 0 GROUP BY genres ORDER BY avaliacoes_positivas_percentual DESC;

-- listar 10 gêneros mais mal avaliados e a quantidade de jogos concorrentes:
SELECT genres, AVG((negative_ratings/(positive_ratings + negative_ratings))*100) AS avaliacoes_negativas_percentual, COUNT(appid) AS concorrentes FROM jogos WHERE price > 0 GROUP BY genres ORDER BY avaliacoes_negativas_percentual DESC;
