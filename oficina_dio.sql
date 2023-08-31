CREATE TABLE `clientes` (
  `idCliente` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(15),
  `endereco` VARCHAR(255),
  `dataCadastro` DATE,
  `email` VARCHAR(100),
  CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE `veiculos` (
  `idVeiculo` INT PRIMARY KEY AUTO_INCREMENT,
  `idCliente` INT,
  `marca` VARCHAR(50) NOT NULL,
  `modelo` VARCHAR(50) NOT NULL,
  `anoFabricacao` YEAR,
  `placa` VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE `servicos` (
  `idServico` INT PRIMARY KEY AUTO_INCREMENT,
  `idVeiculo` INT,
  `dataServico` DATE,
  `descricao` TEXT,
  `valor` DECIMAL(10,2)
);

CREATE TABLE `pedidos` (
  `idPedido` INT PRIMARY KEY AUTO_INCREMENT,
  `idCliente` INT,
  `dataPedido` DATE,
  `statusPedido` VARCHAR(50)
);

CREATE TABLE `itensPedido` (
  `idPedido` INT,
  `idServico` INT,
  `quantidade` INT DEFAULT 1
);

CREATE TABLE `situacaoPagamento` (
  `idPedido` INT,
  `dataPagamento` DATE,
  `valorPago` DECIMAL(10,2)
);

CREATE TABLE `relatorioServicos` (
  `idVeiculo` INT,
  `dataEntrada` DATE,
  `dataSaida` DATE,
  `servicoRealizado` TEXT
);

ALTER TABLE `veiculos` ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`);

ALTER TABLE `servicos` ADD CONSTRAINT `fk_veiculo` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculos` (`idVeiculo`);

ALTER TABLE `pedidos` ADD CONSTRAINT `fk_cliente_pedido` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`);

ALTER TABLE `itensPedido` ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`);

ALTER TABLE `itensPedido` ADD CONSTRAINT `fk_servico` FOREIGN KEY (`idServico`) REFERENCES `servicos` (`idServico`);

ALTER TABLE `situacaoPagamento` ADD CONSTRAINT `fk_pedido_pagamento` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`);

ALTER TABLE `relatorioServicos` ADD CONSTRAINT `fk_veiculo_relatorio` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculos` (`idVeiculo`);

USE Desafio_Projeto_SQL_Do_Zero;

INSERT INTO clientes (nome, telefone, endereco, dataCadastro, email)
VALUES
     ('Machado de Assis', '(11) 1234-5678', 'Rua das Flores, 123', '2023-01-01', 'machado@email.com'),
    ('George Orwell', '(11) 9876-5432', 'Rua das Árvores, 789', '2023-01-02', 'george@email.com'),
    ('William Shakespeare', '(11) 1111-2222', 'Rua dos Mares, 101', '2023-01-03', 'william@email.com'),
    ('Jane Austen', '(11) 5555-6666', 'Rua do Sol, 55', '2023-01-04', 'jane@email.com'),
    ('Charles Dickens', '(11) 9999-8888', 'Rua das Estrelas, 77', '2023-01-05', 'charles@email.com'),
    ('Leo Tolstoy', '(11) 7777-8888', 'Rua das Montanhas, 12', '2023-01-06', 'leo@email.com'),
    ('Franz Kafka', '(11) 4444-3333', 'Avenida da Praia, 23', '2023-01-07', 'franz@email.com'),
    ('Emily Brontë', '(11) 5555-4444', 'Rua das Colinas, 56', '2023-01-08', 'emily@email.com'),
    ('Hermann Hesse', '(11) 9999-7777', 'Rua dos Lagos, 34', '2023-01-09', 'hermann@email.com'),
    ('Gabriel García Márquez', '(11) 1111-5555', 'Avenida Central, 67', '2023-01-10', 'gabriel@email.com');

INSERT INTO veiculos (idCliente, marca, modelo, anoFabricacao, placa)
VALUES
     (1, 'Fiat', 'Fiat 500', 2020, 'ABC1234'),
    (2, 'Volkswagen', 'VW Passat', 2019, 'XYZ5678'),
    (3, 'BMW', 'BMW Série 7', 2021, 'DEF4321'),
    (4, 'Mercedes-Benz', 'Mercedes-Benz Classe S', 2022, 'HIJ9876'),
    (5, 'Audi', 'Audi A8', 2020, 'LMN6543'),
    (6, 'Lexus', 'Lexus LS', 2021, 'OPQ7890'),
    (7, 'Tesla', 'Tesla Model S', 2022, 'RST5432'),
    (8, 'Porsche', 'Porsche Panamera', 2019, 'UVW8765'),
    (9, 'Jaguar', 'Jaguar XJ', 2022, 'JKL2109'),
    (10, 'Maserati', 'Maserati Quattroporte', 2021, 'MNO7891');

INSERT INTO servicos (idVeiculo, dataServico, descricao, valor)
VALUES
    (1, '2023-01-05', 'Troca de Óleo', 100.00),
    (2, '2023-01-06', 'Alinhamento e Balanceamento', 80.00),
    (3, '2023-01-10', 'Troca de Pneus', 200.00),
    (4, '2023-01-15', 'Troca de Correia Dentada', 250.00),
    (5, '2023-01-20', 'Revisão Geral', 400.00),
    (6, '2023-01-25', 'Reparo de Freios', 150.00),
    (7, '2023-01-30', 'Troca de Bateria', 120.00),
    (8, '2023-02-05', 'Reparo do Motor', 300.00),
    (9, '2023-02-10', 'Limpeza de Filtros', 60.00),
    (10, '2023-02-15', 'Troca de Lâmpadas', 40.00);

INSERT INTO pedidos (idCliente, dataPedido, statusPedido)
VALUES
    (1, '2023-01-05', 'Em andamento'),
    (2, '2023-01-06', 'Em andamento'),
    (3, '2023-01-10', 'Concluído'),
    (4, '2023-01-15', 'Concluído'),
    (5, '2023-01-20', 'Em andamento'),
    (6, '2023-01-25', 'Concluído'),
    (7, '2023-01-30', 'Concluído'),
    (8, '2023-02-05', 'Em andamento'),
    (9, '2023-02-10', 'Concluído'),
    (10, '2023-02-15', 'Em andamento');

INSERT INTO itensPedido (idPedido, idServico, quantidade)
VALUES
    (1, 1, 1),
    (2, 3, 2),
    (3, 5, 1),
    (4, 7, 1),
    (5, 9, 3),
    (6, 2, 2),
    (7, 4, 1),
    (8, 6, 1),
    (9, 8, 1),
    (10, 10, 4);

INSERT INTO situacaoPagamento (idPedido, dataPagamento, valorPago)
VALUES
    (1, '2023-01-05', 100.00),
    (2, '2023-01-07', 240.00),
    (3, '2023-01-11', 200.00),
    (4, '2023-01-16', 250.00),
    (5, '2023-01-22', 480.00),
    (6, '2023-01-26', 300.00),
    (7, '2023-01-31', 120.00),
    (8, '2023-02-06', 300.00),
    (9, '2023-02-12', 60.00),
    (10, '2023-02-16', 160.00);

INSERT INTO relatorioServicos (idVeiculo, dataEntrada, dataSaida, servicoRealizado)
VALUES
    (1, '2023-01-05', '2023-01-05', 'Troca de Óleo'),
    (2, '2023-01-06', '2023-01-07', 'Alinhamento e Balanceamento'),
    (3, '2023-01-10', '2023-01-11', 'Troca de Pneus'),
    (4, '2023-01-15', '2023-01-16', 'Troca de Correia Dentada'),
    (5, '2023-01-20', '2023-01-22', 'Revisão Geral'),
    (6, '2023-01-25', '2023-01-26', 'Reparo de Freios'),
    (7, '2023-01-30', '2023-01-31', 'Troca de Bateria'),
    (8, '2023-02-05', '2023-02-06', 'Reparo do Motor'),
    (9, '2023-02-10', '2023-02-12', 'Limpeza de Filtros'),
    (10, '2023-02-15', '2023-02-16', 'Troca de Lâmpadas');

-- Último serviço por cliente
SELECT 'Informações de CRM' AS Categoria, c.nome AS NomeCliente, MAX(s.dataServico) AS UltimoServico
FROM clientes c
LEFT JOIN veiculos v ON c.idCliente = v.idCliente
LEFT JOIN servicos s ON v.idVeiculo = s.idVeiculo
GROUP BY Categoria, c.nome;

-- Contagem de serviços por mês
SELECT 'Métricas de Frequência de Serviço' AS Categoria, YEAR(dataServico) AS Ano, MONTH(dataServico) AS Mes, COUNT(*) AS TotalServicos
FROM servicos
GROUP BY Categoria, YEAR(dataServico), MONTH(dataServico);

-- Média de valor de serviços por marca de veículo
SELECT 'Veículos Melhor Cuidados' AS Categoria, v.marca AS MarcaVeiculo, AVG(s.valor) AS MediaValor
FROM veiculos v
LEFT JOIN servicos s ON v.idVeiculo = s.idVeiculo
GROUP BY Categoria, v.marca
HAVING AVG(s.valor) IS NOT NULL;

-- Clientes que não realizaram serviços nos últimos 6 meses
SELECT 'Clientes Inativos' AS Categoria, c.nome AS NomeCliente, MAX(s.dataServico) AS UltimoServico
FROM clientes c
LEFT JOIN veiculos v ON c.idCliente = v.idCliente
LEFT JOIN servicos s ON v.idVeiculo = s.idVeiculo
GROUP BY Categoria, c.nome
HAVING MAX(s.dataServico) < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
