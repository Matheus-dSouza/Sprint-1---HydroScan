create database HydroScan;
use HydroScan;

create table Empresa (
    CNPJ				bigint not null,
    nome				varchar(60),
	primary key 		(CNPJ)
);

create table Usuario (
    fk_CNPJ				bigint not null,
    nome				varchar(60),
    email				varchar(60),
    senha				varchar(20),
    CPF 				bigint not null,
    primary key 			(CPF),
    constraint				fk_CNPJ_Usuario foreign key (fk_CNPJ) references Empresa(CNPJ)
);

create table Represa (
    idRepresa				int not null auto_increment,
    nivelAgua				int not null,
    volume				int not null,
    dataHora				datetime,
    fk_CNPJ				bigint not null,
    primary key				(idRepresa),
    constraint 				fk_CNPJ_Represa foreign key (fk_CNPJ) references Empresa(CNPJ)
);

insert into Empresa (CNPJ, nome)
values				(12345678000190, 'Empresa A'),
					(23456789000101, 'Empresa B'),
                    (34567890000212, 'Empresa C'),
                    (45678901000123, 'Empresa D'),
                    (45678901000223, 'Empresa E');
                    
insert into Usuario (CPF, nome, email, senha, fk_CNPJ)
values				(12345678901, 'Carlos Maria', 'carlos.maria@gmail.com', 'abcdef123', 12345678000190),
					(23456789012, 'José Félix', 'jose.felix@gmail.com', 'bcdefg456', 23456789000101),
                    (34567890123, 'João Pedro', 'joao.pedro@gmail.com', 'cdefgh789', 34567890000212),
                    (45678901234, 'Júlia Matos', 'julia.matos@gmail.com', 'defghi012', 45678901000123),
                    (56789012345, 'Fernanda Torres', 'fernanda.torres@gmail.com', 'efghij345', 45678901000223),
                    (67890123456, 'Marcos Felipe', 'marcos.felipe@gmail.com', 'fghijk678', 45678901000223);
                    
insert into Represa (nivelAgua, volume, dataHora, fk_CNPJ)
values				(200, 1000, '2024-01-01 12:00:00', 12345678000190),
					(400, 3000, '2024-02-03 12:00:00', 23456789000101),
                    (350, 5000, '2024-02-03 13:45:00', 34567890000212),
					(250, 7000, '2024-03-24 21:15:00', 45678901000123),
                    (300, 9000, '2024-04-09 03:30:00', 45678901000223);

select * from Empresa;
select * from Usuario;
select * from Represa;

select * from Empresa where CNPJ like '%0001__';
select * from Empresa where CNPJ like '%0002__';

select * from Usuario where CPF like '456%';
select * from Usuario where nome like 'J%';

select * from Represa where nivelAgua > 300;
select * from Represa where dataHora like '2024-02-03 %';
select * from Represa where dataHora like '% 12:00:00';
