use projeto;
select * from steam;

# 1 . Qual o gênero e a categoria mais utilizada?
select categories as categorias, genres as generos, owners as proprietarios from steam group by owners;
create view generos_mais_utilizados as select categories as categorias, genres as generos, owners as proprietarios from steam group by owners;
select * from generos_mais_utilizados;

-- relevante somente se relacionarmos esses games com seus gêneros, pra der uma ideia do que sugerir ao cliente como oportunidade a ser explorada
# 2 . Quais o nomes dos games com as 5 piores avaliações?
select name as nomes, negative_ratings as avaliacoes_negativas from steam order by avaliacoes_negativas desc limit 5;
create view piores_avaliacoes as select name as nomes, negative_ratings as avaliacoes_negativas from steam order by avaliacoes_negativas desc limit 5;
select * from piores_avaliacoes;

-- irrelevante, a não ser que queiramos sugerir pro cliente algo sobre conquistas. Qual quantidade de conquistas sugerimos? Poderíamos utilizar os 100 jogos mais bem avaliados e ver qual a média de conquistas deles para resultar em uma resposta mais relevante.
# 3 . Quais games tiveram conquistas, e qual a maior delas?
select name as nomes, achievements as conquistas from steam group by conquistas order by conquistas desc;
create view consquistas as select name as nomes, achievements as conquistas from steam group by conquistas order by conquistas desc;
select * from consquistas;

-- seria melhor se relacionado com o faturamento e/ou avaliação média, para podermos sugerir quais faixas etárias de jogadores compram mais ou são mais ou menos exigentes.
# 4 . Quais são os games que exigem a idade mínima, e qual a menor idade?
select name as nomes, required_age as idade_exigida from steam where not required_age = 0 order by idade_exigida;
create view idades_exigida as select name as nomes, required_age as idade_exigida from steam where not required_age = 0 order by idade_exigida;
select * from idades_exigida;

-- Alterar para maiores de 18, adolescente (12 a 18 anos) e crianças (menores de 12). Veteranos, intermediários e inciantes não necessariamente indica a idade de quem joga. Mas essa parte é fantástica!
# 5 . Defina os jogadores com suas respectivas idades.
select name as Games, case
when required_age >= 18
then 'Veteranos'
when required_age >= 12
then 'Intermediarios'
else 'Iniciantes' 
end as Categorias from steam group by appid;

create view definicoes as 
select name as Games, case
when required_age >= 18
then 'Veteranos'
when required_age >= 12
then 'Intermediarios'
else 'Iniciantes' 
end as Categorias from steam group by appid;
select * from definicoes;

-- melhor se, em vez de listarmos os games, tiraríamos uma lista agrupada por plataforma com o número total de games, e a média total de faturamento para sugerirmos ao cliente o quanto mudar de plataforma impacta nas vendas. Incluir também uma linha que inclui multiplataforma (windows, linux e mac)
# 6 . Qual game e desenvolvedora de games é compatível com a plataforma mac e linux?
select name as nomes, developer as desenvolvedora, platforms as plataformas from steam where not platforms like 'windows';
create view compatibilidades as select name as nomes, developer as desenvolvedora, platforms as plataformas from steam where not platforms like 'windows';
select * from compatibilidades;

-- eu tiraria este, a nao ser que queiramos sugerir uma melhor data no ano para lançamento (uma varíavel muito difícil para o cliente controlar na prática, visto que são o publisher e nao o desenvolvedor)
# 7 . Qual a data de lançamento que ocorreram a maior qtd de games do gênero RPG, horror.
select * from steam where genres like 'rpg' or 'horror' order by positive_ratings desc;
create view lancamentos as select * from steam where genres like 'rpg' or 'horror' order by positive_ratings desc;
select * from lancamentos;

-- já fiz esse nas minhas queries, relacionando editoras, com qtde media d paginas d suporte para deixar claro para o clientes quantas paginas de suporte ele deve manter. Eu tirara esta, porque está redundante;
# 8 . Diga os games com os emails de suport oferecidos pela desenvolvedora.
select steam.name as nome, steam.developer as desenvolvedora, steam_support_info.support_email as suporte from steam inner join steam_support_info on(appid = steam_appid) where not support_email = '' group by support_email ;
create view suporte as select steam.name as nome, steam.developer as desenvolvedora, steam_support_info.support_email as suporte from steam inner join steam_support_info on(appid = steam_appid) where not support_email = '' group by support_email ;
select * from suporte;

