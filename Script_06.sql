drop table aluno

drop table departamento 

drop table disciplina 

drop table funcionario 

drop table matricula 


create table aluno (
	matricula numeric(10),
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
	cargo varchar(100),
	dtcontratacao timestamp,
	codgerente numeric(6),
	salario numeric(6),
	coddepartamento numeric(6),
	primary key (cod),
	foreign key (coddepartamento) references departamento(cod)
);

create table matricula (
	matriculaaluno numeric(6),
	coddisciplina numeric(6),
	dtefetivado timestamp,
	primary key (matriculaaluno,coddisciplina),
	foreign key (coddisciplina) references disciplina(cod),
	foreign key (matriculaaluno) references aluno(matricula)
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
add constraint unica unique (email);

