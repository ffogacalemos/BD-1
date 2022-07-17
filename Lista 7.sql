use empresa;

SELECT Pnome, Minicial, Unome
FROM Funcionario
WHERE Cpf_Supervisor is null;

SELECT Pnome, Minicial, Unome
FROM Funcionario
Where cpf not in(
Select fcpf
From  Dependente);

SELECT Dnumero, count(*), AVG(salario),sum(salario)
from departamento join funcionario 
where dnumero = dnr
group by dnome;

select Pnome, Minicial, Unome
FROM funcionario
Where cpf in(select fcpf
from dependente);

select Projnumero, Projnome, count(distinct fcpf)
from projeto P join funcionario F join Trabalha_em T
where P.dnum = 5 and P.Projnumero = T.pnr and T.fcpf = F.cpf
group by projnumero;
/**/
CREATE VIEW FUNC_H AS
SELECT Pnome, Unome, Projnome, Horas
From Funcionario join projeto join trabalha_em
where cpf = fcpf and projnumero = pnr;

CREATE VIEW FUNC_P AS
SELECT Dnome, count(cpf), sum(salario)
from funcionario join departamento
where dnr = dnumero
group by Dnome;

SELECT Unome
From FUNC_H
where Projnome = 'ProdutoX';

UPDATE FUNC_H
SET Projnome = 'ProdutoW'
Where Projnome = 'ProdutoX';

DROP VIEW FUNC_H;

ALTER TABLE DEPARTAMENTO ADD total_sal float;

update departamento
set total_sal = 0;

DELIMITER $$
CREATE TRIGGER valor_total
AFTER INSERT ON Funcionario
for each row
Begin
	update departamento
    set total_sal = new.salario + total_sal
    where new.dnr = dnumero;
end$$
DELIMITER ;