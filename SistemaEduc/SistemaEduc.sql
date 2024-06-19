CREATE TABLE Departamentos (--feito
    Id_Departamento SERIAL PRIMARY KEY,
    Nome_Departamento VARCHAR(100) NOT NULL,
    Sigla_Departamento VARCHAR(4)
	
);

CREATE TABLE Cursos (--feito
    Id_Curso SERIAL PRIMARY KEY,
    Nome_Curso VARCHAR(100) NOT NULL,
    Id_Departamento SERIAL REFERENCES Departamentos
);

CREATE TABLE Alunos (--feito
    CPF_Aluno VARCHAR(15) PRIMARY KEY,
    Nome_Aluno VARCHAR(100) NOT NULL,
    Idade INT,
    Rua VARCHAR(500),
    Numero VARCHAR(10),
    Bairro VARCHAR(500),
    Cidade VARCHAR(20),
    Estado VARCHAR(20),
    CEP INT,
    Pais VARCHAR(20)
);

CREATE TABLE Telefones (--feito
    CPF_Aluno VARCHAR(15) REFERENCES Alunos,
    Cod_Pais INT,
    DDD INT,
    Numero INT
);

CREATE TABLE EMails (--feito
    CPF_Aluno VARCHAR(15) REFERENCES Alunos,
    EMail VARCHAR(50),
    Dominio VARCHAR(20)
);

CREATE TABLE Matriculas (--feito
	RA SERIAL PRIMARY KEY,
    CPF_Aluno VARCHAR(15) REFERENCES Alunos,
    Id_Curso SERIAL REFERENCES Cursos,
    Status VARCHAR(10)
);

CREATE TABLE Disciplinas (--feito
	Id_Disciplina SERIAL PRIMARY KEY,
	Nome_Disciplina VARCHAR(100),
    Optativa BOOLEAN
);

CREATE TABLE Curso_Disciplina (
	Id_Curso SERIAL REFERENCES Cursos,
	Id_Disciplina SERIAL REFERENCES Disciplinas
);

CREATE TABLE Matriculas_Cursos (
    RA SERIAL REFERENCES Matriculas,
    Id_Disciplina SERIAL REFERENCES Disciplinas
);

