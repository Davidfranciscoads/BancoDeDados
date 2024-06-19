DROP TABLE products;
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

------------------------------------
------------------ comandos DQL (data query language)
-----------------------------------
-- visualizando a tabela de clients usando o * ele busca toda a tabela clients
select * from clients

-- selecionando colunas especificas 
select firstname, lastname, idclient from clients 

-- visualizando a tabela de produtos
select * from products 

---nome do produto, preco e desconto
select productname, price, discount,price*discount as "desconto em reais" from products 

--- desafio: exibir o nome do produto, preço e preço com desconto 
select productname,price-price, discount,price*discount as "desconto em reais" from products 

-- exibe valores sem repetição
select distinct brand from products 

-- calculadora
select 3*4

-- funçoes
select random()

--select com clausula where

--operadores de comparacao >, < , <=, = <>, ou !=
--exibir productos com valor acima de 100 reais 
select productname, price from products
where price >=100

--operadores logicos: and,or e not 

--produtos entre 100 e 800 reais
select productname,price from products
where price>= 100 and price<=800

--produtos cujo o preço seja abaixo de 100 e acima de 800
select productname,price from products
where price<= 100 or price>=800

select productname,price from products
where price>= 100 and price<=800

--- desafio: listar todos os produtos da marca dell
select productname,price brand from products 
where brand = 'dell'

--desafio: listar todos os produtos comprados por joao 
select idclient from clients
where firstname = 'joao'

select productname from products
where idclient = (select idclient from clients
				 where firstname = 'joao')

-- desafio listar todos os clientes com id 'par'
select idclient,firstname from clients
where idclient % 2 = 0

--count 
-- quantos produtos foram vendidos no total?
select count(idproduct) from products  

-- função avg(media)
-- qual o preço medio dos produtos vendidos?
select avg (price) from products 

-- função max(maximo) e min(minimo)
-- qual o preço mais alto negociado?
select max (price)from products 
select min (price)from products 

-- função sum(soma)
-- qual o valor total vendido?
select sum (price)from products 

-- order by /desc
select * from clients
order by lastname 

-- Exercícios:

-- 1. Quantos produtos da marca dell foram vendidos?
-- 2. Quantos produtos João comprou?
-- 3. Qual o preço médio dos produtos da dell?
-- 4. Qual o produto mais caro vendido?
-- 5. Qual o produto mais barato vendido?
-- 6. Qual o valor total de equipamentos dell vendidos?
-- 7. Quanto Rodrigo já gastou no eCommerce?
-- 8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.


--exercicio 1
select count(idproduct) from products
where brand = 'dell'

--exercicio 2 
select count(idproduct) from products
where idclient = (select idclient from clients where firstname = 'joao')

				 
---exercicio 3
select avg (price) from products
where brand = 'dell'

--exercicio 4
select productname,price from products
where price = (select max(price)from products )

select price from products 
				 
--exercicio 5
select productname,price from products
where price = (select min(price)from products )

--exercicio 6

select sum (price) from products 
where brand = 'dell'

--exercicio 7 
select sum (price) from products
where idclient = (select idclient from clients where firstname = 'Rodrigo')

--exercicio 8 
select productname,price from products 
where category = 'eletronicos'
order by price
				 
--exercicio 9 
SELECT productname,price FROM products
WHERE idclient = (SELECT idclient FROM clients WHERE firstname='Rodrigo')
ORDER BY price DESC




