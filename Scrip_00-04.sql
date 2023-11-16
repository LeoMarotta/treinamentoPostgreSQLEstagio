
create table aluno (
	matricula numeric(6),
	nome varchar(100),
	email varchar(100),
	telefone numeric(10),
	idade numeric(3),
	dtnascimento timestamp,
	cidade varchar(100),
	primary key (matricula)
);

create table funcionario (
	cod numeric(6),
	nome varchar(100),
	email varchar(100),
	dtcontratacao timestamp,
	codgerente numeric(6),
	salario numeric(6),
	coddepartamento numeric(6),
	primary key (cod)
);

create table matricula (
	matriculaaluno numeric(6),
	coddisciplina numeric(6),
	dtefetivado timestamp,
	primary key (matriculaaluno,coddisciplina)
);

create table disciplina (
	cod numeric(6),
	nome varchar(100),
	turma numeric(6),
	numalunos numeric(3),
	cargahoraria numeric(3),
	primary key (cod)
);

create table departamento (
	cod numeric(6),
	descricao varchar(100),
	sigla varchar(10),
	primary key (cod)
);

alter table aluno 
alter column matricula type numeric(10);

insert into aluno (matricula,nome,email,telefone,idade,dtnascimento,cidade)
values (201527701,'ANDRESSA MOREIRA DA SILVA','teste@teste',18,NULL,'01-09-2009','PELOTAS');

select *
from aluno

insert into disciplina (cod,nome,turma)
values ('369008','BANCO DE DADOS',123);

alter table funcionario 
rename column email to cargo;

insert into funcionario (cod,nome,cargo,dtcontratacao,codgerente,salario)
values (1289,'MARADONA','SUPERVISOR','23-10-1999',10,1200.10);

insert into departamento (cod,descricao,sigla)
values (12,'CONTABILIDADE','CTB');

insert into departamento (cod,descricao,sigla)
values (122,'CONTABILIDADE','CTB');

select *
from funcionario;

select matricula, nome
from aluno;

select cod, nome, salario, (salario * 1.1) as novosalario
from funcionario;

select distinct descricao as nomedepartamento, sigla as codigoreduzido
from departamento

select distinct idade
from aluno

select matricula, nome, idade, (idade + 2) as provavel_idade_formado
from aluno

insert into aluno (matricula,nome,email,telefone,idade,dtnascimento,cidade)
values (2345678,'LEONARDO MAROTTA','teste@teste',190,24,'07-06-1999','PELOTAS');

select 'aluno: ' ||  nome  || ' nascido em: ' || cidade || ' estara com a idade aproximada de ' || (idade+2) || ' ao se formar'
from aluno

select nome
from aluno
where idade='24';


select nome
from aluno
where dtnascimento = '07-06-1999';

INSERT INTO aluno ( matricula, nome, email, telefone,cidade )
VALUES ( 345,'MARIA','maria@teste',1199,'PELOTAS' ) ;

INSERT INTO aluno ( matricula, nome, email, telefone,cidade )
VALUES ( 123,'JOÃO','joao@teste',45332,'PELOTAS' ) ;

SELECT nome
FROM aluno
WHERE nome LIKE 'MAR%';

SELECT nome
FROM aluno
WHERE nome LIKE '_A%';

SELECT nome
FROM aluno
WHERE nome LIKE '%';

SELECT nome,matricula
FROM aluno
WHERE telefone IS NULL;

SELECT nome, matricula 
FROM aluno
WHERE idade >=18
AND cidade = 'PELOTAS'
AND telefone IS NOT NULL;

SELECT email,nome,matricula
FROM aluno
WHERE nome LIKE 'L%'
AND idade >=18
ORDER BY cidade ASC;

UPDATE aluno
SET idade=23
WHERE matricula=123

select *
from aluno

delete from aluno
where telefone='1199'

select *
from aluno
where telefone is null;

update aluno
set telefone= 141
where telefone is null;

update aluno 
set idade = (idade + 1)
where dtnascimento > '01-01-1980';

select *
from disciplina;

update disciplina 
set cargahoraria = 60;

select nome, salario
from funcionario
where salario > 800;

select nome, coddepartamento
from funcionario
where cod='459';

select nome, salario
from funcionario
where salario not between 950 and 2300;

select nome, cargo, dtcontratacao
from funcionario
where dtcontratacao between '20-02-2004' and '1-05-2007';

select nome, coddepartamento
from funcionario
where coddepartamento in (10,30);
order by nome;

select nome as Funcionario, salario as "Salario do mes"
from funcionario
where salario > 1500 and cod in (10,30)
order by nome;

select nome, dtcontratacao
from funcionario
where extract(year from dtcontratacao) = 1999;

select nome, cargo
from funcionario
where codgerente is null;

select nome 
from funcionario
where nome like '_A%';

update funcionario 
set coddepartamento = 10
where nome= 'MARADONA'

select *
from funcionario
where nome like '%A%A%'
and coddepartamento in (10,30) or  codgerente = '7529'
order by  coddepartamento desc;

update funcionario 
set salario = (salario + 300)
where salario < 700;


update funcionario 
set salario = (salario * 1.15)
where coddepartamento = '20';
