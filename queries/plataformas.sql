USE steam_dados;

SELECT platforms as Plataformas,
sum(owners_min) AS Usuários_Pessimista,
sum(owners_min*price) AS Faturamento_Pessimista,
sum(owners_max) AS Usuários_Otimista,
sum(owners_max*price) AS Faturamento_Otimista
from jogos
GROUP BY platforms;