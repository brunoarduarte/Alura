DELIMITER $$
CREATE PROCEDURE SP_Comparativo_Vendas_Case (vPrimeira_data DATE, vSegunda_Data DATE)
BEGIN
	DECLARE vFaturamento1 FLOAT;
	DECLARE vFaturamento2 FLOAT;
	DECLARE vVariacao FLOAT;
	DECLARE vMsg VARCHAR(10);
	SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vFaturamento1 FROM 
	NOTAS A INNER JOIN ITENS_NOTAS B
	ON A.NUMERO = B.NUMERO
	WHERE A.DATA_VENDA = vPrimeira_data;
	SELECT SUM(B.QUANTIDADE * B.PRECO) INTO vFaturamento2 FROM 
	NOTAS A INNER JOIN ITENS_NOTAS B
	ON A.NUMERO = B.NUMERO
	WHERE A.DATA_VENDA = vSegunda_Data;
	SET vVariacao = ((vFaturamento1 / vFaturamento2) -1) * 100;
	CASE
    WHEN vVariacao > 10 THEN SET vMsg = "VERDE";
    WHEN vVariacao >= -10 AND vVariacao <= 10 THEN SET vMsg = "AMARELO";
	WHEN vVariacao < -10 THEN SET vMsg = "VERMELHO";
	END CASE;
    SELECT vMsg;
END $$
DELIMITER ;

CALL Comparativo_Vendas_Case_Cond ("20170301", "20170530");