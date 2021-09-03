SELECT concat('O cliente ',NOME,'faturou ',ROUND(SUM(inf.PRECO * inf.QUANTIDADE) , 2),' no ano de 2016') AS resultado
FROM tabela_de_clientes AS tc
INNER JOIN notas_fiscais AS nf ON tc.cpf=nf.cpf
INNER JOIN itens_notas_fiscais AS inf ON inf.numero=nf.numero
WHERE YEAR(nf.DATA_VENDA)=2016
GROUP BY nome;
