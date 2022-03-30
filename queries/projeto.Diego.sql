use projeto;
select * from steam;

# 1 . Qual o gênero e a categoria mais utilizada?
select categories as categorias, genres as generos, owners as proprietarios from steam group by owners;
create view generos_mais_utilizados as select categories as categorias, genres as generos, owners as proprietarios from steam group by owners;
select * from generos_mais_utilizados;

/* 5 . Defina os jogadores com suas respectivas idades */
select name as Games, case
when required_age >= 18
then 'Maiores de 18'
when required_age >= 12
then 'Adolescente'
else 'Crianças' 
end as Categorias from steam group by appid;

create view definicao as 
select name as Games, case
when required_age >= 18
then 'Maiores de 18'
when required_age >= 12
then 'Adolescente'
else 'Crianças' 
end as Categorias from steam group by appid;
select * from definicao;






