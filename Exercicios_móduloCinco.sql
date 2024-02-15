/* Utilize o dataset público “thelook_ecommerce”, que está presente no projeto
“bigquery-public-data” para trazer o identificador único dos usuários, o primeiro
nome, email e idade, ordernados pela data de criação do cadastro. */
select
id,
first_name,
email,
age
from bigquery-public-data.thelook_ecommerce.users
order by created_at;

/* No mesmo dataset do exercício anterior, extraia os pedidos que tenham status
“Shipped” ou “Processing”.*/
select
*
from bigquery-public-data.thelook_ecommerce.orders
where status ="Shipped" or status = "Processing";

/* Considerando o mesmo exercício anterior, traga os pedidos que sejam foram
criados no dia “2022-04-05” e, ao mesmo tempo, tenham status “Cancelled” */
select
order_id,
status,
created_at,
date(created_at) as dia
from bigquery-public-data.thelook_ecommerce.orders
where date (created_at) ="2022-04-05" and status = "Cancelled";

/* O time de marketing deseja fazer uma campanha em um país específico, com o
mesmo dataset dos itens anteriores. Para isso, eles te pedem os e-mails de todos
os clientes que moram no Brasil. */
select
id,
first_name as nome,
email
from bigquery-public-data.thelook_ecommerce.users
where country = "Brasil" and email is not null;

/*  No mesmo dataset anterior, traga o nome dos usuários e o id de seus pedidos. */
select
  u.first_name,
  o.order_id
from bigquery-public-data.thelook_ecommerce.users u
join bigquery-public-data.thelook_ecommerce.orders as o on u.id = o.user_id ;

/*Vá ao dataset público “baseball” e na tabela “schedules” traga os identificadores
únicos, o nome do time da casa e o nome do time de fora de casa dos jogos em
que a duração foi maior ou igual a 250 minutos e menos de 25 mil espectadores.*/
select
  gameID,
  homeTeamName,
  awayTeamName,
  duration_minutes,
  attendance
from bigquery-public-data.baseball.schedules
where duration_minutes >= 250 and attendance < 25000;

/*No mesmo dataset e tabela, retorne os jogos que começaram entre maio e junho
de 2016. */
select
  *
from bigquery-public-data.baseball.schedules
where date(startTime) between "2016-05-01" and "2016-06-30";

/* DESAFIO: No mesmo dataset anterior, descubra o nome dos times que tenham
somente 6 caracteres, usando o like. Retorne de forma única. */
select distinct
  homeTeamNAme
from bigquery-public-data.baseball.schedules
where homeTeamNAme like '______';
