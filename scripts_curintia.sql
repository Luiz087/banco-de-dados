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

insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Cadillac', 'Escalade ESV', 93, 65, false, false, true, false, 2007, 'Orange', true, 617175);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Volkswagen', 'Touareg', 37, 61, false, false, false, true, 2008, 'Mauv', true, 15930);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Lincoln', 'Navigator', 82, 36, true, false, true, false, 2011, 'Mauv', true, 781195);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chevrolet', 'Corvair 500', 37, 9, true, true, true, true, 1963, 'Blue', false, 697034);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Lincoln', 'Navigator', 85, 37, false, false, true, false, 2011, 'Puce', false, 958820);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Ford', 'Fusion', 12, 35, true, false, false, true, 2009, 'Blue', true, 929550);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mazda', 'MX-3', 82, 15, false, true, true, false, 1992, 'Aquamarine', true, 136048);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Ford', 'Edge', 48, 24, false, false, false, false, 2012, 'Goldenrod', false, 759029);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('GMC', 'Sierra 1500', 26, 40, false, false, false, false, 2007, 'Blue', true, 718194);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Dodge', 'D150', 51, 30, false, false, false, true, 1993, 'Blue', true, 774026);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mercedes-Benz', 'S-Class', 40, 7, true, true, false, false, 2005, 'Goldenrod', false, 907369);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chevrolet', 'Corsica', 61, 99, false, true, false, true, 1994, 'Yellow', true, 443048);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Ford', 'LTD', 90, 35, false, false, false, false, 1985, 'Blue', false, 676606);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Buick', 'LeSabre', 3, 86, false, false, true, false, 1997, 'Pink', false, 652142);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Honda', 'Odyssey', 7, 53, false, false, false, true, 2006, 'Teal', true, 383120);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Volkswagen', 'riolet', 33, 53, false, true, true, true, 1992, 'Yellow', false, 347595);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mercury', 'Capri', 46, 80, false, true, true, false, 1991, 'Fuscia', false, 456100);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Dodge', 'Viper RT/10', 79, 86, true, true, false, true, 1995, 'Goldenrod', true, 766662);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chevrolet', 'Malibu Maxx', 73, 71, false, false, false, false, 2006, 'Turquoise', true, 759542);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Hummer', 'H3', 12, 87, true, true, false, true, 2007, 'Purple', true, 210553);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Hyundai', 'XG350', 15, 36, true, true, true, false, 2003, 'Orange', false, 909273);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Chrysler', '300', 57, 88, false, true, true, false, 1999, 'Turquoise', true, 231672);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mitsubishi', 'Galant', 77, 59, true, false, false, false, 1993, 'Fuscia', true, 762517);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Mercury', 'Grand Marquis', 1, 23, false, true, true, true, 2002, 'Mauv', false, 518766);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco) values ('Plymouth', 'Colt Vista', 34, 85, true, false, false, false, 1994, 'Indigo', true, 583661);

insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Adelheid', 68704944920, 'SedVestibulum.ppt', false, 'Silhouette');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Vasily', 52884361363, 'EtTempus.xls', true, 'S10');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Herold', 7823368975, 'BlanditNon.tiff', false, 'Navigator');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Bengt', 49315960949, 'VelAugue.gif', false, 'VehiCROSS');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Lionello', 28282848725, 'Suspendisse.ppt', true, 'Expedition');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Ianthe', 96792793746, 'Nec.pdf', false, 'Suburban 1500');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Riane', 17360308262, 'Molestie.jpeg', true, 'E-Class');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Lyell', 9639596492, 'Luctus.mp3', true, 'Optima');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Alix', 23754333721, 'Ac.mov', true, 'Camaro');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Magdalene', 83304029884, 'LiberoRutrumAc.gif', true, 'Solara');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Darwin', 82630920672, 'OrciEgetOrci.xls', false, 'RAV4');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Jerry', 44004039565, 'UltricesErat.txt', false, 'Solara');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Clea', 89182525968, 'PedeJusto.gif', true, 'V70');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Robinia', 11987259151, 'Mauris.tiff', true, 'Beretta');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Rabbi', 49716363623, 'RisusSemperPorta.ppt', true, 'Cabriolet');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Karisa', 17698270604, 'IntegerAliquet.xls', true, 'XL-7');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Mikaela', 22032283259, 'ArcuAdipiscingMolestie.xls', false, 'Escalade EXT');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Alvis', 50868545150, 'OrciVehiculaCondimentum.xls', false, 'Silverado 3500');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Ertha', 35386100041, 'CongueDiam.mp3', false, 'MDX');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Conrade', 28482723167, 'Phasellus.xls', false, 'Horizon');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Dion', 81491983259, 'DiamNeque.tiff', true, 'Toronado');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Berton', 20633940404, 'APede.jpeg', false, 'Miata MX-5');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Jacob', 19431254984, 'CuraeNullaDapibus.mp3', true, 'B-Series');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Melva', 37264335722, 'OdioOdioElementum.mp3', true, 'Defender 110');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo) values ('Hildagard', 90710219622, 'Nunc.txt', true, 'NV2500');
