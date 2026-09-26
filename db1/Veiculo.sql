CREATE TABLE Veiculo (
    Placa               CHAR(7)      NOT NULL,
    Marca               VARCHAR(50)  NOT NULL,
    Modelo              VARCHAR(50)  NOT NULL,
    Ano_Fabricacao      SMALLINT     NOT NULL,
    Cor                 VARCHAR(30)  NULL,
    Tarifa              DECIMAL(10,2) NOT NULL,
    CNPJ_Estacionamento CHAR(14)     NOT NULL,
    CONSTRAINT PK_Veiculo PRIMARY KEY (Placa),
    CONSTRAINT FK_Veiculo_Estacionamento FOREIGN KEY (CNPJ_Estacionamento)
        REFERENCES Estacionamento (CNPJ)
);