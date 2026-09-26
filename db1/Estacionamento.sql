CREATE TABLE Estacionamento (
    CNPJ          CHAR(14)     NOT NULL,
    Nome_Fantasia VARCHAR(100) NOT NULL,
    Logradouro    VARCHAR(100) NULL,
    Numero        VARCHAR(10)  NULL,
    Complemento   VARCHAR(50)  NULL,
    Cidade        VARCHAR(60)  NULL,
    Estado        CHAR(2)      NULL,
    CONSTRAINT PK_Estacionamento PRIMARY KEY (CNPJ)
);