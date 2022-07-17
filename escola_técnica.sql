create schema escola_tecnica;
use escola_tecnica;

/*
Trabalho de Banco de dados 
Alunos: Fabricio Fogaça da Silva Lemos, Felipe Emanuel Ferreira, Samir Barcelos Murad
*/
/*Criação de tabelas*/
CREATE TABLE Funcionario
(
    idFuncionario INT NOT NULL,
    Pnome VARCHAR(50) NOT NULL,
    Minicial CHAR NOT NULL,
    Unome VARCHAR(50) NOT NULL,
    Cpf CHAR(14) NOT NULL UNIQUE,
    funcao VARCHAR(120) NOT NULL,
    Sexo CHAR NOT NULL,
    Datanasc DATE NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    email VARCHAR(50) NOT NULL,
    celular VARCHAR(15) NOT NULL,
	PRIMARY KEY(idFuncionario)
);

CREATE TABLE Professor
(
	idProfessor INT NOT NULL,
    grau_academico VARCHAR(20) NOT NULL,
    FOREIGN KEY (idProfessor) REFERENCES Funcionario(idFuncionario)
    ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idProfessor)
);

CREATE TABLE Curso
(
    idCurso INT NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    Aulas INT NOT NULL,
    Periodo VARCHAR(15) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL, /*valor integral do curso*/
    PRIMARY KEY(idCurso)
);

CREATE TABLE Turma
(
    idTurma INT NOT NULL,
    Descricao VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL, 
    data_termino DATE NOT NULL,
    idProfessor INT NOT NULL,
    idCurso INT NOT NULL,
		FOREIGN KEY(idProfessor) REFERENCES Professor(idProfessor)
    ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (idCurso)REFERENCES Curso(idCurso)
    ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idTurma)
);
CREATE TABLE Aula 
(
    idDia INT NOT NULL,
    nomeDia VARCHAR(50) NOT NULL, /*segunda-feira, terça-feira, etc*/
    Horario VARCHAR(20) NOT NULL,    		/*ex: 9:15 - 10:50*/
    PRIMARY KEY(idDia)
); 

CREATE TABLE Estudante
(	
	Pnome VARCHAR(20) NOT NULL,
    Minicial CHAR NOT NULL,
    Unome VARCHAR(20) NOT NULL,
    idEstudante INT NOT NULL,
    Cpf CHAR(14) NOT NULL UNIQUE,
    datanasc DATE NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Sexo CHAR NOT NULL,
    email VARCHAR(50) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    PRIMARY KEY(idEstudante)
);

CREATE TABLE turmaEstudante
(
    idTurma INT NOT NULL,
    idEstudante INT NOT NULL, 
    FOREIGN KEY(idTurma)REFERENCES Turma(idTurma)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idEstudante) REFERENCES Estudante(idEstudante)
    ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idTurma, idEstudante)
);


CREATE TABLE Pagamento
(
    idPagamento INT NOT NULL,
    dataPagamento DATE NOT NULL,
    Quantia DECIMAL(10, 2) NOT NULL,
    statusPagamento VARCHAR(20) NOT NULL,
    idEstudante INT NOT NULL,
    FOREIGN KEY(idEstudante) REFERENCES Estudante(idEstudante)
    ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idPagamento)
);

