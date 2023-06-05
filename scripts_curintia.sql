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
  `id_veiculo` BIGINT NOT NULL auto_increment,
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
  `matricula` BIGINT NOT NULL auto_increment,
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

insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (1, 'Merrie', 17690579258, 'mskedge0', '600-450-9004', 'mshiers0@google.co.uk', '68788-9799');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (2, 'Milo', 92870665218, 'mmehaffey1', '394-374-8217', 'mgelardi1@latimes.com', '0187-2097');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (3, 'Emmanuel', 1396608876, 'eoldroyde2', '605-882-1683', 'ewiddup2@sourceforge.net', '0615-7713');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (4, 'Carita', 81134980688, 'csepey3', '671-906-8688', 'cmarie3@dedecms.com', '61722-183');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (5, 'Stanleigh', 694068410, 'sdelacey4', '894-400-9064', 'scrowth4@so-net.ne.jp', '68462-361');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (6, 'Kelcie', 95560040490, 'ksurphliss5', '961-853-1599', 'kholliar5@ycombinator.com', '13537-189');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (7, 'Misti', 60726342495, 'mmeaney6', '895-782-3729', 'mflay6@liveinternet.ru', '54868-6083');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (8, 'Sophi', 24113827613, 'shouchin7', '704-809-8818', 'scresswell7@adobe.com', '63629-3316');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (9, 'Fritz', 88611572058, 'fsillis8', '134-877-1204', 'ftemplar8@dropbox.com', '41163-645');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (10, 'York', 70559598841, 'ygreeve9', '622-916-2366', 'yinston9@squidoo.com', '52376-036');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (11, 'Roxine', 32718545551, 'rsherela', '983-504-1671', 'rthainea@washingtonpost.com', '0574-4022');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (12, 'Caresa', 79291776127, 'cquiddingtonb', '341-192-4410', 'cconboyb@soundcloud.com', '13668-167');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (13, 'Rich', 61559298429, 'rsleenyc', '637-950-5225', 'rthomelc@usatoday.com', '63629-3976');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (14, 'Matti', 23846919652, 'mmawdd', '353-534-6440', 'mtreasadend@sogou.com', '30142-190');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (15, 'Giselbert', 36935266181, 'gmcgaugiee', '558-355-9687', 'ggilvarye@rediff.com', '36987-1735');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (16, 'Hedvig', 25184984202, 'hwytchardf', '568-280-1644', 'hmemmoryf@comcast.net', '0597-0087');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (17, 'Monah', 6886443171, 'mshovelbottomg', '652-588-2544', 'mnodeng@java.com', '54868-4021');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (18, 'Adriane', 65529726853, 'ahummerstonh', '662-209-8767', 'abuddellh@disqus.com', '0603-1008');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (19, 'Dorisa', 8069454641, 'dboci', '457-975-4127', 'dreedmani@newsvine.com', '52125-424');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (20, 'Leilah', 8238276754, 'llowrej', '633-123-5545', 'ldockreyj@apache.org', '64990-385');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (21, 'Romola', 54128587828, 'rluthwoodk', '757-233-1861', 'rstriplingk@bloglovin.com', '36987-1202');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (22, 'Jourdan', 64962105500, 'jbyforthl', '167-938-5828', 'jcolombierl@miitbeian.gov.cn', '49349-468');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (23, 'Jenifer', 86522957990, 'jmichelinm', '727-813-9528', 'jbehningm@army.mil', '49884-661');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (24, 'Maye', 4603538872, 'mmaithn', '466-470-8503', 'mmasselinn@simplemachines.org', '36987-2826');
insert into cliente (id_cliente, nome, cpf, usuário, telefone, gmail, table1_cep) values (25, 'Romy', 30033080808, 'rstotherfieldo', '873-640-9503', 'rcuttingso@squidoo.com', '37205-833');

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

insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (25837, 'Lindy', 22726014571, 13410553435, 723164, 'atendente', 26585150);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (21403, 'Jarret', 48791425360, 35980146935, 872439, 'controle de qualidade', 36095615);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (66805, 'Catrina', 80075228935, 19591078528, 34577, 'assistente financeiro', 43952416);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (12162, 'Karola', 15101050114, 77896118040, 60396, 'financeiro', 14511259);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (53884, 'Marsiella', 34307250676, 90680934226, 266864, 'anunciante', 3128314);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (3506, 'Bertha', 12463955569, 90116297387, 848844, 'limpador', 57427127);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (62286, 'Ferguson', 58930365379, 46109461366, 752010, 'atendente', 79994788);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (32700, 'Natka', 89531149986, 35610619177, 904351, 'abastecedor', 70447519);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (35722, 'Klarrisa', 9836497788, 91137859023, 366295, 'vendedor', 83800653);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (86322, 'Lari', 9877551095, 63845844974, 916615, 'empresario', 15743572);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (64190, 'Grace', 23309499408, 67234740452, 514410, 'mecanico', 62916261);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (14218, 'Aila', 505005408, 81714544142, 254192, 'sócio proprietario', 98150887);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (52267, 'Cyrille', 23547659105, 71090598457, 228762, 'coordernador', 99968732);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (95923, 'Marcile', 13348431197, 53528462624, 628954, 'Editor', 65937121);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (10898, 'Siegfried', 3552317540, 55399779452, 994769, 'Administrator', 29588060);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (3757, 'Pete', 12343440841, 77806073273, 182210, 'vendedor', 75672059);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (69152, 'Georgia', 39684215524, 5922694783, 808915, 'aprendiz de vendas', 40671665);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (46386, 'Berkley', 23432922723, 12278096315, 37000, 'Marketing', 91645844);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (63641, 'Stefano', 80946074838, 83454126209, 288747, 'mecanico', 3104288);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (40421, 'Meredithe', 33494134391, 84019606741, 461362, 'financiador', 99522093);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (49478, 'Zachary', 19495325321, 80874368814, 63220, 'gerente', 47559826);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (8403, 'Hanna', 50105009335, 36324574674, 768937, 'dono', 67687782);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (52362, 'Betti', 51034921685, 59913892801, 659172, 'atendente', 11668950);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (33799, 'Ashbey', 98288857125, 79896897818, 66949, 'limpador', 78651254);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderercos_cep) values (69111, 'Nani', 89697889863, 71680589359, 367649, 'vendedor', 93222148);

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

select * from veiculos;
