select Pnome, Minicial, Unome
from funcionario, professor p, turma t
where idFuncionario = p.idProfessor AND p.idProfessor = t.idProfessor AND t.Descricao = 'T1 - Química';

select Pnome, Minicial, Unome
from estudante natural join pagamento
where statusPagamento = 'Pago';

select Pnome, Minicial, Unome
from funcionario
where idFuncionario not in(select idProfessor from professor);

select descricao, avg(salario) as media_salario
from turma natural join professor, funcionario
where idProfessor = idFuncionario AND idTurma in 
(select idTurma from turma where data_inicio like '2021-__-__')
group by descricao;

select count(*) as Doutores
from funcionario
where idFuncionario in
(select idProfessor from professor where grau_academico = 'Doutor');

create view professores as
select professor.idProfessor, turma.idTurma, descricao, 
count(estudante.idEstudante) as numero_estudantes
from Professor, Turma, TurmaEstudante, Estudante
where professor.idProfessor = Turma.IdProfessor AND turmaEstudante.IdTurma = turma.IdTurma 
AND turmaEstudante.IdEstudante = Estudante.IdEstudante
group by idProfessor;

DELIMITER $$
CREATE TRIGGER tr_salario
AFTER UPDATE ON PROFESSOR
FOR EACH ROW 
BEGIN
	If old.grau_academico != new.grau_academico THEN
		Update funcionario set salario = salario *1.15 where new.idProfessor = idFuncionario 
        AND new.grau_academico = 'Mestre';
		Update funcionario set salario = salario *1.30 where new.idProfessor = idFuncionario 
        AND new.grau_academico = 'Doutor';
	END IF;
END $$
DELIMITER ;

drop trigger tr_salario;

select idFuncionario, salario from funcionario where idFuncionario = 319;

update escola_tecnica.professor set grau_academico = 'Doutor' where idProfessor = 319;