INSERT INTO Funcionario VALUES
(001, "Rinaldo", "T", "Carmo", "741.763.229-77", "Gerente", 'M', '1987/01/20', "Rua Marechal Deodoro, 315", 5000.00, "rinaldo.carmo@outlook.com", "(67)96772-8251"),
(002, "Irinea", "W", "Veiga", "397.431.652-31", "Gerente-assistente", "F", "1985/02/26", "Rua Diamantina, 556", 4500.00, "irinea.veiga@hotmail.com","(67)98811-4838"),
(003, "Júlio", "S", "Caruso", "411.572.702-04", "Administrativo", "M","1990/07/11","Rua Acre, 6970", 3100.00, "julio.caruso@gmail.com", "(67)99214-4043"),
(004, "Leandra ", "T", "Medel", "232.224.561-51", "Administrativo", "F", "1991/04/10", "Rua Itiquira, 780", 3100.00, "leandra.medel@gmail.com.com", "(67)98205-2720"),
(005, " Lourimar", "B", "Peres", "139.213.171-50", "Recursos Humanos", "M", "1996/04/06", "Avenida Machado de Assis, 445", 2500.00, "lourimar.peres@hotmail.com", "(67)99274-7288"),
(006, "Kelvin", "F", "Sales", "402.256.962-07", "Serviços gerais", "M", "1990/03/15", "Rua Sol, 106", 2200.00,"kelvin.sales@gmail.com", "(67)99457-7398"),
(007, "Edmila", "T", "Guimarães", "116.068.474-06", "Serviços gerais", "F", "1989/08/22", "Avenida Daiana Aguiar, 717",2200.00, "edmila.guimaraes_321@yahoo.com", "(67)98541-6885"),
(015, "Maria", "H", "Bastos", "658.255.150-70", "Estágio", "F", "2001/11/27", "Rua Quintino Bocaiúva, 130", 1200.00, "maria.siqueira@outlook.com", "(67)98362-8366"),
(022, "Paloma", "B", "Marques", "459.063.953-00", "Docente", "F", "1990/08/19", "Rua Santo Antônio, 4032", 4000.00, "paloma.marques@gmail.com", "(67)97984-5127"),
(101, "Quezia", "B", "Albergaria", "126.274.743-08", "Docente", "F", "1970/01/23", "Rua Campo Verde, 608", 4500.00, "quezia.albergaria@hotmail.com", "(67)99945-7090"),
(207, "Otavio ", "W", "Cunha", "307.719.333-71", "Docente", "M", "1982/07/29", "Avenida Seriema, 356", 4000.00, "otavio.cunha@bing.com", "(67)99775-7181"),
(358, "Humberto", "G", "Torres", "723.671.374-04", "Docente", "M", "1974/10/25", "Rua 25 de março, 505", 4200.00, "humberto.torres@yahoo.com", "(67) 96931-3106"),
(319, "Arielle", "N", "Eger", "739.155.274-75", "Docente", "F", "1969/07/26", "Rua dos ipes, 240", 4500.00, "arielle.eger@uol.com.br", "(67)97251-4876"),
(350, "Juliette", "F", "Feitosa", "153.643.885-57", "Docente", "F", "1965/09/12", "Avenida Caramuru, 3005", 5000.00, "juliete.lima@bol.com.br", "(67)97393-7733");

INSERT INTO Professor VALUES
(022, "Bacharel"),
(101, "Bacharel"),
(207, "Mestre"),
(358, "Bacharel"),
(319, "Mestre"),
(350, "Doutor");

INSERT INTO Curso VALUES
(500, "Técnico em administração", 800, "3 anos", 11900.00),
(501, "Técnico em Açúcar e Álcool", 800, "3 anos", 13600.00),
(502, "Técnico em Segurança no Trabalho", 320, "1 ano", 2400.00),
(503, "Técnico em Química ", 600, "2.5 anos", 13000.00),
(504, "Técnico em Eletrotécnica", 800, "3 anos", 17000.00),
(505, "Técnico em Edificações", 320, "1 ano", 2400.00),
(506, "Técnico em Automação Industrial", 800, "3 anos", 15000.00);


