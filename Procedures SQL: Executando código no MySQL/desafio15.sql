DELIMITER $$
CREATE FUNCTION search_rand_product ()
RETURNS VARCHAR(200)
BEGIN
	DECLARE vResult VARCHAR(200);
    DECLARE vNumMax INT;
    DECLARE vNumRand INT;
    SELECT COUNT(*) INTO vNumMax FROM PRODUTOS;
    SET vNumRand = f_numero_aleatorio (1, vNumMax) - 1;
    SELECT NOME_DO_PRODUTO INTO vResult FROM PRODUTOS
    LIMIT vNumRand, 1;
RETURN vResult;
END $$
DELIMITER ;

SELECT search_rand_product() AS PRODUTO_ALEATORIO;