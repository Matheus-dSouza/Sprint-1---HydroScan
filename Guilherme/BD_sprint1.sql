create database HydroScan;

use HydroScan;

create table empresa
(
cnpj           bigint primary key,
nome           varchar(50) not null,
endereco       varchar(120) not null,
telefone       varchar(15) not null,
email          varchar(100) not null,
constraint ck_empresaEmail check (email like ('%@%')),
unique ix_empresaEmail(email),
key ix_empresaNome(nome)
);

create table aguaMedicao
(
idMedicao      bigint primary key auto_increment,
nivelAguaAtual int not null,
dtUpdate       datetime not null default current_timestamp(),
fkEmpresa      bigint not null,
constraint fk_aguaMedicao_empresa foreign key(fkEmpresa) references empresa(cnpj),
key ix_dataUpdate(dtUpdate)
);

create table funcionario
(
idfuncionario  bigint primary key auto_increment,
cpf            varchar(12) not null,
nome           varchar(50) not null,
email  		   varchar(100) not null,
senha          varchar(20) not null,
fkEmpresa      bigint not null,
constraint fk_funcionario_empresa foreign key(fkEmpresa) references empresa(cnpj),
constraint ck_funcionarioEmail check (email like ('%@%')),
unique ix_funcionarioCpf(cpf),
unique ix_funcionarioEmail(email),
unique ix_funcionarioSenha(senha),
key ix_funcionario_empresa(fkEmpresa)
);

create table usina
(
idUsina        bigint primary key auto_increment,
nome           varchar(50) not null,
localizacao    varchar(120) not null,
volumeMax      int not null,
potenciaMax    int not null,
fkMedicao	   bigint not null,
fkEmpresa      bigint not null,
constraint fk_usina_empresa foreign key(fkEmpresa) references empresa(cnpj),
constraint fk_usina_medicao foreign key(fkMedicao) references aguaMedicao(idMedicao),
key ix_usina_empresa(fkEmpresa)
);

insert into empresa (cnpj, nome, endereco, telefone, email) 
values 
(12345678000124, 'Eletrobras', 'Rio de Janeiro, RJ', '(11) 1234-5678', 'Eletrobras@empresaa.com'),
(98765432000198, 'Itaipu Binacional', 'Foz do Iguaçu, PR', '(21) 8765-4321', 'Itaipu@empresab.com'),
(11223344000110, 'Engie Brasil Energia', 'Florianópolis, SC', '(31) 9876-5432', 'Engie@empresac.com'),
(55667788000155, 'Copel', 'Curitiba, PR', '(41) 2345-6789', 'Copel@empresad.com'),
(99887766000199, 'Cemig', 'Belo Horizonte, MG', '(51) 3456-7890', 'Cemig@empresae.com');

insert into aguaMedicao (nivelAguaAtual, dtUpdate, fkEmpresa)
values 
(50, '2025-03-14 10:00:00', 12345678000124),
(75, '2025-03-14 10:05:00', 98765432000198),
(60, '2025-03-14 10:10:00', 11223344000110),
(80, '2025-03-14 10:15:00', 55667788000155),
(45, '2025-03-14 10:20:00', 99887766000199);

insert into funcionario (cpf, nome, email, senha, fkEmpresa)
values 
('12345678901', 'joão silva', 'joao.silva@empresaa.com', 'senha123', 12345678000123),
('23456789012', 'maria oliveira', 'maria.oliveira@empresab.com', 'senha456', 98765432000198),
('34567890123', 'carlos souza', 'carlos.souza@empresac.com', 'senha789', 11223344000110),
('45678901234', 'ana costa', 'ana.costa@empresad.com', 'senha101', 55667788000155),
('56789012345', 'ricardo almeida', 'ricardo.almeida@empresae.com', 'senha202', 11223344000110);

insert into usina (nome, localizacao, volumeMax, potenciaMax, fkMedicao, fkEmpresa)
values 
('Usina Hidrelétrica de Belo Monte', 'Altamira, Pará', 1000, 500, 1, 12345678000123),
('Usina Hidrelétrica de Itaipu', 'Foz do Iguaçu, Paraná', 2000, 600, 2, 98765432000198),
('Usina Hidrelétrica de São Simão', 'São Simão, Goiás', 1500, 550, 3, 11223344000110),
('Usina Hidrelétrica de Segredo', 'Telêmaco Borba, Paraná', 1800, 650, 4, 55667788000155),
('Usina Hidrelétrica de Furnas', 'Furnas, Minas Gerais', 1200, 700, 5, 99887766000199);