INSERT INTO Estudante VALUES
("Fabricio", "F", "Lemos", 1000, "807.281.881-39", "1998/05/20", "79826-100, Rua Izzat Bussuan, 504", "M", "fafogdsilva@bol.com.br", "(67)99858-1430"),
("Samir", "B", "Murad", 1001, "056.461.422-02", "1996/12/21", "68630-750, Rua Cipreste, 171", "M", "samurad@gmail.com", "(67)99888-1466"),
("Felipe", "E", "Ferreira", 1002, "689.343.615-73", "1998/01/13", "44038-460, Rua Pampeiro, 329", "M", "feferreira@hotmail.com", "(67)97225-0107"),
("Kamilly", "F", "Barsosa", 1003, "075.364.511-48", "2001/07/14", "72265-070, Rua Quadra 7, 833", "F", "kabarbosa@gmail.com", "(67)96939-2473"),
("Nelma", "R", "Branco", 1004, "407.315.142-89", "1996/08/18", "68908-789, Avenida do Jabuticaba, 957", "F", "nelbranco@outlook.com", "(67)98313-1863"),
("Vanderlina", "P", "Norte", 1005, "111.588.453-08", "2002/11/08", "65632-143, Rua Boa Esperança, 91", "F", "vandenorte@yahoo.com.br", "(67)99464-3805"),
("Elino", "C", "Camelo", 1006, "336.266.421-00", "2000/06/24", "78559-842, Rua Projetada 10, 110", "M", "elinocamelo@gmail.com", "(67)97116-4534"),
("Raffaela", "B", "Luques", 1007, "829.047.422-98", "1993/08/17", "76829-639, Rua Alexandre Guimarães, 712", "F", "raffaluques@gmail.com", "(67)99947-6632"),
("Joyce", "C", "Vasgestian", 1008, "455.745.237-01", "2001/02/28", "29200-025, Rua Norberto Vassoler, 613", "F", "joycevasges@gmail.com", "(67)99322-2006"),
("Alba ", "B", "Trancoso", 1009, "585.228.422-05", "1990/05/23", "69919-760, Rua W7, 203", "F", "albatrancoso@hotmail.com", "(67)99568-6564"),
("Honoria","T", "Medel", 1010, "351.443.067-56", "1989/03/10", "29163-559, Rua dos Ursos, 380", "F", "honomedel@hotmail.com", "(67)99333-1111"),
("Luciano", "C", "Antonio", 1011, "188.716.861-36", "2003/07/12", "79037-140, Rua Entre Rios, 720", "M", "lucantonio@hotmail.com", "(67)98410-1573"),
("Kavan", "A", "Ramos", 1012, "537.577.164-00", "2002/02/21", "53270-657, Rua da Sapucaia, 914", "M", "kavramos@hotmail.com", "(67)98711-2548"),
("Elizabetti", "T", "Barrada", 1013, "066.315.012-45", "2004/08/20", "76965-620, Rua dos Suruís, 171", "F", "elibarrada@bol.com.br", "(67)99778-3675"),
("Rubia", "D", "Valladares", 1014, "767.370.491-92", "1995/06/01", "75903-422, Rua Abel Pereira de Castro, 143", "F", "rubvaladares@bol.com.br", "(67)99854-5178"),
("Elenice ", "L", "Regris", 1015, "210.828.784-13", "1980/10/25", "52090-513, Rua da Saúde, 489", "F", "elenregris@bol.com.br", "(67)98896-8794"),
("Fábio", "V", "Barcelos", 1016, "649.734.620-12", "1996/07/27", "97314-366, Rua Octaviano Norberto, 173", "M", "fabbarcelos@bol.com.br", "(67)97662-8638"),
("Isabella", "S", "Aguiar", 1017, "610.361.284-58", "1985/10/12", "59133-220, Rua Açude do Imbuzeiro, 334", "F", "bellaguiar@yahoo.com.br", "(67)99884-3375"),
("Mara", "E", "Figueredo", 1018, "152.524.001-30", "2004/01/31", "72504-220, Quadra CL 204, 838", "F", "marafig@yahoo.com.br", "(67)98447-3288");


