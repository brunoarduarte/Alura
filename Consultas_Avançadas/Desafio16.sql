SELECT total_por_tamanho.TAMANHO, total_por_tamanho.DATA_VENDA,
total_por_tamanho.QUANTIDADE,
ROUND((total_por_tamanho.QUANTIDADE/total_geral.QUANTIDADE) * 100, 2) AS participacao
FROM 
(SELECT TP.TAMANHO, YEAR(NF.DATA_VENDA) AS data_venda, SUM(INF.QUANTIDADE) AS quantidade
FROM tabela_de_produtos AS TP
INNER JOIN itens_notas_fiscais AS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais AS NF ON INF.NUMERO = NF.NUMERO
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)
HAVING data_venda = 2016
ORDER BY quantidade DESC) AS total_por_tamanho
INNER JOIN 
(SELECT YEAR(NF.DATA_VENDA) AS data_venda, SUM(INF.QUANTIDADE) AS quantidade
FROM tabela_de_produtos AS TP
INNER JOIN itens_notas_fiscais AS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais AS NF ON INF.NUMERO = NF.NUMERO
GROUP BY YEAR(NF.DATA_VENDA)
HAVING data_venda = 2016
ORDER BY quantidade DESC) AS total_geral
ON total_por_tamanho.DATA_VENDA = total_geral.DATA_VENDA;
