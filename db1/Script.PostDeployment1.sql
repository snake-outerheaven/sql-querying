/*
Modelo de Script Pós-Implantação							
--------------------------------------------------------------------------------------
 Este arquivo contém instruções SQL que serão acrescentadas ao script de compilação.		
 Use sintaxe SQLCMD para incluir um arquivo no script pós-implantação.			
 Exemplo:      :r .\myfile.sql								
 Use sintaxe SQLCMD para referenciar uma variável no script pós-implantação.		
 Exemplo:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/* =========================================================================
   Post-Deployment Script - Dados de exemplo (LocadoraVeiculos / TravelDB)
   Executa automaticamente toda vez que o projeto é publicado.
   Ordem respeita as dependências de FK.
   ========================================================================= */

-- 1) CLIENTE
INSERT INTO Cliente (CPF, Celular, CNH, Email) VALUES
('11122233344', '(22) 99911-1111', '01234567890', 'ana.souza@email.com'),
('22233344455', '(22) 99922-2222', '02345678901', 'bruno.lima@email.com'),
('33344455566', '(22) 99933-3333', '03456789012', 'carla.melo@email.com');
GO

-- 2) ESTACIONAMENTO
INSERT INTO Estacionamento (CNPJ, Nome_Fantasia, Logradouro, Numero, Complemento, Cidade, Estado) VALUES
('11111111000101', 'Base Centro',   'Rua Aloisio da Silva Gomes', '50',  NULL,        'Macae', 'RJ'),
('22222222000102', 'Base Praia',    'Av. Beira Mar',              '900', 'Loja 2',    'Macae', 'RJ'),
('33333333000103', 'Base Rodovia',  'Rod. Amaral Peixoto',        '1200', NULL,       'Macae', 'RJ');
GO

-- 3) VEICULO (depende de Estacionamento)
INSERT INTO Veiculo (Placa, Marca, Modelo, Ano_Fabricacao, Cor, Tarifa, CNPJ_Estacionamento) VALUES
('ABC1D23', 'Fiat',       'Mobi',    2022, 'Branco',  0.85, '11111111000101'),
('DEF4E56', 'Chevrolet',  'Onix',    2023, 'Prata',   0.95, '22222222000102'),
('GHI7F89', 'Volkswagen', 'Polo',    2021, 'Preto',   1.10, '33333333000103');
GO

-- 4) CARTAO (depende de Cliente)
INSERT INTO Cartao (Numero_Cartao, Validade_Cartao, CVV, Nome_Impresso, CPF_Cliente) VALUES
('4111111111111111', '2028-05-01', '123', 'ANA SOUZA',  '11122233344'),
('5222222222222222', '2027-11-01', '456', 'BRUNO LIMA', '22233344455'),
('4333333333333333', '2029-02-01', '789', 'CARLA MELO', '33344455566');
GO

-- 5) VIAGEM (depende de Cliente, Veiculo e Estacionamento)
INSERT INTO Viagem (Km_Inicial, Km_Final, CPF_Cliente, Placa_Veiculo, CNPJ_Estacionamento_Origem, CNPJ_Estacionamento_Destino) VALUES
(1000.0, 1015.5, '11122233344', 'ABC1D23', '11111111000101', '22222222000102'),
(2500.0, 2512.0, '22233344455', 'DEF4E56', '22222222000102', '11111111000101'),
(800.0,  NULL,   '33344455566', 'GHI7F89', '33333333000103', NULL);
GO