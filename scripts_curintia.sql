-- Excliui o banco de dados
DROP DATABASE IF EXISTS curintia;

-- CRIA O BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS curintia;

-- USA O BANCO DE DADOS curiintia
USE curintia;

CREATE TABLE IF NOT EXISTS `enderecos` (
  `cep` BIGINT NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cep`)
);

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `id_fornecedor` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `cnpj` BIGINT NOT NULL,
  `telefone` BIGINT NOT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `endereco_cep` BIGINT NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  CONSTRAINT `fk_fornecedor_endereco1` FOREIGN KEY (`endereco_cep`) REFERENCES `enderecos` (`cep`)
);

CREATE TABLE IF NOT EXISTS `veiculos` (
  `id_veiculo` BIGINT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `novos` TINYINT NOT NULL,
  `eletrico` TINYINT NOT NULL,
  `esportivo` TINYINT NOT NULL,
  `picape` TINYINT NOT NULL,
  `ano` INT NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `quilometragem` FLOAT NOT NULL,
  `potencia` INT NOT NULL,
  `abs` TINYINT NOT NULL,
  `fornecedor_id_fornecedor` BIGINT NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  CONSTRAINT `fk_veiculos_fornecedor1` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`)
);

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `telefone` BIGINT NOT NULL,
  `gmail` VARCHAR(45) NOT NULL,
  `table1_cep` BIGINt NOT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `fk_clientes_table11` FOREIGN KEY (`table1_cep`) REFERENCES `enderecos` (`cep`)
);

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `matricula` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `contato` BIGINT NOT NULL,
  `salario` DOUBLE NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `enderecos_cep` BIGINT NOT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `fk_funcionarios_enderecos1` FOREIGN KEY (`enderecos_cep`) REFERENCES `enderecos` (`cep`)
);

CREATE TABLE IF NOT EXISTS `vendidos` (
  `veiculos_id_veiculo` BIGINT NOT NULL,
  `clientes_id_cliente` BIGINT NOT NULL,
  `funcionarios_matricula` BIGINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `ipva_pago` TINYINT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `tipo_veiculo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (
    `veiculos_id_veiculo`,
    `clientes_id_cliente`,
    `funcionarios_matricula`
  ),
  CONSTRAINT `fk_carros_has_clientes_carros1` FOREIGN KEY (`veiculos_id_veiculo`) REFERENCES `veiculos` (`id_veiculo`),
  CONSTRAINT `fk_carros_has_clientes_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_vendidos_funcionarios1` FOREIGN KEY (`funcionarios_matricula`) REFERENCES `funcionarios` (`matricula`)
);

insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (98860771, 'Park Meadow', '', 'Newport News', 'Virginia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (26360149, 'Beilfuss', '', 'Tyler', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (24971323, 'Stoughton', '', 'Norfolk', 'Virginia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (32813459, 'Pennsylvania', '', 'Lawrenceville', 'Georgia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (33395580, 'Meadow Ridge', '', 'Dallas', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (66575921, 'Loomis', '', 'Dallas', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (18853418, 'Forster', '', 'Amarillo', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (77727522, 'Merchant', '', 'Louisville', 'Kentucky', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (53015239, 'Bluejay', '', 'Carlsbad', 'California', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (90807252, 'Little Fleur', '', 'Lubbock', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (83300006, 'Sloan', '', 'Washington', 'District of Columbia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (6131187, 'Oriole', '', 'Plano', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (72792903, 'Colorado', '', 'Houston', 'Texas', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (90000298, 'Debra', '', 'Maple Plain', 'Minnesota', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (41222385, 'Manley', '', 'Miami', 'Florida', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (71727947, 'Northwestern', '', 'Fort Wayne', 'Indiana', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (8599487, 'Blackbird', '', 'Rochester', 'New York', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (98012944, 'Lakewood', '', 'Denver', 'Colorado', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (37621074, 'Golf', '', 'Meridian', 'Mississippi', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (96883597, 'Village', '', 'Buffalo', 'New York', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (57268243, 'Redwing', '', 'Baltimore', 'Maryland', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (95428790, 'Derek', '', 'Las Vegas', 'Nevada', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (11255228, 'Sheridan', '', 'New York City', 'New York', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (21911141, 'Karstens', '', 'Roanoke', 'Virginia', '');
insert into enderecos (cep, rua, bairro, cidade, estado, complemento) values (5445448, 'Columbus', '', 'Lake Charles', 'Louisiana', '');