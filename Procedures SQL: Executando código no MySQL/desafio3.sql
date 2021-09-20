DELIMITER $$
CREATE PROCEDURE Reajuste_Comissao (p_matricula INTEGER, p_percentual FLOAT)
BEGIN
UPDATE VENDEDORES SET PERCENTUAL_COMISSAO = p_percentual
WHERE MATRICULA = p_matricula;
END $$
DELIMITER ;

CALL Reajuste_Comissao (00238, "0.11");
