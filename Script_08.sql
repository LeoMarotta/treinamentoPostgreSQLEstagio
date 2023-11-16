--SLIDES 8 CONSULTAS ANINHADAS
-- PROCURAR FUNÇÃO PARA ACEITAR TIPO NULO


select nome, dtcontratacao
from funcionario f 
where coddepartamento in (
	select coddepartamento 
	from funcionario
	where nome = 'NATASHA'
) and nome <> 'NATASHA'

select nome, dtcontratacao
from funcionario f 
where exists (
	select 0
	from funcionario f2 
	where f2.nome = 'NATASHA' and f.coddepartamento = f2.coddepartamento 
) and nome <> 'NATASHA'

select cod, nome
from funcionario f 
where salario >= (
	select avg(f2.salario)
	from funcionario f2 
)
order by salario desc

select f.cod, f.nome 
from funcionario f 
where coddepartamento in (
	select coddepartamento 
	from funcionario f2 
	where f2.nome like '%W%' or f2.nome like '%w%'
)

select nome, dtcontratacao, salario 
from funcionario f 
where salario > (
	select avg(f2.salario)
	from funcionario f2 
)
order by salario desc

select *
from aluno a left join matricula m on a.matricula = m.matriculaaluno
left join disciplina d on m.coddisciplina = d.cod
where d.cod = (select d.cod from aluno a left join matricula m on a.matricula = m.matriculaaluno
left join disciplina d on m.coddisciplina = d.cod where a.nome = 'Panda Marotta')

select a.nome
from aluno a 
where a.matricula in (
	select m.matriculaaluno
	from matricula m
	where m.coddisciplina in (
		select m.coddisciplina 
		from matricula m
		where m.matriculaaluno = ( select matricula from aluno where nome = 'Panda Marotta' )
	) and m.matriculaaluno  <> ( select matricula from aluno where nome = 'Panda Marotta' )
)

select a.nome
from aluno a 
where exists (
	select 0
	from matricula m
	where m.coddisciplina in (
		select m2.coddisciplina 
		from matricula m2
		where m2.matriculaaluno = ( select matricula from aluno where nome = 'Panda Marotta' )
	) and m.matriculaaluno = a.matricula and a.nome <> 'Panda Marotta'
)


