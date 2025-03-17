create database HydroScan;

use HydroScan;

create table empresa
(
cnpj           int primary key,
nome           varchar(50) not null,
endereco       varchar(120) not null,
telefone       varchar(15) not null,
email          varchar(100) not null,
constraint ck_empresa check (email in('%@%')),
unique ix_empresaEmail (email)
);

create table usuario
(
idUsuario      int primary key,
cpf            varchar(12) not null,
nome           varchar(50) not null,
email  		   varchar(100) not null,
senha          varchar(20) not null,
fkEmpresa      int not null,
constraint fk_usuario_empresa foreign key(fkEmpresa) references empresa(cnpj)
);

create table usina
(
idUsina        int primary key,
nome           varchar(50) not null,
localizacao    varchar(120) not null,
volumeMax      int not null,
potenciaMax    int not null,
fkMedicao	   int not null,
fkEmpresa      int not null,
constraint fk_usina_empresa foreign key(fkEmpresa) references empresa(cnpj),
constraint fk_usina_medicao foreign key(fkMedicao) references aguaMedicao(idMedicao)
);

create table aguaMedicao
(
idMedicao      int primary key,
nivelAguaAtual int not null,
ultimoUpdate   datetime default current_timestamp()
);