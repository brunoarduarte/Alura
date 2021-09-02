SELECT NOME AS nome, CONCAT(ENDERECO_1,', ', BAIRRO,', ', CIDADE,'/', ESTADO) AS 'endereço completo'
FROM tabela_de_clientes;
