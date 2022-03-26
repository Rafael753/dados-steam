USE steam_dados;

-- listar requisitos mínimos;
SELECT * FROM steam_requirements_data;

-- Memória RAM:
-- Quantos jogos precisam de 1GB DE RAM? (NÃO ESTOU CONSEGUINDO)
SELECT pc_requirements, recommended, COUNT(steam_appid) AS numero_jogos FROM steam_requirements_data WHERE pc_requirements LIKE '%1GB RAM%';