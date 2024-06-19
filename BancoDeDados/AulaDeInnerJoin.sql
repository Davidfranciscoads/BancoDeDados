DROP TABLE product;

DROP TABLE client CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

--*************************************************--
-- 		 COMANDOS DQL (Data Query Language)        --
--*************************************************--

-- Visualizando a tablea de clientes
SELECT * FROM clients
SELECT * FROM products

-- Selecionando colunas específicas
SELECT firstname, lastname FROM clients
SELECT productname, discount, price FROM products

-- DESAFIO: exibir nome do produto, preço e preço com desconto
SELECT productname, price, price * (1 - discount) AS "Desconto em reais" FROM products

-- Selecionar sem dados duplicados
SELECT DISTINCT brand FROM products

-- Select pode ser usado como calculadora
SELECT 3 * 5

-- Exibir produtos com valor igual ou acima de 100 reais
SELECT productname, price FROM products WHERE price >= 100

-- Exibir produtos entre 100 e 800 reais
SELECT productname, price FROM products WHERE price >= 100 AND price <= 800

SELECT productname, price FROM products WHERE price BETWEEN 100 AND 800

-- Exibir produtos cujo estejam abaixo de 100 e acima de 800
SELECT productname, price FROM products WHERE price <= 100 OR price >= 800

-- DESAFIO: listar todos os produtos da marca dell
SELECT productname FROM products WHERE brand = 'dell'

-- DESAFIO: listar todos os produtos comprados por João
SELECT idclient FROM clients WHERE firstname = 'Joao'

SELECT productname FROM products WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'Joao')

-- DESAFIO: listar todos os clients com id par
SELECT idclient, firstname, lastname FROM clients WHERE idclient % 2 = 0

-- COUNT - conta a quantidade de itens
-- Quantos produtos foram vendidos no total?
SELECT COUNT(idproduct) FROM products

-- Função avg - média
-- Qual o preço médio dos produtos vendidos?
SELECT AVG(price) FROM products

-- Função max - máximo
-- Qual o preço mais alto negociado?
SELECT MAX(price) FROM products

-- Função min - mínimo
-- Qual o menor preço negociado?
SELECT MIN(price) FROM products

-- Função sum - soma
-- Qual o valor total vendido?
SELECT SUM(price) FROM products

-- ORDER BY - ordenar por 'propriedade' (ex:ordem alfabética - firstname)
-- ORDER BY DESC - ordenar decrescente
SELECT * FROM clients ORDER BY firstname
SELECT * FROM clients ORDER BY firstname DESC

-------------------------------------------------------------------------
-- Exercícios:

-- 1. Quantos produtos da marca dell foram vendidos?
SELECT COUNT(brand) FROM products WHERE brand = 'dell'

-- 2. Quantos produtos João comprou?
SELECT COUNT(products) FROM products WHERE idclient = '2'

-- 3. Qual o preço médio dos produtos da dell?
SELECT AVG(price) FROM products WHERE brand = 'dell'

-- 4. Qual o produto mais caro vendido?
SELECT productname FROM products WHERE price = (SELECT MAX(price) FROM products) 

-- 5. Qual o produto mais barato vendido?
SELECT productname FROM products WHERE price = (SELECT MIN(price) FROM products)

-- 6. Qual o valor total de equipamentos dell vendidos?
SELECT SUM(price) FROM products WHERE brand = 'dell'

-- 7. Quanto Rodrigo já gastou no eCommerce?
SELECT SUM(price) FROM products WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'Rodrigo')

-- 8. Exiba todos os produtos da categoria eletronicos ordenados do mais barato para o mais caro.
SELECT productname FROM products WHERE category = 'eletronicos' ORDER BY price

-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.
SELECT productname, price FROM products WHERE idclient = (SELECT idclient FROM clients
WHERE firstname = 'Rodrigo') ORDER BY price DESC



--****************************--
--         Preparação         --
--****************************--

-- Adicionar produtos que não foram comprados
INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0)


SELECT * FROM products

-- CROSS JOIN (Pega a primeira tabela informada e Repete a primeira linha )

SELECT * FROM clients,products
SELECT * FROM products, clients
-- Pode escrever também como: SELECT * FROM clients CROSS JOIN products
SELECT * FROM clients CROSS JOIN products


--INNER JOIN (JUNTA DUAS TABELAS RELACIONANDO POR PK / FK )

SELECT * FROM clients INNER JOIN products
ON clients.idclient = products.idclient 
WHERE firstname= 'Rodrigo' or firstname='rodrigo'

--ALTERNATIVA PARA FAZER O MESMO DO COMANDO DE CIMA
SELECT * FROM clients INNER JOIN products USING (idclient)

SELECT * FROM clients NATURAL INNER JOIN products

SELECT * FROM products

SELECT clients.firstname
FROM products FULL JOIN clients (idclient)
WHERE coluna = 'eletronicos'

SELECT * FROM products
FROM products FULL JOIN clients USING(idproduct)

SELECT * FROM clients INNER JOIN products
ON clients.idclient = products 
WHERE coluna = 'category'

--- Exercicios:
-- 1. Quais clientes compraram produtos da categoria eletrônicos?
SELECT clients.firstname,lastname, products.productname
FROM clients INNER JOIN products USING (idclient)
WHERE category ='eletronicos'

-- 2. Quais clientes não compraram nenhum produto?
SELECT clients.firstname,clients.lastname
FROM clients LEFT JOIN products USING (idclient)
WHERE products.idproduct IS NULL

-- 3. Quais produtos não foram vendidos?
SELECT productname,idclient FROM products
WHERE idclient IS NULL


-- (duas maneiras de executar)
SELECT products.productname
FROM clients RIGHT JOIN products USING (idclient)
WHERE clients.firstname IS NULL

-- 4. Quais produtos Rodrigo comprou?

SELECT clients,firstname,products.productname
FROM clients INNER JOIN products USING (idclient)
WHERE clients.firstname = 'rodrigo'

-- 5. Quais clientes compraram produtos da marca DELL?
SELECT clients.firstname,products.productname, products.brand
FROM clients INNER JOIN products USING (idclient)
WHERE products.brand = 'dell'






