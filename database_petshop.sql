create database petshop;
use petshop;

CREATE TABLE clientes(
                         id_cliente INT NOT NULL AUTO_INCREMENT,
                         nome varchar(50) NOT NULL,
                         cpf INT NOT NULL,
                         email varchar(50),
                         PRIMARY KEY(id_cliente)
);

CREATE TABLE endereco(
                         id_endereco int not null auto_increment,
                         cep int not null,
                         rua varchar(50) not null,
                         numero int not null,
                         complemento varchar(30),
                         fk_id_cliente int,
                         primary key(id_endereco),
                         foreign key (fk_id_cliente) references clientes(id_cliente)
);

CREATE TABLE telefone(
                         id_telefone int not null auto_increment,
                         telefone_1 varchar(16) not null,
                         telefone_2 varchar(16) not null,
                         telefone_3 varchar(16) not null,
                         fk_id_cliente int,
                         primary key(id_telefone),
                         foreign key (fk_id_cliente) references clientes(id_cliente)
);

CREATE TABLE animais(
                        id_animal int not null auto_increment,
                        nome varchar(50) NOT NULL,
                        raça varchar(50) NOT NULL,
                        data_nascimento date NOT NULL,
                        fk_id_cliente int,
                        primary key(id_animal),
                        foreign key (fk_id_cliente) references clientes(id_cliente)
);

CREATE TABLE servicos(
                         id_servico int not null auto_increment,
                         consulta varchar(50),
                         banho varchar(50),
                         vacina varchar(50),
                         venda varchar(50),
                         fk_id_funcionario int,
                         fk_id_animal int,
                         fk_id_cliente int,
                         primary key(id_servico),
                         foreign key (fk_id_funcionario) references funcionarios(id_funcionario),
                         foreign key (fk_id_animal) references animais(id_animal),
                         foreign key (fk_id_cliente) references clientes(id_cliente)
);

CREATE TABLE itens(
                      id_item int not null auto_increment,
                      nome_item varchar(50) not null,
                      primary key(id_item)
);

CREATE TABLE funcionarios(
                             id_funcionario int not null auto_increment,
                             nome varchar(50) NOT NULL,
                             email varchar (50),
                             primary key(id_funcionario)
);

CREATE TABLE veterinario(
                            id_veterinario int not null auto_increment,
                            CRMV varchar(10) not null,
                            fk_id_funcionario int,
                            primary key(id_veterinario),
                            foreign key (fk_id_funcionario) references funcionarios(id_funcionario)
);
