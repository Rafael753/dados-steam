USE steam_dados;

SELECT required_age AS Idade_mínima,
SUM(owners_min) AS Usuários_Pessimista,
SUM(owners_max) AS Usuários_Otimista,
SUM(owners_min*price) AS Vendas_Pessimista,
SUM(owners_max*price) AS Vendas_Otimista
FROM jogos GROUP BY required_age;