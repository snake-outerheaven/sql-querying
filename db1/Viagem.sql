-- Desafio do MER: Viagem não tem atributo identificador natural.
-- Solução: chave primária artificial (surrogate key) Id_Viagem, com IDENTITY.
-- Km_Final e Estacionamento_Destino ficam NULL enquanto a viagem está em andamento.
CREATE TABLE Viagem (
    Id_Viagem                   INT IDENTITY(1,1) NOT NULL,
    Km_Inicial                  DECIMAL(10,2) NOT NULL,
    Km_Final                    DECIMAL(10,2) NULL,
    CPF_Cliente                 CHAR(11)  NOT NULL,
    Placa_Veiculo               CHAR(7)  NOT NULL,
    CNPJ_Estacionamento_Origem  CHAR(14) NOT NULL,
    CNPJ_Estacionamento_Destino CHAR(14) NULL,
    CONSTRAINT PK_Viagem PRIMARY KEY (Id_Viagem),
    CONSTRAINT FK_Viagem_Cliente FOREIGN KEY (CPF_Cliente)
        REFERENCES Cliente (CPF),
    CONSTRAINT FK_Viagem_Veiculo FOREIGN KEY (Placa_Veiculo)
        REFERENCES Veiculo (Placa),
    CONSTRAINT FK_Viagem_Estacionamento_Origem FOREIGN KEY (CNPJ_Estacionamento_Origem)
        REFERENCES Estacionamento (CNPJ),
    CONSTRAINT FK_Viagem_Estacionamento_Destino FOREIGN KEY (CNPJ_Estacionamento_Destino)
        REFERENCES Estacionamento (CNPJ),
    INDEX IX_Viagem_Cliente NONCLUSTERED (CPF_Cliente),
    INDEX IX_Viagem_Veiculo NONCLUSTERED (Placa_Veiculo)
);