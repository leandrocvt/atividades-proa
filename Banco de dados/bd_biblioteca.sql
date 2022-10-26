create database bd_biblioteca;
use bd_biblioteca;

create table tb_cliente(
	id_cliente int auto_increment not null,
    nome varchar(70) not null,
    email varchar(70) not null,
    constraint pk_idcliente primary key (id_cliente)
);

create table tb_livro(
	id_livro int auto_increment not null,
    titulo varchar(100) not null,
    tipo_capa varchar(50) not null,
    genero varchar(100) not null,
    valor double not null,
    constraint pk_idlivro primary key (id_livro)
);

create table tb_compra(
	id_compra int auto_increment not null,
    data_compra date not null,
    total_compra float not null,
    id_cliente int not null,
    id_livro int not null,
    constraint pk_idcompra primary key (id_compra),
    constraint fk_idcliente foreign key (id_cliente) references tb_cliente(id_cliente),
    constraint fk_idlivro foreign key (id_livro) references tb_livro(id_livro)
);

create table tb_avaliacao(
	id_avaliacao int auto_increment not null,
    descricao enum('Ruim', 'Regular', 'Bom', 'Muito Bom') not null,
    id_cliente int not null,
    id_livro int not null,
    constraint pk_idavaliacao primary key (id_avaliacao),
	constraint fk_id_cliente foreign key (id_cliente) references tb_cliente(id_cliente),
    constraint fk_id_livro foreign key (id_livro) references tb_livro(id_livro)
);

create table tb_editora(
	id_editora int not null auto_increment,
    nome varchar(70) not null,
    telefone varchar(15) not null,
    celular varchar(15) not null,
    data_publicacao date,
    constraint pk_ideditora primary key (id_editora)
);

create table tb_publicacao(
	id_publicacao int auto_increment not null,
    id_editora int not null,
    id_livro int not null,
    constraint pk_idpublicacao primary key (id_publicacao),
	constraint fk_ideditora foreign key (id_editora) references tb_editora(id_editora),
    constraint fk_idlivro_publicacao foreign key (id_livro) references tb_livro(id_livro)
);

create table tb_autor(
	id_autor int auto_increment not null,
    nome varchar(70) not null,
    rua varchar(100) not null,
    numero varchar(10) not null,
    data_nascimento date not null,
    pais_origem varchar(50) not null,
    constraint pk_idautor primary key (id_autor)
);

create table tb_obra(
	id_obra int auto_increment not null,
    id_autor int not null,
    id_livro int not null,
	constraint pk_idobra primary key (id_obra),
	constraint fk_id_autor foreign key (id_autor) references tb_autor(id_autor),
    constraint fk_id_livro_obra foreign key (id_livro) references tb_livro(id_livro)
);
