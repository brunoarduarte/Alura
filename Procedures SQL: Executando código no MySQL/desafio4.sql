DELIMITER //
CREATE PROCEDURE sp_add_product (p_codigo INTEGER, p_nome VARCHAR(100), p_embalagem VARCHAR(30), p_tamanho VARCHAR(20),
p_sabor VARCHAR(30), p_preco FLOAT)
BEGIN
DECLARE message VARCHAR(40);
DECLARE EXIT HANDLER FOR 1062
BEGIN
  SET message = "Chave primária já existe!";
  SELECT message;
END;
INSERT INTO PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES (p_codigo, p_nome, p_embalagem, p_tamanho, p_sabor, p_preco);
SET message = "Produto incluído com sucesso!";
SELECT message;
END //
DELIMITER ;

CALL sp_add_product (1000890, "Sabor da Montanha - 700 ml - Pêssego", "Garrafa", "700 ml", "Pêssego", "5.50");
