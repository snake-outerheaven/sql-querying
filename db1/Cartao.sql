CREATE TABLE Cartao (
    Numero_Cartao    VARCHAR(19)  NOT NULL,
    Validade_Cartao  DATE         NOT NULL,
    CVV              CHAR(3)      NOT NULL,
    Nome_Impresso    VARCHAR(100) NOT NULL,
    CPF_Cliente      CHAR(11)     NOT NULL,
    CONSTRAINT PK_Cartao PRIMARY KEY (Numero_Cartao),
    CONSTRAINT FK_Cartao_Cliente FOREIGN KEY (CPF_Cliente)
    REFERENCES Cliente (CPF)
);