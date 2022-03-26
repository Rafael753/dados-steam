USE steam_dados;
select * from jogos;

-- lista 100 publishers com maior numero de jogos pagos lançados:
SELECT publisher, COUNT(appid) AS jogos_lancados FROM jogos WHERE price > 0 GROUP BY publisher ORDER BY jogos_lancados DESC LIMIT 100;

-- lista 100 publishers com maior rentabilidade:
SELECT publisher, COUNT(appid) AS jogos_lancados, 
(owners_min*price) AS faturamento_min, 
(owners_max*price) AS faturamento_max,
(owners_min*price/COUNT(appid)) AS rentabilidade_por_jogo,
AVG((jogos.positive_ratings/(jogos.positive_ratings + jogos.negative_ratings))*100) AS avaliacoes_positivas_percentual,
COUNT(genres) AS qtde_generos 
FROM jogos 
group by publisher 
ORDER BY faturamento_min DESC LIMIT 100;