create database petshop;
use petshop;

CREATE TABLE cliente(
                        id_cliente INT NOT NULL AUTO_INCREMENT,
                        nome varchar(50) NOT NULL,
                        cpf varchar(11) NOT NULL,
                        email varchar(50),
                        PRIMARY KEY(id_cliente)
);

CREATE TABLE endereco(
                         id_endereco int not null auto_increment,
                         cep varchar(10) not null,
                         rua varchar(50) not null,
                         numero int not null,
                         complemento varchar(30),
                         fk_id_cliente int,
                         primary key(id_endereco),
                         foreign key (fk_id_cliente) references cliente(id_cliente)
);

CREATE TABLE telefone(
                         id_telefone int not null auto_increment,
                         telefone_1 varchar(16) not null,
                         telefone_2 varchar(16) not null,
                         telefone_3 varchar(16) not null,
                         fk_id_cliente int,
                         primary key(id_telefone),
                         foreign key (fk_id_cliente) references cliente(id_cliente)
);

CREATE TABLE animal(
                       id_animal int not null auto_increment,
                       nome varchar(50) NOT NULL,
                       raca varchar(50) NOT NULL,
                       data_nascimento date NOT NULL,
                       fk_id_cliente int,
                       primary key(id_animal),
                       foreign key (fk_id_cliente) references cliente(id_cliente)
);

CREATE TABLE funcionario(
                            id_funcionario int not null auto_increment,
                            nome varchar(50) NOT NULL,
                            email varchar (50),
                            crmv varchar(20),
                            primary key(id_funcionario)
);

CREATE TABLE venda(
                      id_venda int not null auto_increment,
                      descricao varchar(150) NOT NULL,
                      primary key(id_venda)
);

CREATE TABLE consulta(
                         id_consulta int not null auto_increment,
                         tipo_consulta varchar(150) NOT NULL,
                         primary key(id_consulta)
);

CREATE TABLE banho_tosa(
                           id_banho_tosa int not null auto_increment,
                           descricao varchar(150) NOT NULL,
                           primary key(id_banho_tosa)
);

CREATE TABLE servico(
                        id_servico int not null auto_increment,
                        fk_id_funcionario int,
                        fk_id_animal int,
                        fk_id_cliente int,
                        fk_id_venda int,
                        fk_id_consulta int,
                        fk_id_banho_tosa int,
                        primary key(id_servico),
                        foreign key (fk_id_funcionario) references funcionario(id_funcionario),
                        foreign key (fk_id_animal) references animal(id_animal),
                        foreign key (fk_id_cliente) references cliente(id_cliente),
                        foreign key (fk_id_venda) references venda(id_venda),
                        foreign key (fk_id_consulta) references consulta(id_consulta),
                        foreign key (fk_id_banho_tosa) references banho_tosa(id_banho_tosa)
);

insert into cliente(nome, cpf, email) values('Romeu Geraldo Silva','62662325825','romeug@gmail.com');
insert into cliente(nome, cpf, email) values('Geraldino Santos Lemos','06035245896','geraldinos@gmail.com');
insert into cliente(nome, cpf, email) values('Jasmin Cunha Borges','03035236588','jasminc@gmail.com');
insert into cliente(nome, cpf, email) values('Lucca Matias Rinald','01023225856','luccam@gmail.com');
insert into cliente(nome, cpf, email) values('Samarina Regina Lustosa','02145689625','samarinar@gmail.com');

insert into endereco (cep,rua,numero,fk_id_cliente) values('25325000','Rua L','42',1);
insert into endereco(cep,rua,numero,complemento, fk_id_cliente) values('68800123','Rua Santana Junior','61','Casa da Frente',4);
insert into endereco(cep,rua,numero,complemento, fk_id_cliente) values('36254312','Rua heraclito graca','482','Casa dos Fundos',3);
insert into endereco(cep,rua,numero,complemento, fk_id_cliente) values('62352124','Rua Lisojeilma','4458','Casa A',5);
insert into endereco(cep,rua,numero,fk_id_cliente) values('44563785','Rua Joaquim Lemos','496',1);

insert into telefone(telefone_1,telefone_2,telefone_3,fk_id_cliente) values('88963254512','88985236545','88952365245',3);
insert into telefone(telefone_1,telefone_2,telefone_3,fk_id_cliente) values('71985632545','71985452363','71985634878',4);
insert into telefone(telefone_1,telefone_2,telefone_3,fk_id_cliente) values('79985632545','79985236523','79985236999',1);
insert into telefone(telefone_1,telefone_2,telefone_3,fk_id_cliente) values('11985632547','11985854848','11986362525',5);
insert into telefone(telefone_1,telefone_2,telefone_3,fk_id_cliente) values('21985632536','21985856325','21999636363',2);

insert into animal(nome,raca,data_nascimento, fk_id_cliente) values('Sherlock Lima','Buldogue','2005/05/23',4);
insert into animal(nome,raca,data_nascimento, fk_id_cliente) values('Bambi Gomes','poodle','2009/10/29',3);
insert into animal(nome,raca,data_nascimento, fk_id_cliente) values('Fiona Borges','Shih-tzu','2004/09/29',1);
insert into animal(nome,raca,data_nascimento, fk_id_cliente) values('Hulk Santos','Yorkshire Terrier','2008/03/01',5);
insert into animal(nome,raca,data_nascimento, fk_id_cliente) values('Nemo Lucca','Golden Retriever','2007/07/04',2);

insert into funcionario(nome,email,crmv) values('Carla Soares Cunha','carlas@gmail.com',null);
insert into funcionario(nome,email,crmv) values('Josefina Castro e Nobre','finajose@outlook.com',null);
insert into funcionario(nome,email,crmv) values('Francisca Maria Cathllyn Jones','666thenumberodthebeast@yahoo.com.br', '1234987363jsns');

insert into venda(descricao) values('Bola de borracha, focinheira');
insert into venda(descricao) values('Coleira');
insert into venda(descricao) values('Guia');
insert into venda(descricao) values('Osso de brinquedo');
insert into venda(descricao) values('Cama');

insert into consulta(tipo_consulta) values('clinica');
insert into consulta(tipo_consulta) values('retorno');
insert into consulta(tipo_consulta) values('exame de sangue');

insert into banho_tosa(descricao) values('simples');
insert into banho_tosa(descricao) values('premium');

insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(1,3,1,null,null,1);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(2,5,2,null,null,2);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(3,2,3,null,1,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(4,1,3,null,2,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(5,4,3,null,3,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(5,4,1,1,null,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(4,1,2,2,null,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(3,2,1,3,null,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(2,5,2,4,null,null);
insert into servico(fk_id_cliente,fk_id_animal,fk_id_funcionario,fk_id_venda,fk_id_consulta,fk_id_banho_tosa) values(1,3,1,5,null,null);
