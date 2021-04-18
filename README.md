
# SQL

Criei esse material com base na playlist do Canal do Youtube [DEV Aprender](https://www.youtube.com/watch?v=FNV7_9QsCok&list=PLnNURxKyyLIInBfeGiJ8L314AD015mHkv&index=1), todos os exemplos seguem os videos das aulas da playlist com a resolução de todos exercícios.

*O canal do Youtube DEV Aprender não é de minha autoria

## Instalando SQL Server Management Studio (SSMS)

[![Instalando](https://img.youtube.com/vi/FNV7_9QsCok/0.jpg)](https://www.youtube.com/watch?v=FNV7_9QsCok)

## Restaurando Banco de Dados

Baixe o banco de dados com o link abaixo e importe para o SSMS
[Download Banco de Dados](https://github-releases.githubusercontent.com/53698446/0d72fc96-bb25-11e7-97d8-9905e109d7f6?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210418%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210418T213236Z&X-Amz-Expires=300&X-Amz-Signature=95535c655f397620b15a62eff5c11e2fa144a6fb725e9e8a87ab4e7ecd810252&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=53698446&response-content-disposition=attachment%3B%20filename%3DAdventureWorks2017.bak&response-content-type=application%2Foctet-stream)

[![Restaurando](https://img.youtube.com/vi/CFyfWd7pIhU/0.jpg)](https://www.youtube.com/watch?v=CFyfWd7pIhU)

## Comandos SQL

* [SELECT](#SELECT)
* [DISTINCT](#DISTINCT)
* [WHERE](#WHERE)
* [COUNT](#COUNT)
* [TOP](#TOP)
* [ORDER BY](#ORDER-BY)
* [BETWEEN](#BETWEEN)
* [IN](#IN)
* [LIKE](#LIKE)
* [DESAFIO FUNDAMENTOS SQL](#Desafio-Fundamentos-SQL)
* [AGREGAÇÃO MIN, MAX, SUM e AVG](#Agregação-MIN,-MAX,-SUM-e-AVG)
* [GROUP BY](#GROUP-BY)
* [HEAVING](#Heaving)

## SELECT

```SQL
--SELECT coluna1,coluna2 FROM Tabela

SELECT * FROM person.Person; --EXEMPLO1
SELECT Title FROM person.Person; --EXEMPLO2
SELECT FirstName,LastName FROM person.Person --EXEMPLO3
```

## DISTINCT

```SQL
--SELECT DISTINCT coluna1, coluna2 FROM tabela
SELECT DISTINCT  LastName FROM Person.Person
```

## WHERE

| OPERADORES |                  DESCRICAO                 |
|:----------:|:------------------------------------------:|
| =          | IGUAL                                      |
| >          | MAIOR QUE                                  |
| <          | MENOR QUE                                  |
| >=         | MAIOR QUE OU IGUAL                         |
| <=         | MENOR QUE OU IGUAL                         |
| <>         | DIFERENTE DE                               |
| AND        | OPERADOR LÓGICO E                          |
| OR         | OPERADOR LÓGICO OU                         |
| LIKE       | CONTEM TEXTO ONDE "%" É O CARACTER CORINGA |

```SQL

/*SELECT coluna1,coluna2,coluna_n
FROM tabela
WHERE condicao
*/
SELECT *
FROM Person.Person
WHERE LastName = 'miller' and FirstName = 'anna';

SELECT *
FROM Production.Product
WHERE Name  like '%BLACK%'

SELECT *
FROM Production.Product
WHERE ListPrice > 2000 and ListPrice < 3000

--Desafio 1 = Trazer lista dos nomes das peças com peso maior que 500 e menor que 700
SELECT Name
FROM Production.Product
WHERE Weight > 500 and Weight < 700

--Desafio 2 = Todas pessoas que são casadas e são assalaridas 
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1

--Desafio 3 = Encontrar o email Peter Krebs

-- Encontrar Peter Krebs  (Tabela = Person.Person)
SELECT BusinessEntityID
FROM  Person.Person
WHERE FirstName = 'Peter'and LastName = 'Krebs'

-- Encontrar Email(Tabela = Person.EmailAddress) com 'BusinessEntityID' de Peter Krebs  
SELECT * 
FROM Person.EmailAddress
WHERE BusinessEntityID = '26'

-- Encontrar Email(Tabela = Person.EmailAddress) de Peter Krebs  (Tabela = Person.Person)
SELECT EmailAddress
FROM  Person.Person,Person.EmailAddress
WHERE FirstName = 'Peter'and LastName = 'Krebs' and Person.Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID
```

## COUNT

```SQL
--quantidade de titulos diferentes
SELECT count(DISTINCT title)
FROM Person.Person

/*DESAFIO 1
Quantos produtos temos cadastrados em nossa tabela de produtos
*/
SELECT count(*)
FROM Production.Product

/*DESAFIO 2
Quantos tamanhos de produtos temos cadastrados em nossa tabela de produtos
*/
SELECT count( Size)
FROM Production.Product
```

## TOP

```SQL
-- SELECT TOP 10 * FROM TABELA
SELECT TOP 10 * FROM Production.Product
```

## ORDER BY

```SQL
-- SELECT * FROM TABELA ORDER BY coluna1 asc/desc
SELECT * FROM person.Person ORDER BY FirstName asc                --EXEMPLO1
SELECT * FROM person.Person ORDER BY FirstName asc, LastName desc --EXEMPLO2

/* DESAFIO
Obter o ProductId dos 10 produtos mais caros cadastrados no sistema,
listando do mais caro para o mais barato*/
SELECT TOP 10 Name, ListPrice FROM Production.Product ORDER BY ListPrice DESC

/* DESAFIO2
Obter o nome e numero do produto dos produtos que tem o ProductID entre 1~4 */
SELECT TOP 4 NAME, ProductID FROM Production.Product ORDER BY ProductID ASC
```

## BETWEEN

O `Between` é usado para encontrar valor entre
um valor mínimo e máximo

```Coluna1 BETWEEN valor_minimo AND valor_maximo```
é a mesma coisa que ```Coluna1 >= valor_minimo AND Coluna1 <= valor_maximo```

```SQL
-- SELECT * FROM TABELA WHERE coluna1 BETWEEN 10 AND 50
SELECT * FROM Production.Product WHERE ListPrice BETWEEN 1000 AND 1500
```

## IN

O operador `IN` é utilizado junto com `Where`
faz um filtro utilizando a lista de valores informados

```SQL
--SELECT * FROM Tabela WHERE Coluna1 IN (valor1,valor2, ...)
--IN (SELECT coluna1 FROM Tabela) -- Sub Query = pesquisa o resultado da query

SELECT * FROM Person.Person WHERE BusinessEntityID IN (2,7,13) -- filtra somente 2,7 e 13

SELECT * FROM Person.Person WHERE BusinessEntityID NOT IN (2,7,13) -- remove 2,7 e 13
```

## LIKE

O operador `LIKE` é utilizado para pesquisar se contém um texto, começa ou termina:
Esse operador não é case sensitive, ou seja, ele não diferencia maiúsculo de minúsculo.

| Pesquisa                         | Significado                             | Resultado |
|----------------------------------|-----------------------------------------|-----------|
| Where Coluna **LIKE** '%ra'      | Termina com 'ra'                        | Amora     |
| Where Coluna **LIKE** '%ra%'     | Contém 'ra'                             | Camarada  |
| Where Coluna **LIKE** 'ra%'      | Começa com 'ra'                         | Rasteiro  |
| Where Coluna **LIKE** '%ra_'     | Termina com 'ra' + um caracter no final | Acelerar  |
| Where Coluna **LIKE** '_ra%'     | Começa com 'ra' + um caracter no inicio | Brasil    |
| Where Coluna **NOT LIKE** '%ra'  | Não termina com 'ra'                    | Adulterar |
| Where Coluna **NOT LIKE** '%ra%' | Não contém 'ra'                         | Azeitona  |
| Where Coluna **NOT LIKE** 'ra%'  | Não começa 'ra'                         | Abraço    |

```SQL
--SELECT * FROM Tabela WHERE Coluna LIKE '%ra'

SELECT * FROM Person.Person WHERE FirstName LIKE '%ra' --Termina com 'ra'
SELECT * FROM Person.Person WHERE FirstName LIKE '%ra%'--Contém 'ra'
SELECT * FROM Person.Person WHERE FirstName LIKE 'ra%' --Começa com 'ra'

SELECT * FROM Person.Person WHERE FirstName LIKE '%ra_' --Termina com 'ra' + um caracter no final
SELECT * FROM Person.Person WHERE FirstName LIKE '_ra%' --Começa com 'ra' + um caracter no inicio

SELECT * FROM Person.Person WHERE FirstName NOT LIKE '%ra' --Não termina com 'ra'
SELECT * FROM Person.Person WHERE FirstName NOT LIKE '%ra%'--Não contém 'ra'
SELECT * FROM Person.Person WHERE FirstName NOT LIKE 'ra%' --Não começa com 'ra'
```

## Desafio Fundamentos SQL

* 1. Quantos Produtos temos cadastrados com valor acima de R$1.500 reias?

``` SQL
SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice > 1500
```

* 2. Quantas pessoas temos  com o sobrenome que inicia com a letra P ?

```SQL
SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'P%'
```

* 3. Em quantas cidades unicas estão cadastrados nossos clientes?

``` SQL
SELECT  COUNT(DISTINCT City)
FROM Person.Address
```

* 4. Quais são as cidades unicas que temos cadastradas no nosso sistema?

```SQL
SELECT  DISTINCT City
FROM Person.Address
```

* 5. Quantos produtos vermelhos temos entre 500 e 1000 dolares?

```SQL
SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice BETWEEN 500 AND 1000
AND Color = 'RED'
```

* 6. Quantos produtos cadastrados tem o nome 'road' no nome deles?

```SQL
SELECT COUNT(Name)
FROM Production.Product
WHERE Name LIKE '%road%'
```

## Agregação MIN, MAX, SUM e AVG

Funções de agregação basicamente agregam ou combinam dados de uma tabela em 1 resultado só

```SQL
-- Soma das 10 primeiras linhas
SELECT TOP 10 SUM(LineTotal) as "Soma"
FROM Sales.SalesOrderDetail

-- Valor minimo das 10 primeiras linhas
SELECT TOP 10 MIN(LineTotal) as "Minimo"
FROM Sales.SalesOrderDetail

-- Valor maximo das 10 primeiras linhas
SELECT TOP 10 MAX(LineTotal) as "Maximo"
FROM Sales.SalesOrderDetail

-- Media das 10 primeiras linhas
SELECT TOP 10 AVG(LineTotal) as "Media"
FROM Sales.SalesOrderDetail
```

# GROUP BY

O Group By basicamente divide o resultado da sua pesquisa em grupos
para cada grupo você pode adicionar um função de agregação, por exemplo:
-calcular soma de itens
-contar o número de itens naquele grupo

```SQL
--SELECT coluna1,funçãoAgregação(Coluna2) FROM nomeTabela GROUP BY coluna1
--É possivel escolher o nome da coluna de agregação colocando AS "Nome da Coluna"

SELECT SpecialOfferID, SUM(SpecialOfferID) AS "SOMA"
FROM SALES.SalesOrderDetail
GROUP BY SpecialOfferID;

--Quantidade de cada produto vendido até hoje
SELECT ProductId, COUNT(ProductId) AS "CONTAGEM"
FROM Sales.SalesOrderDetail
GROUP BY ProductID

-- Quantidade de cada nome que temos no banco de dados
SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName

--Na tabela Production.Product eu quero saber a média de preços dos produtos que são prata(silver)
SELECT Color, AVG(ListPrice) AS PRECO
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

------------------DESAFIO!!!!!------------------------

--1 - Eu preciso saber quantas pessoas tem o mesmo MiddleName agrupadas por MiddleName
SELECT MiddleName, COUNT(MiddleName) AS "CONTAGEM"
FROM Person.Person
GROUP BY MiddleName

--2 - Eu preciso saber em média qual é quantidade(quantity) cada produto é vendido na loja agrupado por produto.
SELECT ProductID, AVG(OrderQty) as "Media"
FROM SALES.SalesOrderDetail
GROUP BY ProductID

--3 - Eu quero saber quais foram as 10 vendas que no total tiveram os maiores valores de venda(line total)
--por produto do maior valor para o menor
SELECT TOP 10 ProductID, MAX(LineTotal) AS "MAXIMO"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY MAXIMO DESC

--4 - Eu preciso saber quantos produtos e qual quantidade média de produtos que temos
--cadastrados nas nossas ordens de serviço (WorkerOrder), agrupados por productId

SELECT ProductID, COUNT(ProductID) as "QUANTIDADE", AVG(OrderQty) as "MEDIA"
FROM Production.WorkOrder
GROUP BY ProductID
```

# HEAVING

