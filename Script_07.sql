insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario, coddepartamento)
values (128549,'NATASHA','SUPERVISOR','23-10-1989',10,700.10, 12);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario, coddepartamento)
values (128954,'WILLIAM','SUPERVISOR','23-10-1979',10,500.10, 122);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario, coddepartamento)
values (126754,'Mikael','SUPERVISOR','23-10-1979',NULL,500.10, 12);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario, coddepartamento)
values (128784,'lethicia','SUPERVISOR','23-10-1979',NULL,500.10, 122);

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario, coddepartamento)
values (128743,'yuji','PROGRAMADOR','23-10-1979',NULL,300.10, 12);

insert into departamento (cod,descricao,sigla)
values (12,'CONTABILIDADE','CTB');

insert into departamento (cod,descricao,sigla)
values (122,'CONTABILIDADE','CTB');

update departamento 
set descricao = 'MARKETING', sigla = 'MKT' 
where cod = 122;

select *
from funcionario inner join departamento on funcionario.coddepartamento = departamento.cod
order by coddepartamento

select distinct funcionario.cargo, departamento.sigla 
from funcionario inner join departamento on funcionario.coddepartamento = departamento.cod
where departamento.sigla like 'CTB'

-- preencher alunos e disciplinas, slide 07 ex 03 DIA 2


insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (234554389,'Panda Marotta','teste1@teste', 6,'07-06-1999','PELOTAS');

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (252543859,'Gigante Marotta','teste2@teste', 9,'07-06-1999','PELOTAS');

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (256455589,'Leonardo Marotta','teste3@teste', 24,'07-06-1999','PELOTAS');

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (254323464,'Nicoletti','teste4@teste', 24,'07-06-1999','PELOTAS');

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (254633464,'Antonio','teste5@teste', 64,'07-06-1999','PELOTAS');

insert into aluno (matricula,nome,email,idade,dtnascimento,cidade)
values (254633463,'Joaquim','teste6@teste', 16,'07-06-1999','PELOTAS');

insert into disciplina (cod,nome,turma, numalunos, cargahoraria)
values ('369009','BANCO DE DADOS',123, 60, 120);

insert into disciplina (cod,nome,turma, numalunos, cargahoraria)
values ('369008','IA AVANÇADA',123, 60, 120);

insert into disciplina (cod,nome,turma, numalunos, cargahoraria)
values ('369010','SISTEMAS OPERACIONAIS',123, 60, 120);

insert into disciplina (cod,nome,turma, numalunos, cargahoraria)
values ('369011','PROGRAMACAO DE SISTEMAS', 123, 0, 120);

alter table matricula 
alter column matriculaaluno type numeric(10);

insert into matricula (matriculaaluno, coddisciplina, dtefetivado)
values ('234554389','369009','07-06-1999') 

insert into matricula (matriculaaluno, coddisciplina, dtefetivado)
values ('252543859','369009','07-06-1999') 

insert into matricula (matriculaaluno, coddisciplina, dtefetivado)
values ('256455589','369008','07-06-1999') 

insert into matricula (matriculaaluno, coddisciplina, dtefetivado)
values ('254323464','369010','07-06-1999') 

select disciplina.cod as codigoDisciplina, disciplina.nome as nomeDisciplina, count(matricula.matriculaaluno) as numeroDeAlunos
from disciplina left join matricula on disciplina.cod = matricula.coddisciplina
group by disciplina.cod, disciplina.nome
order by numeroDeAlunos

select funcionario.nome as Funcionario, departamento.sigla as Departamento
from departamento join funcionario on departamento.cod = funcionario.coddepartamento
where funcionario.nome like '%A%' or funcionario.nome like '%a%'
group by funcionario.nome, departamento.sigla

select *
from departamento join funcionario on departamento.cod = funcionario.coddepartamento
where departamento.cod = 12 and funcionario.salario >= 500

select aluno.nome as "Nome do aluno", sum(disciplina.cargahoraria) as "Carga Horaria Total"
from aluno join matricula on aluno.matricula = matricula.matriculaaluno 
join disciplina on matricula.coddisciplina = disciplina.cod
group by aluno.nome
order by aluno.nome

select d.descricao as "Nome do Departamento", d.sigla as "Sigla", count(f.cod) as "Numero de funcionarios", avg(f.salario) as "Media salarial"
from departamento d join funcionario f on d.cod = f.coddepartamento 
group by d.descricao, d.sigla

select case 
	when f.salario <= 300 then 'Pobre'
	when f.salario > 300 and f.salario <= 500 then 'Assalariado'
	else 'Burgues'
end as "Faixa salarial", count(*) as "Numero de funcionarios"
from departamento d join funcionario f on d.cod = f.coddepartamento
group by "Faixa salarial"
order by "Faixa salarial"

select a.nome, case 
	when a.idade  <= 20 then 'A'
	when a.idade > 20 and a.idade  <= 25 then 'B'
	when a.idade > 25 and a.idade  <= 30 then 'C'
	else 'D'
end as "Nivel"
from aluno a
order by "Nivel"

select d.nome as Disciplina, count(m.matriculaaluno) as "Numero de matriculados"
from disciplina d left join matricula m on d.cod = m.coddisciplina
group by d.nome 
order by "Numero de matriculados" desc

select a.nome, d.nome
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod
order by a.nome 

select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod
union all 
select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod

select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod
intersect 
select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod

select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod
except 
select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno 
left join disciplina d on m.coddisciplina = d.cod

select f.nome as "Nomes"
from funcionario f 
union all
select a.nome -- as "Aluno"
from aluno a
order by "Nomes"

select f.nome 
from funcionario f 
union
select a.nome
from aluno a

select a.nome as "Nomes"
from aluno a 
union
select d.nome 
from disciplina d
order by "Nomes"

select 'insert into aluno (matricula, nome, email, telefone, idade, dtnascimento, cidade) values (' || matricula || ', ''' || nome || ''', ''' || email || ''', ' || telefone || ', ' || idade || ', ''' || to_char(dtnascimento, 'YYYY-MM-DD HH24:MI:SS') || ''', ''' || cidade || ''');'
from aluno a
where telefone is not null
union all
select 'insert into aluno (matricula, nome, email, idade, dtnascimento, cidade) values (' || matricula || ', ''' || nome || ''', ''' || email || ''', '', ' || idade || ', ''' || to_char(dtnascimento, 'YYYY-MM-DD HH24:MI:SS') || ''', ''' || cidade || ''');'
from aluno a
where telefone is null
union all
select 'insert into funcionario (cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento) values (' || cod || ', ''' || nome || ''', ''' || cargo || ''', ''' || to_char(dtcontratacao, 'YYYY-MM-DD HH24:MI:SS') || ''', ' || codgerente || ', ' || salario || ', ' || coddepartamento || ');'
from funcionario f
where codgerente is not null
union all
select 'insert into funcionario (cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento) values (' || cod || ', ''' || nome || ''', ''' || cargo || ''', ''' || to_char(dtcontratacao, 'YYYY-MM-DD HH24:MI:SS') || ''', '', ' || salario || ', ' || coddepartamento || ');'
from funcionario f
where codgerente is null

--GAMBIARRA, PROCURAR FUNÇÃO PARA ACEITAR TIPO NULO 

