use empresa;

SELECT datanasc, endereço
FROM funcionario
WHERE Pnome = 'João' AND Minicial = 'B' AND Unome = 'Silva';

SELECT Pnome, Minicial, Unome, endereço
FROM funcionario F, departamento T
WHERE F.dnr = T.Dnumero AND Dnome = 'Pesquisa';

SELECT Projnome, Dnome
FROM projeto P, departamento T 
WHERE P.projlocal = 'São Paulo' and P.dnum = T.Dnumero;

SELECT F.Pnome, F.Unome, S.Pnome AS Pnome_super, S.Unome AS Unome_super
FROM funcionario F JOIN Funcionario S 
WHERE F.cpf_supervisor = S.CPF;

SELECT salario
FROM funcionario;

SELECT DISTINCT SALARIO
from funcionario;

SELECT Pnome, Minicial, Unome
FROM funcionario
WHERE endereço LIKE '%São Paulo, SP%';

SELECT Pnome, Minicial, Unome
FROM funcionario
WHERE Datanasc LIKE '%196%';

SELECT Pnome, Minicial, Unome
From Funcionario
WHERE Dnr = 5 AND salario BETWEEN 30000 AND 40000;

SELECT * FROM FUNCIONARIO ORDER BY Pnome;

SELECT Pnome, Minicial, Unome
FROM funcionario
WHERE cpf_supervisor is null;

SELECT DISTINCT Pnome, Minicial, Unome
FROM funcionario F Join dependente D 
on F.cpf = D.fcpf;

SELECT salario*1.15 AS novo_salario
FROM funcionario
WHERE dnr = 4;

UPDATE departamento set cpf_gerente = '12345678966', Data_inicio_gerente = '2007-10-01'
WHERE Dnumero = 5;

INSERT INTO DEPENDENTE VALUES
('45345345376','João','M','1990-12-12','Marido');

DELETE FROM DEPENDENTE
WHERE Nome_dependente = 'João' and Fcpf = '45345345376';