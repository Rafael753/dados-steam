USE steam_dados;

CREATE TABLE jogos(
	appid int ,
name text ,
release_date text ,
english int ,
developer text ,
publisher text ,
platforms text ,
required_age int ,
categories text ,
genres text ,
steamspy_tags text ,
achievements int ,
positive_ratings int ,
negative_ratings int ,
average_playtime int ,
median_playtime json ,
owners_min int,
owners_max int ,
price double,
primary key appid,
foreign key steam_appid REFERENCES steam_support_info
);

CREATE TABLE requisitos_minimos(
steam_appid int,
	requisitos_pc varchar(255) ,
requisitos_mac varchar(255) ,
requisitos_linux varchar(255) ,
requisitos_minimos varchar(255) ,
requisitos_recomendado varchar(255),
primary key steam_appid,
foreign key appid REFERENCES jogos
);

CREATE TABLE steam_support_info (
steam_appid int ,
website text ,
support_url text ,
support_email text,
primary key steam_appid,
foreign key appid REFERENCES jogos
);