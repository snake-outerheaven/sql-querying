CREATE TABLE Cliente (
    CPF       CHAR(11)     NOT NULL,
    Celular   VARCHAR(20)  NULL,
    CNH       VARCHAR(20)  NULL,
    Email     VARCHAR(100) NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (CPF)
);