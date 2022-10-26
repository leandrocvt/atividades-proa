create database bd_pokemon;
use bd_pokemon;

create table tb_treinador(
	id_treinador int auto_increment not null,
    nome varchar(100) not null,
    data_nascimento date not null,
    id_mochila int not null,
    constraint pk_id_treinador primary key (id_treinador)
);

create table tb_mochila(
	id_mochila int auto_increment not null,
    id_treinador int not null,
    id_pokemon int not null,
    quantidade_pokemon integer not null,
    constraint pk_id_mochila primary key (id_mochila),
    constraint fk_idtreinador foreign key (id_treinador) references tb_treinador(id_treinador)
);

create table tb_pokemon(
	id_pokemon int auto_increment not null,
    nome varchar(100) not null,
    forma varchar(100),
    tipo1 varchar(100) not null,
    tipo2 varchar(100),
    hp int not null,
    ataque int not null,
    defesa int not null,
    ataque_especial int not null,
    defesa_especial int not null,
    agilidade int not null,
    geracao int not null,
    id_fazenda int not null,
    constraint pk_id_pokemon primary key (id_pokemon),
    constraint fk_id_fazenda foreign key (id_fazenda) references tb_fazenda(id_fazenda)
);

create table tb_fazenda(
	id_fazenda int auto_increment not null,
    id_treinador int not null,
    constraint pk_id_fazenda primary key (id_fazenda),
    constraint fk_id_treinador foreign key (id_treinador) references tb_treinador(id_treinador)
);

select * from tb_treinador;
select * from tb_mochila;
select * from tb_fazenda;
select * from tb_pokemon;

alter table tb_treinador add constraint fk_idmochila foreign key (id_mochila) references tb_mochila(id_mochila);
alter table tb_mochila add constraint fk_idpokemon foreign key (id_pokemon) references tb_pokemon(id_pokemon);


