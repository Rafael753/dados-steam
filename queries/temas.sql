USE steam_dados;

-- mostra descrições;
SELECT name, genres FROM jogos WHERE genres = 'Casual;Indie';

-- une os jogos com suas descrições
SELECT jogos.appid, jogos.name, jogos.genres, steam_description_data.detailed_description FROM jogos
JOIN steam_description_data
ON jogos.appid = steam_description_data.steam_appid;

-- seleciona jogos com o tema: medieval;
SELECT jogos.appid, jogos.name, jogos.genres, steam_description_data.detailed_description FROM jogos
JOIN steam_description_data
ON jogos.appid = steam_description_data.steam_appid
WHERE steam_description_data.detailed_description LIKE '%magic%'; 