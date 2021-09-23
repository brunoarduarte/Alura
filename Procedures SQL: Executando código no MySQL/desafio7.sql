DELIMITER $$
CREATE PROCEDURE Comparativo_Vendas (vPrimeira_data DATE, vSegunda_Data DATE)
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
	IF vVariacao > 10 THEN
		SET vMsg = "VERDE";
	ELSEIF vVariacao >= -10 AND vVariacao >= 10 THEN
		SET vMsg = "AMARELO";
	ELSE
		SET vMsg = "VERMELHO";
	END IF;
    SELECT vMsg;
END $$
DELIMITER ;

CALL Comparativo_Vendas ("20170301", "20170530");