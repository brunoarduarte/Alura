ALTER TABLE Vendedores ADD PRIMARY KEY (Matrícula);

ALTER TABLE Vendedores ADD COLUMN(DATA_ADMISSÃO DATE);
ALTER TABLE Vendedores ADD COLUMN(DE_FERIAS VARCHAR(5));

UPDATE Vendedores SET DATA_ADMISSÃO = '2014-08-15', DE_FERIAS = 'Não'
WHERE Matrícula = 00235;

UPDATE Vendedores SET DATA_ADMISSÃO = '2013-09-17', DE_FERIAS = 'Sim'
WHERE Matrícula = 00236;

INSERT INTO Vendedores (Matrícula, Nome, Comissão, DATA_ADMISSÃO, DE_FERIAS)
VALUES (00237, 'Roberta Martins', 11, '2017-03-18', 'Sim'),
(00238, 'Péricles Alves', 11, '2016-08-21', 'Não');