INSERT INTO Alunos (CPF_Aluno, Nome_Aluno, Idade, Rua, Numero, Bairro, Cidade, Estado, CEP, Pais) VALUES 
('111.222.333-44', 'João Silva', 25, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', 123456, 'Brasil'),
('222.333.444-55', 'Maria Oliveira', 22, 'Avenida Principal', '456', 'Bela Vista', 'Rio de Janeiro', 'RJ', 654321, 'Brasil'),
('333.444.555-66', 'Carlos Santos', 30, 'Rua das Palmeiras', '789', 'Jardim Botânico', 'Curitiba', 'PR', 987654, 'Brasil'),
('444.555.666-77', 'Ana Pereira', 28, 'Rua dos Girassóis', '1011', 'Floresta', 'Belo Horizonte', 'MG', 111222, 'Brasil'),
('555.666.777-88', 'Pedro Rodrigues', 21, 'Avenida Central', '1213', 'Centro', 'Fortaleza', 'CE', 333444, 'Brasil'),
('666.777.888-99', 'Mariana Costa', 26, 'Rua das Acácias', '1415', 'Praia Grande', 'Salvador', 'BA', 555666, 'Brasil'),
('777.888.999-00', 'Lucas Oliveira', 24, 'Avenida dos Coqueiros', '1617', 'Boa Viagem', 'Recife', 'PE', 777888, 'Brasil'),
('888.999.000-11', 'Juliana Pereira', 29, 'Rua das Rosas', '1819', 'Jardim São Paulo', 'Porto Alegre', 'RS', 999000, 'Brasil'),
('999.000.111-22', 'Fernando Souza', 27, 'Avenida das Orquídeas', '2021', 'Cidade Jardim', 'Brasília', 'DF', 111999, 'Brasil'),
('000.111.222-33', 'Camila Santos', 23, 'Rua das Violetas', '2223', 'Vila Nova', 'Manaus', 'AM', 222111, 'Brasil');

SELECT * FROM Alunos

INSERT INTO Departamentos (Sigla_Departamento, Nome_Departamento) VALUES
('SAUD','SAUDE'),
('TEC','TECNOLOGIA'),
('ENGE','ENGENHARIA'),
('HUMA','HUMANAS')

SELECT * FROM Departamentos

INSERT INTO Cursos (Nome_Curso, Id_Departamento) VALUES 
('Medicina', 1),
('Enfermagem', 1),
('Engenharia de Software', 2),
('Ciência da Computação', 2),
('Engenharia Civil', 3),
('Engenharia Elétrica', 3),
('História', 4),
('Psicologia', 4),
('Administração', 4),
('Economia', 4);

SELECT * FROM Cursos

INSERT INTO Matriculas (CPF_Aluno, Id_Curso, Status) VALUES 
('111.222.333-44', 1, 'Ativo'),
('222.333.444-55', 1, 'Ativo'),
('333.444.555-66', 2, 'Formado'),
('444.555.666-77', 2, 'Ativo'),
('555.666.777-88', 3, 'Inativo'),
('666.777.888-99', 3, 'Ativo'),
('777.888.999-00', 4, 'Ativo'),
('888.999.000-11', 4, 'Formado'),
('999.000.111-22', 1, 'Formado'),
('000.111.222-33', 1, 'Inativo');

SELECT * FROM Matriculas

INSERT INTO Disciplinas (Nome_Disciplina, Optativa) VALUES 
('Anatomia Humana', FALSE),  -- Saúde
('Fisiologia Humana', FALSE),  -- Saúde
('Bioquímica', FALSE),  -- Saúde
('Farmacologia', FALSE),  -- Saúde
('Epidemiologia', FALSE),  -- Saúde
('Algoritmos e Estruturas de Dados', FALSE),  -- Tecnologia
('Banco de Dados', FALSE),  -- Tecnologia
('Redes de Computadores', FALSE),  -- Tecnologia
('Engenharia Econômica', FALSE),  -- Engenharia
('Eletromagnetismo', FALSE),  -- Engenharia
('Álgebra Linear', FALSE),  -- Engenharia
('Direito Constitucional', FALSE),  -- Humanas
('Psicologia Social', FALSE),  -- Humanas
('Antropologia Cultural', TRUE),  -- Humanas
('Filosofia Política', TRUE),  -- Humanas
('Engenharia de Software', TRUE),  -- Tecnologia
('Introdução à Inteligência Artificial', TRUE),  -- Tecnologia
('Gestão de Projetos', TRUE),  -- Engenharia
('Introdução à Robótica', TRUE),  -- Engenharia
('Nutrição Esportiva', TRUE),  -- Saúde
('Terapias Alternativas', TRUE);  -- Saúde

SELECT * FROM Disciplinas

INSERT INTO Telefones (CPF_Aluno, Cod_Pais, DDD, Numero) VALUES 
('111.222.333-44', 55, 11, 123456789),  -- João Silva
('111.222.333-44', 55, 11, 987654321),  -- João Silva (segundo número)
('222.333.444-55', 55, 21, 987654321),  -- Maria Oliveira
('333.444.555-66', 55, 41, 111222333),  -- Carlos Santos
('444.555.666-77', 55, 31, 444555666),  -- Ana Pereira
('555.666.777-88', 55, 85, 777888999),  -- Pedro Rodrigues
('666.777.888-99', 55, 71, 888999000),  -- Mariana Costa
('777.888.999-00', 55, 81, 999000111),  -- Lucas Oliveira
('888.999.000-11', 55, 51, 222333444),  -- Juliana Pereira
('999.000.111-22', 55, 61, 333444555),  -- Fernando Souza
('000.111.222-33', 55, 92, 555666777);

SELECT * FROM Telefones

INSERT INTO EMails (CPF_Aluno, EMail, Dominio) VALUES 
('111.222.333-44', 'joao.silva@gmail.com', 'gmail.com'),
('111.222.333-44', 'jsilva@hotmail.com', 'hotmail.com'),  -- João Silva
('222.333.444-55', 'maria.oliveira@gmail.com', 'gmail.com'),
('333.444.555-66', 'carlos.santos@gmail.com', 'gmail.com'),
('444.555.666-77', 'ana.pereira@hotmail.com', 'hotmail.com'),
('444.555.666-77', 'ana.pereira2@gmail.com', 'gmail.com'),  -- Ana Pereira
('555.666.777-88', 'pedro.rodrigues@gmail.com', 'gmail.com'),
('666.777.888-99', 'mariana.costa@hotmail.com', 'hotmail.com'),
('777.888.999-00', 'lucas.oliveira@gmail.com', 'gmail.com'),
('777.888.999-00', 'lucas.oliveira2@hotmail.com', 'hotmail.com'),  -- Lucas Oliveira
('888.999.000-11', 'juliana.pereira@gmail.com', 'gmail.com'),
('999.000.111-22', 'fernando.souza@gmail.com', 'gmail.com'),
('000.111.222-33', 'camila.santos@hotmail.com', 'hotmail.com');

SELECT * FROM EMails

--Medicina
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 1);  -- Anatomia Humana
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 2);  -- Fisiologia Humana
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 3);  -- Bioquímica
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 4);  -- Farmacologia
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 5);  -- Epidemiologia
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 20); -- Nutrição Esportiva
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (1, 21); -- Terapias Alternativas

