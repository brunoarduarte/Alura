CREATE VIEW `vw_relatorio_sabores` AS
SELECT TP.SABOR, YEAR(NF.DATA_VENDA) AS data_venda, SUM(INF.QUANTIDADE) AS quantidade
FROM tabela_de_produtos AS TP
INNER JOIN itens_notas_fiscais AS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais AS NF ON INF.NUMERO = NF.NUMERO
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
HAVING data_venda = 2016
ORDER BY quantidade DESC;

CREATE VIEW `vw_total_vendas_2016` AS
SELECT YEAR(NF.DATA_VENDA) AS data_venda, SUM(INF.QUANTIDADE) AS quantidade
FROM tabela_de_produtos AS TP
INNER JOIN itens_notas_fiscais AS INF ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN notas_fiscais AS NF ON INF.NUMERO = NF.NUMERO
GROUP BY YEAR(NF.DATA_VENDA)
HAVING data_venda = 2016
ORDER BY quantidade DESC;

SELECT VW1.SABOR, VW1.data_venda, VW1.quantidade, 
ROUND((VW1.quantidade/VW2.quantidade) * 100, 2) AS participacao
FROM vw_relatorio_sabores AS VW1, vw_total_vendas_2016 AS VW2
ORDER BY participacao DESC;
