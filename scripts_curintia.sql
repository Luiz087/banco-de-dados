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

insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (25837, 'Lindy', 22726014571, 13410553435, 723164, 'atendente', 26585150);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (21403, 'Jarret', 48791425360, 35980146935, 872439, 'controle de qualidade', 36095615);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (66805, 'Catrina', 80075228935, 19591078528, 34577, 'assistente financeiro', 43952416);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (12162, 'Karola', 15101050114, 77896118040, 60396, 'financeiro', 14511259);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (53884, 'Marsiella', 34307250676, 90680934226, 266864, 'anunciante', 3128314);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (3506, 'Bertha', 12463955569, 90116297387, 848844, 'limpador', 57427127);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (62286, 'Ferguson', 58930365379, 46109461366, 752010, 'atendente', 79994788);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (32700, 'Natka', 89531149986, 35610619177, 904351, 'abastecedor', 70447519);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (35722, 'Klarrisa', 9836497788, 91137859023, 366295, 'vendedor', 83800653);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (86322, 'Lari', 9877551095, 63845844974, 916615, 'empresario', 15743572);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (64190, 'Grace', 23309499408, 67234740452, 514410, 'mecanico', 62916261);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (14218, 'Aila', 505005408, 81714544142, 254192, 'sócio proprietario', 98150887);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (52267, 'Cyrille', 23547659105, 71090598457, 228762, 'coordernador', 99968732);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (95923, 'Marcile', 13348431197, 53528462624, 628954, 'Editor', 65937121);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (10898, 'Siegfried', 3552317540, 55399779452, 994769, 'Administrator', 29588060);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (3757, 'Pete', 12343440841, 77806073273, 182210, 'vendedor', 75672059);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (69152, 'Georgia', 39684215524, 5922694783, 808915, 'aprendiz de vendas', 40671665);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (46386, 'Berkley', 23432922723, 12278096315, 37000, 'Marketing', 91645844);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (63641, 'Stefano', 80946074838, 83454126209, 288747, 'mecanico', 3104288);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (40421, 'Meredithe', 33494134391, 84019606741, 461362, 'financiador', 99522093);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (49478, 'Zachary', 19495325321, 80874368814, 63220, 'gerente', 47559826);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (8403, 'Hanna', 50105009335, 36324574674, 768937, 'dono', 67687782);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (52362, 'Betti', 51034921685, 59913892801, 659172, 'atendente', 11668950);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (33799, 'Ashbey', 98288857125, 79896897818, 66949, 'limpador', 78651254);
insert into funcionarios (matricula, nome, cpf, contato, salario, funcao, enderercos_cep) values (69111, 'Nani', 89697889863, 71680589359, 367649, 'vendedor', 93222148);

insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (68785020736268, 'Guenna', 76775109279, 'Streich, Bednar and Jones', '5th Floor');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (11639021681582, 'Adan', 55813361975, 'Hintz, Schaden and Jerde', 'PO Box 35830');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (87315142571796, 'Eba', 24100790474, 'Feest-Stroman', 'Suite 49');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (14879047680685, 'Andreas', 33153738324, 'Crona-Wilkinson', 'Room 170');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (80802075229191, 'Vicki', 93409201737, 'Price, Stark and Renner', 'PO Box 27186');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (20239047489459, 'Chevy', 85615925265, 'Altenwerth-Lebsack', 'Room 486');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (17190166389307, 'Itch', 47530031860, 'Greenfelder-Marquardt', 'Suite 3');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (47511596811729, 'Otto', 30195753349, 'Ernser, Roob and Hane', '2nd Floor');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (87484758032080, 'Orelie', 51619853633, 'Wyman, Frami and Koepp', 'Room 695');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (40320605961699, 'Seymour', 72311907553, 'Roberts, Wuckert and Sipes', 'Apt 885');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (49323464349847, 'Farrell', 27291434723, 'Keebler-Paucek', 'PO Box 20124');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (60497002970115, 'Ines', 82611155984, 'Lehner-Harvey', 'Apt 1217');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (82799058630448, 'Eunice', 94633683249, 'Blanda and Sons', 'Room 49');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (31197358103477, 'Tuck', 32280898660, 'Rempel, Ruecker and Trantow', 'Apt 426');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (18863417393296, 'Annecorinne', 58006698264, 'Hamill, MacGyver and Lubowitz', '20th Floor');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (97026650892014, 'Caspar', 30069793809, 'Kreiger LLC', 'PO Box 37153');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (2657640855493, 'Curr', 92173932031, 'Wiegand and Sons', 'Room 1804');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (95454682516783, 'Giffy', 90775188539, 'Goodwin, Conn and Armstrong', 'Apt 1909');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (80945584037641, 'Amery', 79432382480, 'Blick, Hirthe and Gutmann', '1st Floor');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (67282934767082, 'Joy', 78211919966, 'Steuber-Murazik', 'PO Box 85352');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (25645746334989, 'Evangelina', 82330832535, 'Pagac-Grimes', 'PO Box 15751');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (89593277601400, 'Scotti', 45964541468, 'McLaughlin, Champlin and Labadie', 'PO Box 95373');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (37589303735333, 'Cordie', 34295476772, 'Hackett and Sons', 'Suite 50');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (29925170873467, 'Mignon', 46182439323, 'Goyette and Sons', 'Room 1579');
insert into funcionarios (cnpj, nome, telefone, empresa, endereco) values (91697519296538, 'Ashton', 63203556793, 'Turcotte, Hudson and Schumm', 'Room 663');

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


