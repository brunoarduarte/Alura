DELIMITER //
CREATE FUNCTION f_numero_aleatorio (vNumMin INT, vNumMax INT)
RETURNS INT
BEGIN
DECLARE vReturn INT;
SELECT ROUND((RAND() * (vNumMax - vNumMin + 1)) + vNumMin) INTO vReturn;
RETURN vReturn;
END //
DELIMITER ;
