BEGIN;
INSERT INTO departamento(cod, descricao)
VALUES (20, 'ALMOXARIFADO');
INSERT INTO funcionario(cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1000, 'JOÃO','CONTADOR', '01/03/2007', null, 2000, 20);
INSERT INTO funcionario(
cod, nome, cargo, dtcontratacao, codgerente, salario, coddepartamento)
VALUES (1001, 'PEDRO','COORDENADOR', '11/04/2007', null, 3000, 20);
commit;

select *
from funcionario f