create view testeamd
as select a.nome, m.matriculaaluno, d.cargahoraria 
from aluno a left join matricula m on a.matricula = m.matriculaaluno
left join disciplina d on m.coddisciplina = d.cod

drop view testeamd 

create view faixaNivel
as select a.matricula, a.nome,  case 
	when a.idade between 15 and 20 then 'A'
	when a.idade between 21 and 25 then 'B'
	when a.idade between 26 and 30 then 'C'
	else 'D'
end as nivel
from aluno a 

select f.nome, d.nome, f.nivel 
from faixanivel f left join matricula m on f.matricula = m.matriculaaluno  
left join disciplina d on d.cod = m.coddisciplina  
order by nivel

select d.nome, count(*) as "Numero de alunos", f.nivel
from faixanivel f left join matricula m on f.matricula = m.matriculaaluno  
left join disciplina d on d.cod = m.coddisciplina  
group by d.nome, f.nivel 
order by "Numero de alunos", f.nivel 