create database hydroscan;
use hydroscan;

create table usuarios(
idUsuario int primary key auto_increment,
nome varchar(30) not null,
senha int not null,
email varchar(50) not null,
Fk_empresa int not null);

INSERT INTO usuarios (nome, senha, email, Fk_empresa) VALUES ('Alice Silva', 1234, 'alice@example.com', 1);
INSERT INTO usuarios (nome, senha, email, Fk_empresa) VALUES ('Bruno Costa', 5678, 'bruno@example.com', 2);
INSERT INTO usuarios (nome, senha, email, Fk_empresa) VALUES ('Carla Pereira', 9101, 'carla@example.com', 3);
INSERT INTO usuarios (nome, senha, email, Fk_empresa) VALUES ('David Lima', 1121, 'david@example.com', 4);
INSERT INTO usuarios (nome, senha, email, Fk_empresa) VALUES ('Elisa Rocha', 3141, 'elisa@example.com', 5);

alter table usuarios  add constraint  foreign key (Fk_empresa) references empresas(idEmpresa);

create unique index idx_email on usuarios(email);
create unique index idx_nome on usuarios(nome);


create table empresas(
idEmpresa int primary key auto_increment,
nome varchar(30) not null,
CNPJ varchar(14) not null);


alter table empresas modify column CNPJ varchar(14) not null;



INSERT INTO empresas (nome, CNPJ) VALUES ('Energia Pura', 12345678901);
INSERT INTO empresas (nome, CNPJ) VALUES ('Luz e Força', 23456789012);
INSERT INTO empresas (nome, CNPJ) VALUES ('Potência Total', 34567890123);
INSERT INTO empresas (nome, CNPJ) VALUES ('Energia Renovável', 45678901234);
INSERT INTO empresas (nome, CNPJ) VALUES ('Força do Sol', 56789012345);

create unique index idx_email on empresas(nome);
create unique index idx_nome on empresas(CNPJ);

CREATE TABLE sensor (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    altura INT NOT NULL,
    largura INT NOT NULL DEFAULT 2000,
    comprimento INT NOT NULL DEFAULT 2000,
    dens_agua INT NOT NULL DEFAULT 1000,
    gravidade INT NOT NULL DEFAULT 9.81,
    data_registro DATE DEFAULT (CURRENT_DATE),
    fkempresa INT,
    FOREIGN KEY (fkempresa) REFERENCES empresas(idEmpresa));



INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa)
VALUES (3000, 2000, 2000, 1000, 9.81, '2025-03-12', 1);
 
INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3100, 2000, 2000, 1000, 9.81, '2025-03-12', 2);
INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa)
VALUES (3200, 2000, 2000, 1000, 9.81, '2025-03-12', 3);
 
INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3300, 2000, 2000, 1000, 9.81, '2025-03-12', 4);

INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3400, 2000, 2000, 1000, 9.81, '2025-03-12', 5);

INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3500, 2000, 2000, 1000, 9.81, '2025-03-12', 1);

INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa)
VALUES (3600, 2000, 2000, 1000, 9.81, '2025-03-12', 2);
 
INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3700, 2000, 2000, 1000, 9.81, '2025-03-12', 3);

INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3800, 2000, 2000, 1000, 9.81, '2025-03-12', 4);

INSERT INTO sensor (altura, largura, comprimento, dens_agua, gravidade, data_registro, fkempresa) 
VALUES (3900, 2000, 2000, 1000, 9.81, '2025-03-12', 5);


-- Selecionar registros onde a altura é maior que 3500
SELECT * FROM sensor
WHERE altura > 3500;


-- Selecionar registros com data de registro no dia 12 de março de 2025
SELECT * FROM sensor
WHERE data_registro = '2025-03-12';

-- Selecionar registros onde a fkempresa é 1
SELECT * FROM sensor
WHERE fkempresa = 1;

-- Selecionar registros ordenados pela altura em ordem crescente
SELECT * FROM sensor
ORDER BY altura ASC;

-- Selecionar registros ordenados pela altura em ordem decrescente
SELECT * FROM sensor
ORDER BY altura DESC;




