create database hydroscan;
use hydroscan;
create table empresa(
cnpjEmpresa			bigint primary key,
nome				varchar(50)
);

create table usuario(
idUsuario			int primary key auto_increment,
cpf					bigint,
nome				varchar(30),
unique 				ix_cpf(cpf),
fk_empresa 			bigint,
constraint foreign key (fk_empresa) references empresa(cnpjEmpresa)
);

create table represa(
dia				date primary key,
volume			dec(5,2),
fk_empresa		bigint,
foreign key(fk_empresa) references empresa(cnpjEmpresa)
);


INSERT INTO empresa (cnpjEmpresa, nome)  
			VALUES (12345678000191, 'Tech Solutions LTDA'),
				   (98765432000145, 'Innovate Corp.'),
				   (45678912000177, 'Global Systems S/A');  
       
       
INSERT INTO usuario (cpf, nome, fk_empresa)  
			 VALUES (12345678901,'João Pedro' ,12345678000191),
					(98765432109,'Clara' ,98765432000145),
				    (45612378900,'Fernando' ,45678912000177), 
				    (32165498701,'Ronaldo' ,12345678000191);
                    
                    
INSERT INTO represa (dia, volume, fk_empresa)  
			VALUES ('2025-02-01', 99.75, 12345678000191), 
				   ('2025-02-02', 88.84, 98765432000145),
				   ('2025-02-03', 95.92, 45678912000177),  
				   ('2025-02-04', 76.61, 12345678000191);  
                   
select * from usuario;
select * from represa;
select * from empresa;
select volume from represa where dia = '2025-02-03'
                   
                   
                   
                   
                   


                    
                    


