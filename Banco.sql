CREATE schema BANCO;
use BANCO;

CREATE TABLE BANCO(
Codigo int not null,
Nome VARCHAR(35),
primary key(codigo)
);

CREATE TABLE AGENCIA(
Cod_banco int not null,
Numero_agencia int not null,
Endereco VARCHAR(45),
foreign key (cod_banco) references banco(codigo) 
ON DELETE CASCADE ON UPDATE CASCADE,
primary key(Numero_agencia, Cod_banco)
);

CREATE TABLE CLIENTE(
cpf VARCHAR(16) not null,
Nome varchar(35),
Sexo char,
Endereco varchar(45),
primary key(cpf)
);

CREATE TABLE CONTA(
Numero_conta VARCHAR(8) not null,
Saldo DECIMAL(10,2),
Tipo_conta int not null,
num_agencia int not null,
Primary key(Numero_conta)
);
CREATE TABLE HISTORICO(
Cpf_cliente VARCHAR(16) not null,
Num_conta VARCHAR(8) not null,
Data_inicio date,
primary key(Cpf_cliente, Num_conta)
);
CREATE TABLE TELEFONE_CLIENTE(
Cpf_cli VARCHAR(16) not null,
Telefone char(13) not null,
primary key(Cpf_cli, Telefone)
);

ALTER TABLE CONTA ADD CONSTRAINT num_agencia
foreign key (num_agencia) references AGENCIA(Numero_agencia)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE HISTORICO ADD CONSTRAINT Cpf_cliente
foreign key(Cpf_cliente) references Cliente(cpf)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE HISTORICO ADD CONSTRAINT Num_conta
foreign key(Num_conta) references Conta(numero_conta)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE TELEFONE_CLIENTE ADD CONSTRAINT cpf_cli
foreign key(cpf_cli) references Cliente(cpf)
ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO BANCO VALUES
(1, "Banco do Brasil"),
(4, "CEF");

INSERT INTO AGENCIA VALUES
(4, 0562, "Rua Joaquim Teixeira Alves, 1555"),
(1, 3153, "Av. Marcelino Pires, 1960");

INSERT INTO CLIENTE VALUES
("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"),
("666.777.888.99", "Caetano K Lima", "M", "Rua Ivinhema, 879"),
("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos, 735");

INSERT INTO CONTA VALUES
("86340-2", 763.05, 2, 3153),
("23584-7", 3879.12, 1, 0562);

INSERT INTO HISTORICO VALUES
("111.222.333-44", "23584-7", "1997-12-17"),
("666.777.888.99", "23584-7", "1997-12-17"),
("555.444.777-33", "86340-2", "2010-11-29");

INSERT INTO TELEFONE_CLIENTE VALUES
("111.222.333-44", "(67)3422-7788"),
("666.777.888.99", "(67)3423-9900"),
("555.444.777-33", "(67)8121-8833");