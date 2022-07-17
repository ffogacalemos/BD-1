/*1. Crie uma função que informado o número do departamento pelo usuário, calcule a
quantidade de empregados daquele departamento e retorne: enorme se a
quantidade de funcionários for maior que 100, grande se maior que 25 e médio se
maior que 10, se não estiver nesse intervalo retorne pequeno.*/
DELIMITER $$
CREATE FUNCTION empregados(dnr_p int)
RETURNS VARCHAR(13)
BEGIN
	DECLARE n_func int;
	SELECT COUNT(*) 
    INTO n_func
    FROM funcionario
    WHERE funcionario.dnr = dnr_p;
    
    if n_func <= 10 THEN
		RETURN 'pequeno';
	ELSEIF n_func <= 25 THEN
		RETURN 'medio';
	ELSE
		RETURN 'enorme';
	END IF;
END$$
DELIMITER ;

SELECT empregados(5);

/*2. Criar uma função que retorne a quantidade de funcionários supervisionados por um
determinado supervisor informado pelo usuário.*/
DELIMITER $$
CREATE FUNCTION func_sup(cpf_sup VARCHAR(11))
RETURNS INT
BEGIN
	DECLARE n_func int;
	SELECT COUNT(*) 
    INTO n_func
    FROM funcionario
    WHERE cpf_sup = Cpf_supervisor;
    
   RETURN n_func;
END$$
DELIMITER ;

SELECT func_sup('88866555576');



/*3. Crie uma função que calcule para um dado funcionário o seu salário líquido (salário
bruto menos o valor do imposto de renda) a função deve retornar o valor do salário
líquido. O imposto de renda deve ser calculado considerando que funcionários com
salário inferior a 1000.00 devem ter uma dedução de 0% do seu salário, funcionários
com salário inferior a 2000.00 devem ter uma dedução de 15% do seu salário,
funcionários com salário inferior a 3000.00 devem ter uma dedução de 22% do seu
salário e funcionários com salário superior a 3000.00 uma dedução de 27% do seu
salário.*/

DELIMITER $$
CREATE FUNCTION salarioliquido(cpf_fun VARCHAR(11))
RETURNS INT
BEGIN
	DECLARE salario_f int;
	SELECT salario
    INTO salario_f
    FROM funcionario
    WHERE cpf_fun = CPF;
    
    IF salario_f <1000 THEN
		RETURN salario_f;
	ELSEIF salario_f <2000 THEN
		RETURN salario_f - (salario_f*0.15);
	ELSEIF salario_f <3000 THEN
		RETURN salario_f - (salario_f*0.22);
	ELSE
		RETURN salario_f - (salario_f*0.27);
	END IF;
END$$
DELIMITER ;

SELECT salarioliquido('12345678966');

/*4. Criar um procedimento que calcule a quantidade de anos trabalhados na empresa
dado um determinado gerente do departamento e informe se ele já pode se
aposentar. Um gerente pode se aposentar se o tempo de serviço (anos trabalhados)
é maior que 30 anos.*/

DELIMITER $$
CREATE PROCEDURE anos_trabalhados(cpf_g VARCHAR(13), OUT aposentar VARCHAR(25))
BEGIN
	DECLARE comeco int;
	SELECT YEAR(data_inicio_gerente) FROM departamento
	WHERE cpf_g = cpf_gerente
	into comeco;
    
	IF (YEAR(curdate()) - comeco) > 30 THEN
		set aposentar = 'pode se aposentar';
	ELSE
		set aposentar = 'não pode se aposentar';
	END IF;
END$$
DELIMITER ;

CALL anos_trabalhados('88866555576', @aposentar);
SELECT @aposentar;

/*5. Criar um procedimento que dado um funcionário informe o nome dos seus
dependentes, o grau de parentesco e a idade dos mesmos.*/

DELIMITER $$
CREATE PROCEDURE func_dep(IN cpf VARCHAR(13))
BEGIN
	SELECT Nome_dependente, Parentesco, YEAR(curdate())-YEAR(Datanasc) FROM dependente
		WHERE cpf = Fcpf;
END$$
DELIMITER ;
DROP PROCEDURE func_dep;
CALL func_dep('12345678966');

/*6. Crie procedimento para imprimir a lista de aniversariantes do mês, o procedimento
deve receber como parâmetro o mês que se deseja imprimir a lista.*/

DELIMITER $$
CREATE PROCEDURE listaaniversario(mes int)
BEGIN
	SELECT * FROM funcionario
		WHERE MONTH(DATANASC) = mes;
END$$
DELIMITER ;

CALL listaaniversario(11);