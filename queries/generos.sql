CREATE DATABASE steam_dados;

USE steam_dados;

-- excluindo jogos grátis
SELECT * FROM jogos WHERE price > 0;

-- relaciona 20 gêneros e o faturamento de vendas que têm (previsões mínima e máxima), excluindo jogos grátis
SELECT DISTINCT genres, SUM(owners_min*price) AS vendas_pessimista, SUM(owners_max*price) AS vendas_otimista, count(appid) AS numero_jogos, (owners_min*price/count(appid)) AS rentabilidade_media FROM jogos WHERE price > 0  GROUP BY genres ORDER BY rentabilidade_media DESC LIMIT 20;

-- relaciona os 10 generos mais populares entre os clientes Steam, sem levar em conta a rentabilidade (incluindo jogos grátis)
SELECT DISTINCT genres, SUM(owners_min) AS clientes_pessimista, SUM(owners_max) AS clientes_otimista, count(appid) AS numero_jogos, (owners_min/count(appid)) AS clientes_por_jogo_pessimista, (owners_max/count(appid)) AS clientes_por_jogo_otimista FROM jogos GROUP BY genres ORDER BY clientes_otimista DESC LIMIT 10;
