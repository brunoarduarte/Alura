SELECT NOME AS Nome, (YEAR(CURRENT_DATE()) - YEAR(DATA_DE_NASCIMENTO)) AS Idade 
FROM tabela_de_clientes;

-- Outra forma de fazer a mesma query
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes;
