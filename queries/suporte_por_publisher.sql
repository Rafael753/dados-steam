USE steam_dados;

SELECT * FROM steam_support_info;

-- publishers, qtde de jogos e suas páginas de suporte: as que faturam mais tem quantas paginas de suporte por jogo?
-- suporte_por_jogo < 1 indica que nem todo jogo lançado tem suporte;
SELECT jogos.publisher, COUNT(steam_support_info.support_url) AS paginas_suporte_por_publisher, COUNT(jogos.appid) AS jogos_lancados,
(jogos.owners_min*jogos.price) AS faturamento_min, (COUNT(steam_support_info.support_url)/COUNT(jogos.appid)) AS suporte_por_jogo
FROM jogos 
LEFT JOIN steam_support_info
ON jogos.appid = steam_support_info.steam_appid
GROUP BY jogos.publisher
ORDER BY faturamento_min DESC; 

-- publishers, qtde de jogos e suas páginas de suporte: as melhores avaliadas tem quantas paginas de suporte por jogo?
-- exclui publishers que publicaram 10 jogos ou menos
SELECT jogos.publisher, COUNT(steam_support_info.support_url) AS paginas_suporte_por_publisher, COUNT(jogos.appid) AS jogos_lancados,
AVG((jogos.positive_ratings/(jogos.positive_ratings + jogos.negative_ratings))*100) AS avaliacoes_positivas_percentual, (COUNT(steam_support_info.support_url)/COUNT(jogos.appid)) AS suporte_por_jogo
FROM jogos 
LEFT JOIN steam_support_info
ON jogos.appid = steam_support_info.steam_appid
GROUP BY jogos.publisher
HAVING COUNT(jogos.appid) > 10
ORDER BY avaliacoes_positivas_percentual DESC
LIMIT 100; 
