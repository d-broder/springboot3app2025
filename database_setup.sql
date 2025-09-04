-- Script para criação das tabelas e configuração do banco de dados
-- Projeto: springboot3app2025

-- 1. Cria a tabela usr_usuario
create table usr_usuario (
  usr_id bigint generated always as identity,
  usr_nome varchar(20) not null,
  usr_senha varchar(150) not null,
  primary key (usr_id),
  unique (usr_nome)
);

-- 2. Cria a tabela aut_autorizacao
create table aut_autorizacao (
  aut_id bigint generated always as identity,
  aut_nome varchar(20) not null,
  primary key (aut_id),
  unique (aut_nome)
);

-- 3. Cria a tabela de ligação uau_usuario_autorizacao
create table uau_usuario_autorizacao (
  usr_id bigint not null,
  aut_id bigint not null,
  primary key (usr_id, aut_id),
  foreign key (usr_id) references usr_usuario (usr_id) on delete restrict on update cascade,
  foreign key (aut_id) references aut_autorizacao (aut_id) on delete restrict on update cascade
);

-- 4. Cria a tabela ant_anotacao
create table ant_anotacao (
  ant_id bigint generated always as identity,
  ant_texto varchar(256) not null,
  ant_data_hora timestamp not null,
  ant_usr_id bigint not null,
  primary key (ant_id),
  foreign key (ant_usr_id) references usr_usuario(usr_id)
);

-- 5. Insere registros nas tabelas

-- Insere um usuário administrador
insert into usr_usuario (usr_nome, usr_senha)
values ('admin', '$2a$10$i3.Z8Yv1Fwl0I5SNjdCGkOTRGQjGvHjh/gMZhdc3e7LIovAklqM6C');

-- Insere uma autorização
insert into aut_autorizacao (aut_nome)
values ('ROLE_ADMIN');

-- Associa o usuário admin com a autorização ROLE_ADMIN
insert into uau_usuario_autorizacao (usr_id, aut_id)
values (1, 1);

-- Insere uma anotação de exemplo
insert into ant_anotacao(ant_texto, ant_data_hora, ant_usr_id)
values('Meu novo projeto', '2023-08-01 19:10', 1);

-- 6. Cria um novo usuário "spring" com senha "pass123"
create user spring with password 'pass123';

-- 7. Dá permissões ao usuário spring
grant update, delete, insert, select on all tables in schema public to spring;
