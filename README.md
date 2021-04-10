
# Comandos SQL

[BETWEEN](#BETWEEN)

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

O between é usado para encontrar valor entre
um valor mínimo e máximo

```Coluna1 BETWEEN valor_minimo AND valor_maximo```
é a mesma coisa que
```Coluna1 >= valor_minimo AND Coluna1 <= valor_maximo```

```SQL
-- SELECT * FROM TABELA WHERE coluna1 BETWEEN 10 AND 50
SELECT * FROM Production.Product WHERE ListPrice BETWEEN 1000 AND 1500
```
