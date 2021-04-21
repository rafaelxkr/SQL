/*SELECT coluna1,coluna2,coluna_n
FROM tabela
WHERE condicao

OPERADOR  -  DESCRICAO
=            IGUAL
>            MAIOR QUE
<            MENOR QUE
>=           MAIOR QUE OU IGUAL
<=           MENOR QUE OU IGUAL
<>           DIFERENTE DE
AND          OPERADOR LÓGICO E 
OR           OPERADOR LÓGICO OU
LIKE         CONTEM TEXTO ONDE "%" É O CARACTER CORINGA

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