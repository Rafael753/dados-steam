use projeto;
select * from steam;

# 1 . Qual o gênero e a categoria mais utilizada?
select categories as categorias, genres as generos, owners as proprietarios from steam group by owners;
create view generos_mais_utilizados as select categories as categorias, genres as generos, owners as proprietarios from steam group by owners;
select * from generos_mais_utilizados;

-- Faixas etárias X faturamento
# 4 . Quais são os games que exigem a idade mínima, e qual a menor idade?
select name as nomes, required_age as idade_exigida from steam where not required_age = 0 order by idade_exigida;
create view idades_exigida as select name as nomes, required_age as idade_exigida from steam where not required_age = 0 order by idade_exigida;
select * from idades_exigida;

# 5 . Defina os jogadores com suas respectivas idades.
select name as Games, case
when required_age >= 18
then 'Acima de 18 anos'
when required_age >= 12
then 'Acima de 12 anos'
else 'Sem restrições de idade' 
end as Categorias from steam group by appid;

create view definicoes as 
select name as Games, case
when required_age >= 18
then 'Acima de 18 anos'
when required_age >= 12
then 'Acima de 12 anos'
else 'Sem restrições de idade' 
end as Categorias from steam group by appid;
select * from definicoes;

-- qtde de games x plataformas
-- plataformas x faturamento
# 6 . Qual game e desenvolvedora de games é compatível com a plataforma mac e linux?
select name as nomes, developer as desenvolvedora, platforms as plataformas from steam where not platforms like 'windows';
create view compatibilidades as select name as nomes, developer as desenvolvedora, platforms as plataformas from steam where not platforms like 'windows';
select * from compatibilidades;

-- fantástico! Seria ótimo excluir os grátis, e ver quais sao os seus faturamentos.
# 9 . Quais os games suportam a categoria multi-player?
select * from steam where categories like '%Multi-Player%';
create view categoria_multi_player as select * from steam where categories like '%Multi-Player%';
select * from categoria_multi_player;

-- seria melhor se incluíssemos uma analise de preço, relacionando preço médio, avaliação média e/ou quantidade de clientes que tem o jogo.
-- como o preço impacta nas vendas e na avaliação do jogo
# 11 . Qual game mais barato, que não seja grátis? 
select name as nomes, price as preco from steam where not price = 0 order by price; 
create view melhor_preco as select name as nomes, price as preco from steam where not price = 0 order by price; 
select * from melhor_preco;





