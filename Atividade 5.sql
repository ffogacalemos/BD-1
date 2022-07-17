CREATE schema EMPRESA;
USE EMPRESA;

CREATE TABLE Funcionario(
	Pnome varchar(10) NOT NULL,
    Minicial char NOT NULL,
    Unome varchar(10) NOT NULL,
    CPF varchar(11) NOT NULL,
    DATANASC date NOT NULL,
    Endereço varchar(50) NOT NULL,
    Sexo char NOT NULL check (sexo = 'M' or sexo = 'F'),
    Salario float(10,2),
    Dnr INT NOT NULL,
    Cpf_supervisor varchar(11) NULL,
    FOREIGN KEY (Cpf_supervisor) REFERENCES
	Funcionario(CPF) on delete set null on update cascade,
    primary key(CPF)
    );

CREATE TABLE Departamento(
	Dnome varchar(20) NOT NULL,
    Dnumero INT NOT NULL,
    Cpf_gerente varchar(11),
    Data_inicio_gerente date NOT NULL,
    foreign key(Cpf_gerente) REFERENCES
    Funcionario(CPF) on delete restrict on update
    cascade,
    primary key(Dnumero)
);

ALTER TABLE Funcionario ADD CONSTRAINT fk_dnr foreign key (Dnr) references
Departamento(Dnumero) on delete restrict on update cascade;

CREATE TABLE LOCALIZACOES_DEP(
	Dnumero INT NOT NULL,
    Dlocal varchar(50),
    foreign key(Dnumero) references
    Departamento(Dnumero),
    Primary key(Dnumero, Dlocal)
);

CREATE TABLE PROJETO(
	Projnome varchar(20) not null,
    Projnumero int not null,
    Projlocal varchar(50) not null,
    Dnum INT NOT NULL,
    primary key(Projnumero)
);

ALTER TABLE PROJETO ADD CONSTRAINT Dnum foreign key(Dnum) references
Departamento(Dnumero);

CREATE TABLE TRABALHA_EM(
	Fcpf varchar(11) not null,
    Pnr int not null,
    Horas float(3,1),
    Primary key(Fcpf, Pnr),
    foreign key(Fcpf) references
    Funcionario(cpf) on delete restrict on update cascade,
    foreign key(Pnr) references
    PROJETO(Projnumero) on delete restrict on update cascade
);

CREATE TABLE DEPENDENTE(
	Fcpf varchar(11) not null,
    Nome_dependente varchar(10) not null,
    Sexo char not null check(sexo = 'M' or sexo = 'F'),
    Datanasc date not null,
    Parentesco varchar(10),
	foreign key(fcpf) references FUNCIONARIO(cpf)
    on delete restrict on update cascade,
    primary key(Fcpf, Nome_dependente)
);

ALTER TABLE departamento ADD CONSTRAINT foreign key(cpf_gerente) references
Funcionario(cpf) on delete restrict on update cascade;

INSERT INTO DEPARTAMENTO(Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente)
VALUES('Pesquisa', 5, NULL, '1968-05-22'),
		('Administracao', 4, NULL, '1995-01-01'),
        ('Matriz', 1, NULL, '1961-06-19');
        
INSERT INTO FUNCIONARIO(Pnome, Minicial, Unome, CPF, DATANASC, ENDEREÇO, SEXO, SALARIO, CPF_SUPERVISOR, DNR)
VALUES	('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1),
	('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
	('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
	('André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4),
    ('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza de Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
    ('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
    ('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
	('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5);
INSERT INTO localizacoes_dep(Dnumero, Dlocal)
VALUES (1, 'São Paulo'),
    (4, 'Mauá'),
    (5, 'Santo André'),
    (5, 'Itu'),
    (5, 'São Paulo');
    
INSERT INTO projeto(Projnome, Projnumero, Projlocal, Dnum)
VALUES ('ProdutoX', 1, 'Santo André', 5),
    ('ProdutoY', 2, 'Itu', 5),
    ('ProdutoZ', 3, 'São Paulo', 5),
    ('Informatização', 10, 'Mauá', 4),
    ('Reorganização', 20, 'São Paulo', 1),
    ('Novosbenefícios', 30, 'Mauá', 4);

INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
VALUES ('12345678966', 1, 32.5),
	('12345678966', 2, 7.5),
	('66688444476', 3, 40.0),
	('45345345376', 1, 20.0),
	('45345345376', 2, 20.0),
	('33344555587', 2, 10.0),
	('33344555587', 3, 10.0),
	('33344555587', 10, 10.0),
	('33344555587', 20, 10.0),
	('99988777767', 30, 30.0),
	('99988777767', 10, 10.0),
	('98798798733', 10, 35.0),
	('98798798733', 30, 5.0),
	('98765432168', 30, 20.0),
	('98765432168', 20, 15.0),
	('88866555576', 20, NULL);
    
INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
VALUES ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
    ('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
    ('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
    ('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
    ('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
    ('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
    ('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

UPDATE DEPARTAMENTO SET Cpf_gerente = '33344555587' WHERE Dnumero = 5;
UPDATE DEPARTAMENTO SET Cpf_gerente = '98765432168' WHERE Dnumero = 4;
UPDATE DEPARTAMENTO SET Cpf_gerente = '88866555576' WHERE Dnumero = 1;


