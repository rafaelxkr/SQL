--quantidade de tirulo diferentes
SELECT count(DISTINCT title)
FROM Person.Person

/*DESAFIO 1
Quantos produtos temos cadastrados em nossa tabela de produtos
(production.product)
*/--RESPOSTA =504

SELECT count(*)
FROM Production.Product

/*DESAFIO 2
Quantos tamanhos de produtos temos cadastrados em nossa tabela de produtos
(production.product)
*/--RESPOSTA = 211

SELECT count( Size)
FROM Production.Product


/*DESAFIO 3
Quantos tamanhos de produtos temos cadastrados em nossa tabela de produtos
(production.product)
*/

