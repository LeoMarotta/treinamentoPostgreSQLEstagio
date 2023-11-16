select current_date ;

select extract (dow from current_timestamp);

select cod, nome, (salario*1.15) as salario
from funcionario

select cod, nome, (salario*1.15) as salarioNovo, ((salario*1.15) - salario) as aumento
from funcionario

select nome, dtcontratacao, dtcontratacao + interval '6 months'
from funcionario

select nome, 
		round(extract (year from age(current_date,dtcontratacao)) * 12 + extract (month from age(current_date,dtcontratacao))) as "numero de meses"
from funcionario
ORDER by "numero de meses"


select 'O ' || nome || ' recebe R$' || salario || ' mensalmente, mas deseja receber ' || (salario * 4) as sonho 
from funcionario

select initcap((lower(nome)))
from funcionario
where nome like  'J%' or nome like 'M%'
ORDER by length(nome)

select nome, extract(dow from dtcontratacao)
from funcionario
order by extract(dow from dtcontratacao) 

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (23456789,'Toddy Mucci','teste@teste',24,'07-06-1999','PELOTAS');

select nome, coalesce(cast (telefone as text), 'Sem telefone') as telefone	
from aluno

select *
from aluno

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario)
values (128549,'NATASHA','SUPERVISOR','23-10-1989',10,700.10);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario)
values (128954,'WILLIAM','SUPERVISOR','23-10-1979',10,500.10);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario)
values (126754,'Mikael','SUPERVISOR','23-10-1979',NULL,500.10);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario)
values (128784,'lethicia','SUPERVISOR','23-10-1979',NULL,500.10);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario)
values (128743,'yuji','PROGRAMADOR','23-10-1979',NULL,300.10);

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (234554389,'Panda Marotta','teste@teste', 6,'07-06-1999','PELOTAS');

select nome, lpad('', (salario/100)::int, '*')  as salarioMudado
from funcionarioaa6
order by salario desc;

select nome, case 
				when idade <= 18 then 'Categoria A'
				when idade <= 30 then 'Categoria B'
				when idade <= 61 then 'Categoria C'
				else 'Categoria D'
end as "faixa de idade"
from aluno

select max(salario) as maior, avg(salario) as media, min(salario) as menor, sum(salario) as soma
from funcionario

select round(max(salario)) as maior, round(avg(salario)) as media, round(min(salario)) as menor, round(sum(salario)) as soma
from funcionario

select count(*) as "funcionarios totais", count(case when codgerente is not null then 1 end) as "funcionarios com gerente"
from funcionario


select cargo, max(salario) as maior, avg(salario) as media, min(salario) as menor, sum(salario) as soma
from funcionario
group by cargo;

select cargo, count(*) as "funcionarios por cargo"
from funcionario
group by cargo;

select codgerente, min(salario) as menorsalario
from funcionario
group by codgerente;

select extract(year from dtcontratacao) as ano, count(*) as funcionarios
from funcionario
where extract(year from dtcontratacao) >= 1800
group by ano