-- fantástico! Seria ótimo excluir os grátis, e ver quais sao os seus faturamentos.
# 9 . Quais os games suportam a categoria multi-player?
select * from steam where categories like '%Multi-Player%';
create view categoria_multi_player as select * from steam where categories like '%Multi-Player%';
select * from categoria_multi_player;

-- Eu tiraria esta.
# 10 . Quais jogos da plataforma Mac que não foi publicada pela valve?
select name as nomes, platforms as plataformas, publisher as editoras from steam where platforms = 'windows;mac' and not publisher = 'valve';
create view publicacao as select name as nomes, platforms as plataformas, publisher as editoras from steam where platforms = 'windows;mac' and not publisher = 'valve';
select * from publicacao;

-- seria melhor se incluíssemos uma analise de preço, relacionando preço médio, avaliação média e/ou quantidade de clientes que tem o jogo.
# 11 . Qual game mais barato, que não seja grátis? 
select name as nomes, price as preco from steam where not price = 0 order by price; 
create view melhor_preco as select name as nomes, price as preco from steam where not price = 0 order by price; 
select * from melhor_preco;

-- melhor se segmentado pro genero, excluindo os jogos grátis. O foco do trabalho é rentabilidade.
# 12 . Qual o maior tempo de jogo e quantos são os proprietários?
select name as nomes, median_playtime as tempo_de_jogo, owners as proprietarios from steam order by median_playtime desc;
create view duracao as select name as nomes, median_playtime as tempo_de_jogo, owners as proprietarios from steam order by median_playtime desc;
select * from duracao;

-- idem acima. eu tiraria esta pergunta, porque parece com a de cima
# 13 . Qual o game mais jogado?
select name as nomes, positive_ratings as avaliacoes_positivas, owners as proprietarios from steam order by positive_ratings desc;
create view jogatina as select name as nomes, positive_ratings as avaliacoes_positivas, owners as proprietarios from steam order by positive_ratings desc;
select * from jogatina;

-- melhor se segmentado pro genero, excluindo os jogos grátis. O foco do trabalho é rentabilidade.
# 14 . Qual a média de hora de cada game?
select name as nomes, average_playtime as tempo_médio_de_jogo from steam group by average_playtime;
create view media_de_jogo as select name as nomes, average_playtime as tempo_médio_de_jogo from steam group by average_playtime;
select * from media_de_jogo;

-- melhor se segmentado pro genero, excluindo os jogos grátis. O foco do trabalho é rentabilidade. Já fiz isso no meu, logo acho que vc pode tirar esta.
# 15 . Qual a avaliação dos 100 games mais jogados?
select name as nomes, negative_ratings as avaliacao_negativa, positive_ratings as avaliacao_positiva from steam group by negative_ratings order by positive_ratings desc limit 100;
create view avaliacoes as select name as nomes, negative_ratings as avaliacao_negativa, positive_ratings as avaliacao_positiva from steam group by negative_ratings order by positive_ratings desc limit 100;
select * from avaliacoes;

-- não é isso que custo benefício representa pro nosso cliente. Eu tiraria esta.
# 16 . Qual o game teve o melhor custo benefício?
select name as nomes, owners as proprietarios, price as preco from steam where not price = 0 order by owners desc limit 1;
create view custo_beneficio as select name as nomes, owners as proprietarios, price as preco from steam where not price = 0 order by owners desc limit 1;
select * from custo_beneficio;

-- Já incluí uma análise da concorrencia nas minhas perguntas. Eu tiraria esta.
# 17 . Quais o games desenvolvidos pela valve?
select name as nomes, developer as desenvolvedoras from steam where developer like 'valve%';
create view desenvolvedoras_valve as select name as nomes, developer as desenvolvedoras from steam where developer like 'valve%';
select * from desenvolvedoras_valve;

-- que informação relevante isso geraria pro cliente?
# 18 . Quais as editoras que menos publicaram games?
select name as nomes, publisher as editoras, count(publisher) as quantidade from steam group by publisher order by count(publisher);
create view qtd_de_publicacao as select name as nomes, publisher as editoras, count(publisher) as quantidade from steam group by publisher order by count(publisher);
select * from qtd_de_publicacao;



