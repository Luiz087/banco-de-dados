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
  ON DELETE CASCADE
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
  ON DELETE CASCADE
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
  ON DELETE CASCADE
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
  ON DELETE CASCADE
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
  CONSTRAINT `fk_carros_has_clientes_carros1` FOREIGN KEY (`veiculos_id_veiculo`) REFERENCES `veiculos` (`id_veiculo`) ON DELETE CASCADE,
  CONSTRAINT `fk_carros_has_clientes_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE,
  CONSTRAINT `fk_vendidos_funcionarios1` FOREIGN KEY (`funcionarios_matricula`) REFERENCES `funcionarios` (`matricula`)
  ON DELETE CASCADE
);

insert into enderecos (cep, rua, bairro, cidade, estado) values (98860771, 'Park Meadow', 'barracão', 'Newport News', 'Virginia');
insert into enderecos (cep, rua, bairro, cidade, estado) values (26360149, 'Beilfuss', 'gaparinho', 'Tyler', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (24971323, 'Stoughton', 'figueira', 'Norfolk', 'Virginia');
insert into enderecos (cep, rua, bairro, cidade, estado) values (32813459, 'Pennsylvania', 'agua negras', 'Lawrenceville', 'Georgia');
insert into enderecos (cep, rua, bairro, cidade, estado) values (33395580, 'Meadow Ridge', 'coloninha', 'Dallas', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (66575921, 'Loomis', 'bela vista', 'Dallas', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (18853418, 'Forster', 'figuira', 'Amarillo', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (77727522, 'Merchant', 'sete de setembro', 'Louisville', 'Kentucky');
insert into enderecos (cep, rua, bairro, cidade, estado) values (53015239, 'Bluejay', 'santa terezinha', 'Carlsbad', 'California');
insert into enderecos (cep, rua, bairro, cidade, estado) values (90807252, 'Little Fleur', 'óleo grande', 'Lubbock', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (83300006, 'Sloan', 'pocinho', 'Washington', 'District of Columbia');
insert into enderecos (cep, rua, bairro, cidade, estado) values (6131187, 'Oriole', 'aguas negras', 'Plano', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (72792903, 'Colorado', 'bela vista', 'Houston', 'Texas');
insert into enderecos (cep, rua, bairro, cidade, estado) values (90000298, 'Debra', 'figueira', 'Maple Plain', 'Minnesota');
insert into enderecos (cep, rua, bairro, cidade, estado) values (41222385, 'Manley', 'lagoa', 'Miami', 'Florida');
insert into enderecos (cep, rua, bairro, cidade, estado) values (71727947, 'Northwestern', 'gaspar grande', 'Fort Wayne', 'Indiana');
insert into enderecos (cep, rua, bairro, cidade, estado) values (8599487, 'Blackbird', 'gaspar mirim', 'Rochester', 'New York');
insert into enderecos (cep, rua, bairro, cidade, estado) values (98012944, 'Lakewood', 'gasparinho', 'Denver', 'Colorado');
insert into enderecos (cep, rua, bairro, cidade, estado) values (37621074, 'Golf', 'sertão verde', 'Meridian', 'Mississippi');
insert into enderecos (cep, rua, bairro, cidade, estado) values (96883597, 'Village', 'macuco', 'Buffalo', 'New York');
insert into enderecos (cep, rua, bairro, cidade, estado) values (57268243, 'Redwing', 'barracão', 'Baltimore', 'Maryland');
insert into enderecos (cep, rua, bairro, cidade, estado) values (95428790, 'Derek', 'farropa', 'Las Vegas', 'Nevada');
insert into enderecos (cep, rua, bairro, cidade, estado) values (11255228, 'Sheridan', 'sete de setembro', 'New York City', 'New York');
insert into enderecos (cep, rua, bairro, cidade, estado) values (21911141, 'Karstens', 'belchior', 'Roanoke', 'Virginia');
insert into enderecos (cep, rua, bairro, cidade, estado) values (5445448, 'Columbus', 'santa terezinha', 'Lake Charles', 'Louisiana');

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
insert into fornecedores (nome, endereco, cnpj, telefone, empresa, endereco_cep) values ('Myra', 'PO Box 79123', 89911952851122, 6932423640, 'Dabjam', 53015239);
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

insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Lindy', 22726014571, 13410553435, 723164, 'atendente', 98860771);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Jarret', 48791425360, 35980146935, 872439, 'controle de qualidade', 26360149);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Catrina', 80075228935, 19591078528, 34577, 'assistente financeiro', 24971323);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Karola', 15101050114, 77896118040, 60396, 'financeiro', 32813459);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Marsiella', 34307250676, 90680934226, 266864, 'anunciante', 33395580);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Bertha', 12463955569, 90116297387, 848844, 'limpador', 66575921);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Ferguson', 58930365379, 46109461366, 752010, 'atendente', 33395580);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Natka', 89531149986, 35610619177, 904351, 'abastecedor', 32813459);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Klarrisa', 9836497788	, 91137859023, 366295, 'vendedor', 66575921);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Lari', 9877551095, 63845844974, 916615, 'empresario', 24971323);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Grace', 23309499408, 67234740452, 514410, 'mecanico', 26360149);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Aila', 505005408, 81714544142, 254192, 'sócio proprietario', 98860771);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Cyrille', 23547659105, 71090598457, 228762, 'coordernador', 66575921);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Marcile', 13348431197, 53528462624, 628954, 'Editor', 24971323);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Siegfried', 3552317540, 55399779452, 994769, 'Administrator', 26360149);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Pete', 12343440841, 77806073273, 182210, 'vendedor', 32813459);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Georgia', 39684215524, 5922694783, 808915, 'aprendiz de vendas', 24971323);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Berkley', 23432922723, 12278096315, 37000, 'Marketing', 66575921);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Stefano', 80946074838, 83454126209, 288747, 'mecanico', 66575921);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Meredithe', 33494134391, 84019606741, 461362, 'financiador', 33395580);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Zachary', 19495325321, 80874368814, 63220, 'gerente', 98860771);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Hanna', 50105009335, 36324574674, 768937, 'dono', 32813459);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Betti', 51034921685, 59913892801, 659172, 'atendente', 24971323);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Ashbey', 98288857125, 79896897818, 66949, 'limpador', 66575921);
insert into funcionarios (nome, cpf, contato, salario, funcao, enderecos_cep) values ('Nani', 89697889863, 71680589359, 367649, 'vendedor', 98860771);

insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Adelheid', 68704944920, 'SedVestibulum.ppt', false, 'Silhouette',1,1,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Vasily', 52884361363, 'EtTempus.xls', true, 'S10',2,2,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Herold', 7823368975, 'BlanditNon.tiff', false, 'Navigator',3,3,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Bengt', 49315960949, 'VelAugue.gif', false, 'VehiCROSS',4,4,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Lionello', 28282848725, 'Suspendisse.ppt', true, 'Expedition',5,5,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Ianthe', 96792793746, 'Nec.pdf', false, 'Suburban 1500',6,6,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Riane', 17360308262, 'Molestie.jpeg', true, 'E-Class',7,7,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Lyell', 9639596492, 'Luctus.mp3', true, 'Optima',8,8,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Alix', 23754333721, 'Ac.mov', true, 'Camaro',9,9,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Magdalene', 83304029884, 'LiberoRutrumAc.gif', true, 'Solara',10,10,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Darwin', 82630920672, 'OrciEgetOrci.xls', false, 'RAV4',11,11,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Jerry', 44004039565, 'UltricesErat.txt', false, 'Solara',12,12,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Clea', 89182525968, 'PedeJusto.gif', true, 'V70',13,13,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Robinia', 11987259151, 'Mauris.tiff', true, 'Beretta',14,14,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Rabbi', 49716363623, 'RisusSemperPorta.ppt', true, 'Cabriolet',15,15,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Karisa', 17698270604, 'IntegerAliquet.xls', true, 'XL-7',16,16,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Mikaela', 22032283259, 'ArcuAdipiscingMolestie.xls', false, 'Escalade EXT',17,17,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Alvis', 50868545150, 'OrciVehiculaCondimentum.xls', false, 'Silverado 3500',18,18,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Ertha', 35386100041, 'CongueDiam.mp3', false, 'MDX',19,19,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Conrade', 28482723167, 'Phasellus.xls', false, 'Horizon',20,20,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Dion', 81491983259, 'DiamNeque.tiff', true, 'Toronado',21,21,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Jacob', 19431254984, 'CuraeNullaDapibus.mp3', true, 'B-Series',22,22,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Melva', 37264335722, 'OdioOdioElementum.mp3', true, 'Defender 110',23,23,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('Hildagard', 90710219622, 'Nunc.txt', true, 'NV2500',24,24,'Picape');
insert into vendidos (nome, cpf, usuario, ipva_pago, modelo,clientes_id_cliente,funcionarios_matricula,tipo_veiculo) values ('vhbjdfhg', 90710219623, 'Nunc.txt', true, 'NV2500',25,25,'Picape');

SELECT COUNT(*) FROM enderecos;
SELECT COUNT(*) FROM clientes;
SELECT COUNT(*) FROM fornecedores;
SELECT COUNT(*) FROM veiculos;
SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM vendidos;

SELECT * FROM enderecos order by cep;
SELECT * FROM clientes order by id_cliente;
SELECT * FROM fornecedores order by id_fornecedor;
SELECT * FROM veiculos order by id_veiculo;
SELECT * FROM funcionarios order by matricula;
SELECT * FROM vendidos order by veiculos_id_veiculo;

SELECT veiculos.modelo,
    veiculos.novos,
    veiculos.eletrico,
    veiculos.esportivo,
    veiculos.picape,
    veiculos.ano,
    veiculos.cor,
    veiculos.marca,
    veiculos.preco,
    veiculos.quilometragem,
    veiculos.potencia,
    veiculos.abs,
    veiculos.fornecedor_id_fornecedor,
    clientes.nome, 
    clientes.cpf,
    clientes.usuario,
    clientes.telefone,
    clientes.gmail,
    clientes.table1_cep,
    funcionarios.nome,
    funcionarios.cpf,
    funcionarios.contato,
    funcionarios.salario,
    funcionarios.funcao,
    funcionarios.enderecos_cep
    FROM vendidos
INNER JOIN funcionarios ON vendidos.funcionarios_matricula = funcionarios.matricula
INNER JOIN veiculos ON vendidos.veiculos_id_veiculo = veiculos.id_veiculo
INNER JOIN clientes ON vendidos.clientes_id_cliente = clientes.id_cliente;

UPDATE enderecos SET rua ="Rua dos bobos",bairro="Velha",cidade="Jaragua",estado="SC" WHERE cep = 98860771;
UPDATE enderecos SET rua ="Blumenau",bairro="Velha",cidade="Blumenau",estado="SC" WHERE cep = 26360149;
UPDATE enderecos SET rua ="Arthur Gieseler",bairro="Nova",cidade="Joinville",estado="SC" WHERE cep = 26360149;
UPDATE enderecos SET rua ="XV",bairro="Centro",cidade="Presidente Getulio",estado="SC" WHERE cep = 32813459;
UPDATE enderecos SET rua ="Rua 7",bairro="Conconhas",cidade="Florianopolis",estado="SC" WHERE cep = 33395580;
UPDATE enderecos SET rua ="Getulio Branco",bairro="Vila Nova",cidade="São Bento do Sul",estado="SC" WHERE cep = 18853418;
UPDATE enderecos SET rua ="Bela Mur",bairro="Bela Vista",cidade="Gaspar",estado="SC" WHERE cep = 66575921;
UPDATE enderecos SET rua ="7 de Novembro",bairro="Velha Nova",cidade="Blumenau",estado="SC" WHERE cep = 77727522;
UPDATE enderecos SET rua ="Rua Steves",bairro="Ponta Aguda",cidade="Springfield",estado="Texas" WHERE cep = 53015239;
UPDATE enderecos SET rua ="Rua Joinville",bairro="Passo Manso",cidade="Blumenau",estado="SC" WHERE cep = 90807252;

UPDATE fornecedores SET nome = "ASTOLFO", endereco="Apt 3543",cnpj=5646765373, telefone= 25254564364, empresa= "slefd", endereco_cep=98860771 WHERE id_fornecedor= 1;
UPDATE fornecedores SET nome = "RODRIGO", endereco="10th flack",cnpj=7583939404, telefone= 46543364653, empresa= "rolú", endereco_cep=26360149 WHERE id_fornecedor= 2;
UPDATE fornecedores SET nome = "LUÍS", endereco="suíte 666",cnpj=9605054839, telefone= 86940285032, empresa= "plasvale", endereco_cep=24971323 WHERE id_fornecedor= 3;
UPDATE fornecedores SET nome = "GABRIEL", endereco="PO BOX 9393",cnpj=0950402819, telefone= 8694031257, empresa= "CIRCULO", endereco_cep=32813459 WHERE id_fornecedor= 4;
UPDATE fornecedores SET nome = "jOÃO", endereco="ROOM 3543",cnpj=8684938289, telefone= 96847302839, empresa= "OTTO", endereco_cep=33395580 WHERE id_fornecedor= 5;
UPDATE fornecedores SET nome = "SABEL", endereco="PO BOX 6547",cnpj=9437439975, telefone= 95837259392, empresa= "TOP", endereco_cep=66575921 WHERE id_fornecedor= 6;
UPDATE fornecedores SET nome = "FERNANDO", endereco="ROOM 5353",cnpj=8963986379, telefone= 05695845944, empresa= "PRECEIRO", endereco_cep=18853418 WHERE id_fornecedor= 7;
UPDATE fornecedores SET nome = "ERIC", endereco="PO BOX 54354",cnpj=5676765735, telefone= 575454745754, empresa= "AVON", endereco_cep=77727522 WHERE id_fornecedor= 8;
UPDATE fornecedores SET nome = "PEDRO", endereco="PO BOX 5435",cnpj=9584930295, telefone= 65858496943, empresa= "OBOTICARIO", endereco_cep=53015239 WHERE id_fornecedor= 9;
UPDATE fornecedores SET nome = "LUCAS", endereco=" BOX 46436",cnpj=5754774567, telefone= 57578474737, empresa= "BARÃO", endereco_cep=53015239 WHERE id_fornecedor= 10;

UPDATE funcionarios SET nome ="Lindy", cpf="51267649003	", contato="95937385512", salario="435345", funcao = 'vendedor', enderecos_cep = 98860771 WHERE matricula = 1;
UPDATE funcionarios SET nome ="Jarret", cpf="73775878068", contato="92935526593", salario="435435", funcao = 'vendedor', enderecos_cep = 98860771 WHERE matricula = 2;
UPDATE funcionarios SET nome ="Arthur", cpf="80662784030", contato="67936405836", salario="123123", funcao = 'vendedor', enderecos_cep = 26360149 WHERE matricula = 3;
UPDATE funcionarios SET nome ="Gieseler", cpf="19870824005", contato="67936405836", salario="43141", funcao = 'atendente', enderecos_cep = 26360149 WHERE matricula = 4;
UPDATE funcionarios SET nome ="Lari", cpf="40007889062", contato="95937385525", salario="768678", funcao = 'atendente', enderecos_cep = 26360149 WHERE matricula = 5;
UPDATE funcionarios SET nome ="Getulio ", cpf="73765807001", contato="92935526500", salario="876867", funcao = 'atendente', enderecos_cep = 26360149 WHERE matricula = 6;
UPDATE funcionarios SET nome ="Lara", cpf="25627834099", contato="67936405823", salario="45654" , funcao = 'aprendiz de vendas', enderecos_cep = 33395580 WHERE matricula = 7;
UPDATE funcionarios SET nome ="Luiz", cpf="04223201026", contato="67936405889", salario="654654", funcao = 'aprendiz de vendas', enderecos_cep = 33395580 WHERE matricula = 8;
UPDATE funcionarios SET nome ="Luis", cpf="36257549086", contato="95937385512", salario="234567", funcao = 'aprendiz de vendas', enderecos_cep = 90807252 WHERE matricula = 9;
UPDATE funcionarios SET nome ="Eric", cpf="54985014044", contato="95937385511", salario="498654", funcao = 'dono', enderecos_cep = 90807252 WHERE matricula = 10;

UPDATE veiculos SET marca = "Ford", modelo = "Ka", potencia = 95, quilometragem = 30000, novos = true, eletrico = true, esportivo = false, picape = true, ano = 2008, cor = "Azul", abs = false, preco = 47000, fornecedor_id_fornecedor = 2 WHERE id_veiculo = 1;
UPDATE veiculos SET marca = "Chevrolet", modelo = "Camaro", potencia = 340, quilometragem = 20000, novos = false, eletrico = false, esportivo = true, picape = false, ano = 2015, cor = "Amarelo", abs = true, preco = 320000, fornecedor_id_fornecedor = 1 WHERE id_veiculo = 2;
UPDATE veiculos SET marca = "Chevrolet", modelo = "Cruize", potencia = 120, quilometragem = 90000, novos = false, eletrico = false, esportivo = false, picape = false, ano = 2016, cor = "Branco", abs = true, preco = 82000, fornecedor_id_fornecedor = 6 WHERE id_veiculo = 3;
UPDATE veiculos SET marca = "Bentley", modelo = "Bentayga", potencia = 450, quilometragem = 0, novos = true, eletrico = false, esportivo = true, picape = false, ano = 2020, cor = "Cinza", abs = true, preco = 750000, fornecedor_id_fornecedor = 8 WHERE id_veiculo = 4;
UPDATE veiculos SET marca = "koenigsegg", modelo = "Agera", potencia = 1176, quilometragem = 10000, novos = false, eletrico = false, esportivo = true, picape = false, ano = 2021, cor = "Vermelho", abs = true, preco = 1200000, fornecedor_id_fornecedor = 10 WHERE id_veiculo = 5;
UPDATE veiculos SET marca = "Bugatti", modelo = "Chiron", potencia = 700, quilometragem = 0, novos = true, eletrico = false, esportivo = true, picape = false, ano = 2017, cor = "Azul", abs = true, preco = 1100000, fornecedor_id_fornecedor = 16 WHERE id_veiculo = 6;
UPDATE veiculos SET marca = "Dodge", modelo = "Ram", potencia = 500, quilometragem = 45000, novos = false, eletrico = false, esportivo = false, picape = true, ano = 2016, cor = "Preto", abs = true, preco = 500000, fornecedor_id_fornecedor = 25 WHERE id_veiculo = 7;
UPDATE veiculos SET marca = "Fiat", modelo = "Uno", potencia = 95, quilometragem = 120000, novos = false, eletrico = false, esportivo = false, picape = false, ano = 2002, cor = "Bordô", abs = false, preco = 25000, fornecedor_id_fornecedor = 24 WHERE id_veiculo = 8;
UPDATE veiculos SET marca = "Nissan", modelo = "Kicks", potencia = 120, quilometragem = 0, novos = true, eletrico = false, esportivo = false, picape = false, ano = 2023, cor = "Branco", abs = true, preco = 95000, fornecedor_id_fornecedor = 23 WHERE id_veiculo = 9;
UPDATE veiculos SET marca = "Hiunday", modelo = "Creta", potencia = 135, quilometragem = 0, novos = true, eletrico = false, esportivo = false, picape = false, ano = 2022, cor = "Cinza", abs = true, preco = 145000, fornecedor_id_fornecedor = 22 WHERE id_veiculo = 10;

UPDATE vendidos SET nome = "Rodrigo", cpf=28716145631, usuario='Eric.o', ipva_pago=false, modelo='Navigator', clientes_id_cliente=1, funcionarios_matricula=1, tipo_veiculo='Picape' WHERE veiculos_id_veiculo =1 ;
UPDATE vendidos SET nome = "Andrei", cpf=16272567685, usuario='luis.g', ipva_pago=true, modelo='Camaro', clientes_id_cliente=2, funcionarios_matricula=2, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 2;
UPDATE vendidos SET nome = "bernardo", cpf=91315765080, usuario='liz.s', ipva_pago=false, modelo='RAV4', clientes_id_cliente=3, funcionarios_matricula=3, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 3;
UPDATE vendidos SET nome = "Gustavo", cpf=55035814157, usuario='joao.g', ipva_pago=true, modelo='RAV4', clientes_id_cliente=4, funcionarios_matricula=4, tipo_veiculo='Picape' WHERE veiculos_id_veiculo =4 ;
UPDATE vendidos SET nome = "Amanda", cpf=03567342266, usuario='liz.z', ipva_pago=true, modelo='Camaro', clientes_id_cliente=5, funcionarios_matricula=5, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 5;
UPDATE vendidos SET nome = "Carlos", cpf=81771519592, usuario='joao.df', ipva_pago=false, modelo='Navigator', clientes_id_cliente=6, funcionarios_matricula=6, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 6;
UPDATE vendidos SET nome = "Erik", cpf=16164101590, usuario='Eric.de', ipva_pago=true, modelo='Camaro', clientes_id_cliente=7, funcionarios_matricula=7, tipo_veiculo='Picape' WHERE veiculos_id_veiculo =7 ;
UPDATE vendidos SET nome = "Anderson", cpf=66119902759, usuario='luis.lo', ipva_pago=false, modelo='RAV4', clientes_id_cliente=8, funcionarios_matricula=8, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 8;
UPDATE vendidos SET nome = "Robson", cpf=90190269766, usuario='Eric.sa', ipva_pago=true, modelo='Camaro', clientes_id_cliente=9, funcionarios_matricula=9, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 9 ;
UPDATE vendidos SET nome = "Welliton", cpf=94642174800, usuario='luiz.s', ipva_pago=false, modelo='Navigator', clientes_id_cliente=10, funcionarios_matricula=10, tipo_veiculo='Picape' WHERE veiculos_id_veiculo = 10;

UPDATE clientes SET nome = "Antônio", cpf = 92704148090, usuario = "toninho", telefone = 2365829356, gmail = "shdbghd@gmail.com" WHERE cep = 98860771;
UPDATE clientes SET nome = "Carlos", cpf = 87655671811, usuario = "carlin", telefone = 876545678, gmail = "uiyrhrg@gmail.com" WHERE cep = 26360149;
UPDATE clientes SET nome = "Carls", cpf = 34254545351, usuario = "clin", telefone = 465365656, gmail = "yrhrg@gmail.com" WHERE cep = 24971323;
UPDATE clientes SET nome = "Cawels", cpf = 34252245551, usuario = "clsin", telefone = 786567654, gmail = "ysadrhrg@gmail.com" WHERE cep = 32813459;
UPDATE clientes SET nome = "Carqwls", cpf = 34253345651, usuario = "clian", telefone = 465365556, gmail = "yrewrhrg@gmail.com" WHERE cep = 33395580;
UPDATE clientes SET nome = "Carlds", cpf = 34254445751, usuario = "clein", telefone = 465366656, gmail = "yqwrhrg@gmail.com" WHERE cep = 66575921;
UPDATE clientes SET nome = "Carlasds", cpf = 34254554551, usuario = "clrin", telefone = 465367756, gmail = "dfhrg@gmail.com" WHERE cep = 18853418;
UPDATE clientes SET nome = "Carlxzcs", cpf = 34254566551, usuario = "cylin", telefone = 465885656, gmail = "yrasdhrg@gmail.com" WHERE cep = 77727522;
UPDATE clientes SET nome = "Carsas", cpf = 34254547751, usuario = "cliin", telefone = 465399656, gmail = "yrahrg@gmail.com" WHERE cep = 53015239;
UPDATE clientes SET nome = "Luis", cpf = 34254545881, usuario = "clkin", telefone = 4653622656, gmail = "yrhxzcrg@gmail.com" WHERE cep = 90807252;

DELETE FROM vendidos WHERE veiculos_id_veiculo = 1;
DELETE FROM vendidos WHERE veiculos_id_veiculo = 2;
DELETE FROM vendidos WHERE veiculos_id_veiculo = 3;
DELETE FROM vendidos WHERE veiculos_id_veiculo = 4;
DELETE FROM vendidos WHERE veiculos_id_veiculo = 5;

DELETE FROM funcionarios WHERE matricula = 1;
DELETE FROM funcionarios WHERE matricula = 2;
DELETE FROM funcionarios WHERE matricula = 3;
DELETE FROM funcionarios WHERE matricula = 4;
DELETE FROM funcionarios WHERE matricula = 5;

DELETE FROM fornecedores WHERE id_fornecedor = 1;
DELETE FROM fornecedores WHERE id_fornecedor = 2;
DELETE FROM fornecedores WHERE id_fornecedor = 3;
DELETE FROM fornecedores WHERE id_fornecedor = 4;
DELETE FROM fornecedores WHERE id_fornecedor = 5;

DELETE FROM veiculos WHERE id_veiculo = 1;
DELETE FROM veiculos WHERE id_veiculo = 2;
DELETE FROM veiculos WHERE id_veiculo = 3;
DELETE FROM veiculos WHERE id_veiculo = 4;
DELETE FROM veiculos WHERE id_veiculo = 5;

DELETE FROM clientes WHERE id_cliente = 3;
DELETE FROM clientes WHERE id_cliente = 8;
DELETE FROM clientes WHERE id_cliente = 13;
DELETE FROM clientes WHERE id_cliente = 14;
DELETE FROM clientes WHERE id_cliente = 15;

DELETE FROM enderecos WHERE cep = 18853418;
DELETE FROM enderecos WHERE cep = 77727522;
DELETE FROM enderecos WHERE cep = 6131187;
DELETE FROM enderecos WHERE cep = 72792903;
DELETE FROM enderecos WHERE cep = 90000298;
