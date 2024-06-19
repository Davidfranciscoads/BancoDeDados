--DDL

-- Criando a Tabela alunos

CREATE TABLE alunos(

	cpf varchar(17) primary key,
	nome varchar(50) not null,
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(20)
)

ALTER TABLE alunos ALTER COLUMN cpf TYPE varchar(17) -- ALTERA A COLUNA CPF DA TABELA ALUNO MUDANDO O TIPO DA COLUNA PARA VARCHAR



CREATE TABLE telefones(  --NAO FOI CRIADO AINDA 
	cpf varchar(17) REFERENCES alunos,
	ddd int,
	numero int
)
ALTER TABLE telefones ADD COLUMN cod_pais varchar(5) -- ADICIONA A COLUNA COD_PAIS NA TABELA COM TIPO VARCHAR E TAMANHO MAX DE 5 


CREATE TABLE emails(
	cpf varchar (17)REFERENCES alunos, 
	email varchar(30),
	dominio varchar(30)
)
ALTER TABLE emails ALTER COLUMN email TYPE varchar(64)



CREATE TABLE cursos(
	id_cursos serial primary key,
	id_departamento serial REFERENCES departamentos,
	nome_curso varchar(50)
	
)

CREATE TABLE matriculas(
	ra serial primary key,
	cpf varchar(17) REFERENCES alunos,
	status varchar(10),
	id_cursos int REFERENCES cursos
)

CREATE TABLE departamentos(
	id_departamento serial primary key,
	sigla_departamento varchar(4),
	nome_departamento varchar(10)
)

CREATE TABLE curso_disciplina(
	id_disciplina serial references disciplinas,
	id_curso serial references cursos
)

CREATE TABLE disciplinas(
	id_disciplina serial primary key,
	nome_disciplina varchar(20),
	optativa varchar(20)
)
ALTER TABLE disciplinas RENAME COLUMN id_disciplina TO id_disciplina -- Esse comando altera o nome da coluna para tal nome
-- porém a minha tabela ja está com o nome certo entao nao vou usar 



CREATE TABLE matricula_disciplina(
	ra serial REFERENCES matriculas,
	id_disciplina serial REFERENCES disciplinas
)

-- DML

INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, estado, cep, pais) VALUES
(12345678901, 'João Silva', 20, 'Rua A', '123', 'Centro', 'São Paulo', 'SP', 12345678, 'Brasil'),
(23456789012, 'Maria Santos', 22, 'Rua B', '456', 'Vila Nova', 'Rio de Janeiro', 'RJ', 23456789, 'Brasil'),
(34567890123, 'Carlos Oliveira', 25, 'Rua C', '789', 'Jardim', 'Belo Horizonte', 'MG', 34567890, 'Brasil'),
(45678901234, 'Ana Pereira', 19, 'Rua D', '1011', 'Centro', 'Curitiba', 'PR', 45678901, 'Brasil'),
(56789012345, 'Pedro Souza', 21, 'Rua E', '1213', 'Centro', 'Porto Alegre', 'RS', 56789012, 'Brasil'),
(67890123456, 'Mariana Costa', 24, 'Rua F', '1415', 'Jardim', 'Salvador', 'BA', 67890123, 'Brasil'),
(78901234567, 'Fernando Santos', 26, 'Rua G', '1617', 'Vila Nova', 'Fortaleza', 'CE', 78901234, 'Brasil'),
(89012345678, 'Amanda Oliveira', 20, 'Rua H', '1819', 'Centro', 'Recife', 'PE', 89012345, 'Brasil'),
(90123456789, 'Gustavo Lima', 23, 'Rua I', '2021', 'Jardim', 'Manaus', 'AM', 90123456, 'Brasil')

SELECT * FROM alunos

INSERT INTO departamentos (sigla_dpto,nome_dpto) VALUES
('SAUD','SAUDE'),
('TECN','TECNOLOGIA'),
('ENG','ENGENHARIA'),
('HUMA','HUMANAS')

SELECT * FROM departamentos 

ALTER TABLE cursos ALTER COLUMN nome_curso TYPE varchar(50)

INSERT INTO cursos (nome_curso, departamentos) VALUES
('Medicina', 1),
('Enfermagem', 1),
('Nutrição', 1),
('Ciência da Computação', 2),
('Engenharia de Software', 2),
('Inteligência Artificial', 2),
('Engenharia Civil', 3),
('Engenharia Elétrica', 3),
('Engenharia Mecânica', 3),
('Psicologia', 4),
('História', 4),
('Sociologia', 4)

INSERT INTO matriculas (cpf,status,id_curso) VALUES
(12345678901, 'ativo', 1),
(23456789012, 'inativo', 1),
(34567890123, 'formado',3),
(45678901234, 'ativo',5),
(56789012345, 'inativo',5),
(67890123456, 'formado',7),
(78901234567, 'ativo',12),
(89012345678, 'formado',7),
(90123456789, 'inativo',10),
(67890123456, 'formado',10),
(78901234567, 'ativo',11),
(89012345678, 'formado',2),
(90123456789, 'inativo',4)








