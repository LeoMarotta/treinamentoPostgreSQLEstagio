select count(reganimal.id), gerpessoafisica.nome 
from reganimal left join regproprietario on reganimal.id = regproprietario.animalid
left join regsolicitante on regproprietario.solicitanteid = regsolicitante.id
left join gerpessoafisica on gerpessoafisica.id = regsolicitante.pessoaid
where datamorte is null and gerpessoafisica.nome is not null 
group by gerpessoafisica.nome
order by count(reganimal.id) desc
limit 10; -- 11:06

------------------------------------

select gerpessoafisica.nome
from gerpessoafisica
where gerpessoafisica.nome is not null
union all 
select gerpessoajuridica.nomefantasia 
from gerpessoajuridica
where gerpessoajuridica.nomefantasia is not null

select count(reganimal.id)
from reganimal
where datamorte is null 

-------------------------------------------------------


select 
count(ra.id) as "Numero de animais",
gf.nome as "Nome"
from reganimal as ra
left join regproprietario rp on ra.id = rp.animalid
left join regsolicitante rs on rp.solicitanteid = rs.id
left join gerpessoafisica gf on gf.id = rs.pessoaid
where datamorte is null and gf.nome is not null and rp.datafinal is null 
group by gf.nome
union all 
select 
count(ra.id) as "Numero de animais" ,
gj.nomefantasia as "Nome"
from reganimal as ra
left join regproprietario rp on ra.id = rp.animalid
left join regsolicitante rs on rp.solicitanteid = rs.id
left join gerpessoajuridica as gj on gj.id = rs.pessoaid
where datamorte is null and gj.nomefantasia is not null and rp.datafinal is null
group by gj.nomefantasia
order by "Numero de animais" desc
limit 10;

---------------------------------------------------------------------------

select 
count(ra.id) as "Numero de animais",
coalesce(pf.nome, pj.nomefantasia) as "Nome"
from reganimal as ra
join regproprietario rp on ra.id = rp.animalid
join regsolicitante rs on rp.solicitanteid = rs.id
left join gerpessoafisica pf on pf.id = rs.pessoaid
left join gerpessoajuridica as pj on pj.id = rs.pessoaid
where datamorte is null and rp.datafinal is null and ra.status = 0
group by coalesce(pf.nome, pj.nomefantasia)
order by "Numero de animais" desc
limit 10;

----------------------------------------------------------------------------

