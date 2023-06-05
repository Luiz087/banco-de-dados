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
  `id_fornecedor` BIGINT NOT NULL auto_increment,
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
  `id_cliente` BIGINT NOT NULL auto_increment,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` BIGINT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `telefone` BIGINT NOT NULL,
  `gmail` VARCHAR(45) NOT NULL,
  `table1_cep` BIGINT NOT NULL,
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
  `veiculos_id_veiculo` BIGINT NOT NULL auto_increment,
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

insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Robyn', 18956452766, 'rtitherington0', 4657299931, 'rfandrey0@wisc.edu', 98860771);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Celestyna', 91331353668, 'ccrosfeld1', 9971740985, 'chagland1@illinois.edu', 26360149);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Rafa', 67744441278, 'rgrenshiels2', 4319182549, 'rrobberecht2@unesco.org', 24971323);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Charin', 96494156688, 'csheen3', 8169258044, 'cyegorovnin3@marketwatch.com', 32813459);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Lynda', 34788559069, 'lduff4', 9945226425, 'lneno4@harvard.edu', 33395580);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('James', 22709649232, 'jarchibold5', 9476807421, 'jfarran5@aboutads.info', 66575921);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Jacques', 87889630908, 'jboeter6', 4331319037, 'jpixton6@vkontakte.ru', 18853418);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Hazlett', 482024287, 'holohan7', 9697684928, 'hdeye7@fastcompany.com', 77727522);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Cyndie', 72304745218, 'cbraams8', 4133377466, 'cnyland8@yelp.com', 53015239);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Douglas', 45911620590, 'dfozard9', 1532862367, 'draddan9@google.es', 90807252);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Eustacia', 31545224611, 'epymera', 4103170962, 'eduligala@smh.com.au', 83300006);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Julee', 13125889119, 'jadamssonb', 1056747069, 'jridulfob@facebook.com', 6131187);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Truman', 46899517, 'tgerardetc', 6461550127, 'tbeevensc@netscape.com', 72792903);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Matthiew', 96685581525, 'medgesond', 9823514339, 'mdranced@ocn.ne.jp', 90000298);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Shurlocke', 69654608887, 'smacmanuse', 4206531275, 'selwille@dailymotion.com', 41222385);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Welsh', 72963837431, 'wdeehanf', 1081253378, 'wlangloisf@vkontakte.ru', 71727947);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Wilow', 57188333261, 'wlittong', 8556876778, 'wgoalbyg@gov.uk', 8599487);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Loralyn', 78970686787, 'lmarcosh', 2259586348, 'lkaneh@zimbio.com', 98012944);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Wat', 32943852831, 'wleecei', 6242771387, 'wfilimorei@omniture.com', 37621074);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Sydney', 92443427080, 'sortsj', 5734164916, 'sdustingj@list-manage.com', 96883597);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Andonis', 54306584432, 'akyteleyk', 6033352196, 'aliddyardk@chron.com', 57268243);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Kris', 69828689652, 'kguiotl', 558945865, 'kolekl@issuu.com', 95428790);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Layne', 25924043154, 'lmctrustamm', 9456849032, 'lspittlesm@stumbleupon.com', 11255228);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Eleanor', 21929322727, 'eiacovinin', 1381196750, 'elovickn@cbsnews.com', 21911141);
insert into clientes (nome, cpf, usuario, telefone, gmail, table1_cep) values ('Briny', 83011432641, 'bcrickmooro', 5402217159, 'bferrierioo@europa.eu', 5445448);

insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Kristofor', 'Apt 1796', 53217593721871, 5636417237, 'Jabberstorm', 98860771);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Marrilee', '8th Floor', 78269610408621, 3784328039, 'Jabberstorm', 26360149);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Mag', 'Suite 64', 83280557412092, 8125576004, 'Tanoodle', 24971323);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Almire', 'PO Box 9643', 74390089876469, 6116345912, 'Fatz', 32813459);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Deedee', 'Room 42', 32852831345065, 8161722760, 'Twimm', 33395580);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Billie', 'PO Box 96465', 96351611588770, 7744863586, 'Zoomlounge', 66575921);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Minny', '4th Floor', 72377443654307, 3512203764, 'Jaxnation', 18853418);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Melinda', '4th Floor', 76062709614653, 9555072911, 'Eazzy', 77727522);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Benedikta', '9th Floor', 90187484363241, 8638928930, 'Kwimbee', 53015239);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Myra', 'PO Box 79123', 89911952851122, 6932423640, 'Dabjam', 90807252);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Catlaina', 'PO Box 89699', 98650769044682, 6685031243, 'Gabtune', 83300006);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Peggie', 'Room 1150', 33299526629846, 1194827427, 'Ntag', 6131187);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Dedra', 'Room 1512', 11387936755749, 5239009837, 'Eidel', 72792903);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Sarette', 'PO Box 31637', 88663418924071, 6732888702, 'Livepath', 90000298);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Deanne', 'Suite 10', 45166963392729, 6841988947, 'Riffwire', 41222385);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Merill', '5th Floor', 30123472017368, 6368080537, 'Quaxo', 71727947);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Orbadiah', 'Apt 1924', 8849905555117, 4474275724, 'Yombu', 8599487);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Wolfgang', 'PO Box 49458', 28273531692793, 4141608193, 'Brainbox', 98012944);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Sanderson', 'PO Box 93358', 33218317298271, 6361220266, 'Ailane', 37621074);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Sula', 'Apt 1679', 87503816182502, 7623216188, 'Thoughtworks', 96883597);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Vaughn', 'Apt 488', 71754551268602, 8324792894, 'Chatterpoint', 57268243);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Massimo', 'Room 687', 81175078723725, 8591088193, 'Feedmix', 95428790);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Hubert', '16th Floor', 94092745482858, 4314329449, 'Demivee', 11255228);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Blisse', 'Suite 23', 90414339055026, 6405793349, 'Youfeed', 21911141);
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Barron', 'Apt 375', 40384711421368, 6445590003, 'Blogspan', 5445448);

insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Cadillac', 'Escalade ESV', 93, 65, false, false, true, false, 2007, 'Orange', true, 617175, 1);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Volkswagen', 'Touareg', 37, 61, false, false, false, true, 2008, 'Mauv', true, 15930, 2);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Lincoln', 'Navigator', 82, 36, true, false, true, false, 2011, 'Mauv', true, 781195, 3);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Chevrolet', 'Corvair 500', 37, 9, true, true, true, true, 1963, 'Blue', false, 697034, 4);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Lincoln', 'Navigator', 85, 37, false, false, true, false, 2011, 'Puce', false, 958820, 5);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Ford', 'Fusion', 12, 35, true, false, false, true, 2009, 'Blue', true, 929550, 6);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Mazda', 'MX-3', 82, 15, false, true, true, false, 1992, 'Aquamarine', true, 136048, 7);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Ford', 'Edge', 48, 24, false, false, false, false, 2012, 'Goldenrod', false, 759029, 8);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('GMC', 'Sierra 1500', 26, 40, false, false, false, false, 2007, 'Blue', true, 718194, 9);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Dodge', 'D150', 51, 30, false, false, false, true, 1993, 'Blue', true, 774026, 10);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Mercedes-Benz', 'S-Class', 40, 7, true, true, false, false, 2005, 'Goldenrod', false, 907369, 11);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Chevrolet', 'Corsica', 61, 99, false, true, false, true, 1994, 'Yellow', true, 443048, 12);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Ford', 'LTD', 90, 35, false, false, false, false, 1985, 'Blue', false, 676606, 13);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Buick', 'LeSabre', 3, 86, false, false, true, false, 1997, 'Pink', false, 652142, 14);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Honda', 'Odyssey', 7, 53, false, false, false, true, 2006, 'Teal', true, 383120, 15);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Volkswagen', 'riolet', 33, 53, false, true, true, true, 1992, 'Yellow', false, 347595, 16);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Mercury', 'Capri', 46, 80, false, true, true, false, 1991, 'Fuscia', false, 456100, 17);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Dodge', 'Viper RT/10', 79, 86, true, true, false, true, 1995, 'Goldenrod', true, 766662, 18);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Chevrolet', 'Malibu Maxx', 73, 71, false, false, false, false, 2006, 'Turquoise', true, 759542, 19);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Hummer', 'H3', 12, 87, true, true, false, true, 2007, 'Purple', true, 210553, 20);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Hyundai', 'XG350', 15, 36, true, true, true, false, 2003, 'Orange', false, 909273, 21);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Chrysler', '300', 57, 88, false, true, true, false, 1999, 'Turquoise', true, 231672, 22);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Mitsubishi', 'Galant', 77, 59, true, false, false, false, 1993, 'Fuscia', true, 762517, 23);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Mercury', 'Grand Marquis', 1, 23, false, true, true, true, 2002, 'Mauv', false, 518766, 24);
insert into veiculos (marca, modelo, potencia, quilometragem, novos, eletrico, esportivo, picape, ano, cor, abs, preco, fornecedor_id_fornecedor) values ('Plymouth', 'Colt Vista', 34, 85, true, false, false, false, 1994, 'Indigo', true, 583661, 25);

insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (25837, 'Lindy', 22726014571, 13410553435, 723164, 'atendente', 26585150);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (21403, 'Jarret', 48791425360, 35980146935, 872439, 'controle de qualidade', 36095615);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (66805, 'Catrina', 80075228935, 19591078528, 34577, 'assistente financeiro', 43952416);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (12162, 'Karola', 15101050114, 77896118040, 60396, 'financeiro', 14511259);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (53884, 'Marsiella', 34307250676, 90680934226, 266864, 'anunciante', 3128314);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (3506, 'Bertha', 12463955569, 90116297387, 848844, 'limpador', 57427127);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (62286, 'Ferguson', 58930365379, 46109461366, 752010, 'atendente', 79994788);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (32700, 'Natka', 89531149986, 35610619177, 904351, 'abastecedor', 70447519);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (35722, 'Klarrisa', 9836497788, 91137859023, 366295, 'vendedor', 83800653);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (86322, 'Lari', 9877551095, 63845844974, 916615, 'empresario', 15743572);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (64190, 'Grace', 23309499408, 67234740452, 514410, 'mecanico', 62916261);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (14218, 'Aila', 505005408, 81714544142, 254192, 'sócio proprietario', 98150887);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (52267, 'Cyrille', 23547659105, 71090598457, 228762, 'coordernador', 99968732);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (95923, 'Marcile', 13348431197, 53528462624, 628954, 'Editor', 65937121);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (10898, 'Siegfried', 3552317540, 55399779452, 994769, 'Administrator', 29588060);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (3757, 'Pete', 12343440841, 77806073273, 182210, 'vendedor', 75672059);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (69152, 'Georgia', 39684215524, 5922694783, 808915, 'aprendiz de vendas', 40671665);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (46386, 'Berkley', 23432922723, 12278096315, 37000, 'Marketing', 91645844);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (63641, 'Stefano', 80946074838, 83454126209, 288747, 'mecanico', 3104288);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (40421, 'Meredithe', 33494134391, 84019606741, 461362, 'financiador', 99522093);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (49478, 'Zachary', 19495325321, 80874368814, 63220, 'gerente', 47559826);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (8403, 'Hanna', 50105009335, 36324574674, 768937, 'dono', 67687782);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (52362, 'Betti', 51034921685, 59913892801, 659172, 'atendente', 11668950);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (33799, 'Ashbey', 98288857125, 79896897818, 66949, 'limpador', 78651254);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values (69111, 'Nani', 89697889863, 71680589359, 367649, 'vendedor', 93222148);

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
