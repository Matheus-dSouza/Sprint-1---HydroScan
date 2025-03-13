create database HydroscanSprint01;

use HydroscanSprint01;


create table empresa(
CNPJ 					CHAR(18) not null primary key,
nomeEmpresa 			VARCHAR(60), 
telefoneEmpresa			VARCHAR(8),
sedeEmpresa 			VARCHAR(120),
emailEmpresa    		VARCHAR(100),
representanteEmpresa    VARCHAR(60),
constraint chk_emailEmpresa check (emailEmpresa in('%@%')),
key ix_nomeEmpresa  (nomeEmpresa),
key ix_emailEmpresa (emailEmpresa),
key ix_representanteEmpresa (representanteEmpresa)
);

create table usuario (
CPF 				CHAR(14) not null primary key,
nomeUsuario 		VARCHAR(60),
emailUsuario 		VARCHAR(120),
senhaUsuario		VARCHAR(30),
CNPJ_empresa 		CHAR(18) not null,
constraint fk_CNPJ_empresa foreign key (CNPJ_empresa) references empresa(CNPJ),
constraint chk_emailUsuario check (emailUsuario in('%@%')),
constraint chk_senhaUsuario check (senhaUsuario in('%1%','%2%','%3%','%4%','%5%','%6%','%7%','%8%','%9%','%0%')),
unique ix_nomeUsuario (nomeUsuario),
unique ix_emailUsuario (emailUsuario),
key ix_senhaUsuario (senhaUsuario)
);


create table represa(
id int not null primary key,
CNPJ_represa CHAR(18) not null,
nivelMaximo  int not null,
nivelMinimo  int not null,
nivelAtual   int not null,
constraint fk_CNPJ_represa foreign key (CNPJ_represa) references empresa(CNPJ),
constraint fk_nivelAtual foreign key (nivelMinimo) references monitoramento(monitoramento_nivelAtual), 
unique ix_nivelMaximo(nivelMaximo),
unique ix_nivelMinimo(nivelMinimo)
);

create table monitoramento(
dt_monitoramento				date primary key,
monitoramento_nivelAtual 		int not null,
dt_hora_registro            	datetime default current_timestamp(),
key ix_monitoramento_nivelAtual(monitoramento_nivelAtual),
key ix_dt_monitoramento(dt_monitoramento),
key ix_dt_hora_registro(dt_hora_registro)
);