-- Enfermagem
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (2, 1);  -- Anatomia Humana
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (2, 2);  -- Fisiologia Humana
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (2, 3);  -- Bioquímica
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (2, 5);  -- Epidemiologia
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (2, 20); -- Nutrição Esportiva
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (2, 21); -- Terapias Alternativas

-- Engenharia de Software
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (3, 6);  -- Algoritmos e Estruturas de Dados
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (3, 7);  -- Banco de Dados
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (3, 8);  -- Redes de Computadores
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (3, 16); -- Engenharia de Software
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (3, 17); -- Introdução à Inteligência Artificial

-- Ciência da Computação
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (4, 6);  -- Algoritmos e Estruturas de Dados
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (4, 7);  -- Banco de Dados
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (4, 8);  -- Redes de Computadores
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (4, 16); -- Engenharia de Software
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (4, 17); -- Introdução à Inteligência Artificial

-- Engenharia Civil
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (5, 9);  -- Engenharia Econômica
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (5, 10); -- Eletromagnetismo
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (5, 11); -- Álgebra Linear
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (5, 18); -- Gestão de Projetos
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (5, 19); -- Introdução à Robótica

-- Engenharia Elétrica
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (6, 9);  -- Engenharia Econômica
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (6, 10); -- Eletromagnetismo
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (6, 11); -- Álgebra Linear
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (6, 18); -- Gestão de Projetos
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (6, 19); -- Introdução à Robótica

-- História
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (7, 12); -- Direito Constitucional
INSERT INTO Curso_Disciplina (Id_Curso, Id_Disciplina) VALUES (7, 13); -- Psicologia Social

SELECT * FROM Curso_Disciplina

INSERT INTO Matriculas_Cursos (RA, Id_Disciplina) VALUES 
(1, 1),  -- Anatomia Humana
(1, 2),  -- Fisiologia Humana
(1, 3),  -- Bioquímica
(1, 4),  -- Farmacologia
(1, 5),  -- Epidemiologia
(2, 1),  -- Anatomia Humana
(2, 2),  -- Fisiologia Humana
(2, 3),  -- Bioquímica
(2, 4),  -- Farmacologia
(2, 5),  -- Epidemiologia
(4, 6),  -- Algoritmos e Estruturas de Dados
(4, 7),  -- Banco de Dados
(4, 8),  -- Redes de Computadores
(4, 15), -- Engenharia de Software
(4, 16), -- Introdução à Inteligência Artificial
(6, 9),  -- Engenharia Econômica
(6, 10), -- Eletromagnetismo
(6, 11), -- Álgebra Linear
(6, 17), -- Gestão de Projetos
(6, 18), -- Introdução à Robótica
(7, 12), -- Direito Constitucional
(7, 13); -- Psicologia Social

SELECT * FROM Matriculas_Cursos

--Buscar todos os dados do aluno dado o CPF ou o Nome do Aluno:
SELECT * FROM Alunos WHERE CPF_Aluno = '111.222.333-44' OR Nome_Aluno = 'João Silva';

--Exibir o nome de todos os cursos associados a um departamento dado o nome do departamento:
SELECT Cursos.Nome_Curso FROM Cursos INNER JOIN Departamentos ON Cursos.Id_Departamento = Departamentos.Id_Departamento
WHERE Departamentos.Nome_Departamento = 'HUMANAS';

--Exibir o nome do curso ao qual uma disciplina pertence dado o nome da disciplina:
SELECT Cursos.Nome_Curso FROM Cursos INNER JOIN Curso_Disciplina ON Cursos.Id_Curso = Curso_Disciplina.Id_Curso 
INNER JOIN Disciplinas ON Curso_Disciplina.Id_Disciplina = Disciplinas.Id_Disciplina 
WHERE Disciplinas.Nome_Disciplina = 'Introdução à Inteligência Artificial';