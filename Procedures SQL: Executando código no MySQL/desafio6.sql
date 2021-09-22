DELIMITER $$
CREATE PROCEDURE `sp_qntd_notas` (p_data DATE)
BEGIN
DECLARE vTotal INT;
DECLARE vMsg VARCHAR(50);
SELECT COUNT(*) INTO vTotal FROM NOTAS
WHERE DATA_VENDA = p_data;
IF vTotal > 70 THEN
SET vMsg = "Muita nota";
ELSE
SET vMsg = "Pouca nota";
END IF;
SELECT vMsg;
END $$
DELIMITER ;

CALL sp_qntd_notas ("2016-01-12");