INSERT INTO Turma VALUES
(800, "T1 - Administração", "2022/01/24", "2025/11/27", 101, 500),
(801, "T1 - Açúcar e Álcool", "2022/01/24", "2025/11/28", 022, 501),
(802, "T1 - Segurança no Trabalho", "2022/01/24", "2022/11/25", 101, 502),
(803, "T1 - Química", "2022/01/24", "2025/06/26", 022, 503),
(804, "T1 - Eletrotécnica", "2022/01/24", "2025/11/28", 207, 504),
(805, "T1 - Edificações ", "2022/01/24", "2022/11/25", 350, 505),
(806, "T1 - Automação Industrial ", "2021/01/25", "2024/11/26", 350, 506),
(807, "T2 - Automação Industrial", "2022/01/24", "2025/11/28", 319, 506);

SET foreign_key_checks = 0;
INSERT INTO Aula VALUES
/*Horário de aula T1 Administração*/
(800, "Segunda a Quinta", "13:10 - 16:40"), 

/*Horário de aula T1 Açúcar e Álcool*/
(801, "Terça a Sexta", "13:10 - 16:40"),

/*Horário de aula T1 Segurança no Trabalho*/
(802, "Segunda a Quinta", "18:40 - 21:40"),

/*Horário de aula T1 Química*/
(803, "Quarta a Sábado", "7:10 - 10:50"),

/*Horário de aula T1 Eletrotécnica*/
(804, "Terça a Sexta", "13:10 - 16:40"),

/*Horário de aula T1 Edificações*/
(805, "Segunda a Quinta", "18:40 - 21:40"),

/*Horário de aula T1 Automação Industrial*/
(806, "Segunda a Quinta", "18:40 - 21:40"),

/*Horário de aula T2 Automação Industrial*/
(807, "Quarta a Sábado", "7:10 - 10:50");


INSERT INTO turmaEstudante VALUES
(800, 1001),
(800, 1013),
(800, 1006),
(801, 1000),
(801, 1012),
(801, 1017),
(802, 1000),
(802, 1011),
(802, 1002),
(803, 1002),
(803, 1014),
(803, 1016),
(804, 1003),
(804, 1008),
(805, 1004),
(805, 1007),
(805, 1015),
(805, 1018),
(806, 1005),
(806, 1010),
(807, 1006),
(807, 1009);

INSERT INTO Pagamento VALUES
/*
mensalidades
Administração: 350.00 - vespertino - 800
Açúcar e Álcool: 400.00 - vespertino - 801
Segurança no Trabalho: 200.00 - noturno - 802
Química: 450.00 - matutino - 803
Eletrotécnica: 500.00 - vespertino - 804
Edificações: 225.00 - noturno -805
Automação: 450.00 -t1 noturno(806) t2 matutino(807)
*/
(2000, "2022/03/22", 350.00, "Pago", 1001),
(2001, "2022/04/11", 400.00, "Pendente", 1000),
(2002, "2022/03/19", 200.00, "Pendente", 1000),
(2003, "2022/04/13", 450.00, "Pendente", 1002),
(2004, "2022/02/14", 500.00, "Pago", 1003),
(2005, "2022/02/15", 225.00, "Pendente", 1004),
(2006, "2022/03/05", 450.00, "Pago", 1005),
(2007, "2022/04/27", 450.00, "Pendente", 1006),
(2008, "2022/05/30", 225.00, "Pago", 1007),
(2009, "2022/03/02", 500.00, "Pendente", 1008),
(2010, "2022/04/09", 450.00, "Pago", 1009),
(2011, "2022/03/02", 450.00, "Pendente", 1010),
(2012, "2022/04/09", 200.00, "Pendente", 1011),
(2013, "2022/03/02", 400.00, "Pago", 1012),
(2014, "2022/04/09", 350.00, "Pendente", 1013),
(2015, "2022/03/02", 450.00, "Pago", 1014),
(2016, "2022/04/07", 225.00, "Pendente", 1015),
(2017, "2022/03/01", 450.00, "Pago", 1016),
(2018, "2022/04/06", 400.00, "Pendente", 1017),
(2019, "2022/05/02", 225.00, "Pendente", 1018),
(2020, "2022/04/09", 350.00, "Pago", 1006),
(2021, "2022/04/09", 200.00, "Pago", 1002);

