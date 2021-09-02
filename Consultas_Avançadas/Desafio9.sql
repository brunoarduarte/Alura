SELECT CPF, COUNT(*) FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

-- Reescrevendo a query utilizando subquery

SELECT T.CPF, T.Total_notas 
FROM 
(SELECT CPF, COUNT(*) AS Total_notas FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF) AS T
WHERE T.Total_notas > 2000;
