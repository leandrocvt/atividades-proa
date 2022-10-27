create database bd_cds;
use bd_cds;

create table tb_artista(
	Cod_Art int auto_increment not null,
    Nome_Art varchar(100) not null,
    constraint pk_CodArtista primary key (Cod_Art),
    constraint uq_NomeArt unique key (Nome_Art)
);

create table tb_gravadora(
	Cod_Grav int auto_increment not null,
    Nome_Grav varchar(50) not null,
    constraint pk_CodGrav primary key (Cod_Grav),
    constraint uq_NomeGrav unique key (Nome_Grav)
);

create table tb_categoria(
	Cod_Cat int auto_increment not null,
    Nome_Cat varchar(50) not null,
    constraint pk_CodCat primary key (Cod_Cat),
    constraint uq_NomeCat unique key (Nome_Cat)
);

create table tb_estado(
	Uf_Est char(2) not null,
    Nome_Est char(50) not null,
    constraint Pk_UfEst primary key (Uf_Est),
    constraint Nome_Est unique key (Nome_Est)
);

create table tb_cidade(
	Cod_Cid int auto_increment not null,
    Uf_Est char(2) not null,
    constraint Pk_Codcid primary key (Cod_Cid),
    constraint Fk_UfEst foreign key (Uf_Est) references tb_estado(Uf_Est)
);

create table tb_cliente(
	Cod_Cli int auto_increment not null,
    Cod_Cid int not null,
    Nome_Cli varchar(100) not null,
	End_Cli varchar(200) not null,
    Renda_Cli decimal(10,2) not null,
    Sexo_Cli enum('F', 'M') not null,
    constraint pk_Codcli primary key (Cod_Cli),
    constraint fk_Codcid foreign key (Cod_Cid) references tb_cidade(Cod_Cid)
);

create table tb_conjuge(
	Id_Conjuge int auto_increment not null,
	Cod_Cli int not null,
    Nome_Conj varchar(100) not null,
    Renda_Conj decimal(10,2) not null,
    Sexo_Conj enum('F', 'M') not null,
    constraint pk_Idconjuge primary key (Id_Conjuge),
    constraint fk_Codcli foreign key (Cod_Cli) references tb_cliente(Cod_Cli)
);

create table tb_funcionario(
	Cod_Fun int auto_increment not null,
    Nome_Fun varchar(100) not null,
    End_Fun varchar(200) not null,
    Salario_Fun decimal(10,2) not null,
    Sexo_Fun enum('F', 'M') not null,
    constraint pk_CodFun primary key (Cod_Fun)
);

create table tb_dependente(
	Cod_Dep int auto_increment not null,
    Cod_Fun int not null,
    Nome_Dep varchar(100) not null,
    constraint pk_CodDep primary key (Cod_Dep),
    constraint fk_Codfun foreign key (Cod_Fun) references tb_funcionario (Cod_Fun)
);

create table tb_titulo(
	Cod_Tit int auto_increment not null,
    Cod_Cat int not null,
    Cod_Grav int not null,
    Nome_Cd varchar(100) not null,
    Valor_Cd decimal(10, 2) not null,
    quantidade_Cd int not null,
    constraint pk_Codtit primary key (Cod_Tit),
    constraint fk_Codcat foreign key (Cod_Cat) references tb_categoria(Cod_Cat),
    constraint fk_Codgrav foreign key (Cod_Grav) references tb_gravadora(Cod_Grav),
    constraint uq_Nomecd unique key (Nome_Cd)
);

create table tb_pedido(
	Cod_Ped int auto_increment not null,
    Cod_Cli int not null,
    Cod_Fun int not null,
    Data_Ped datetime not null,
    constraint pk_CodPed primary key (Cod_Ped),
    constraint fk_Codfun_pedido foreign key (Cod_Fun) references tb_funcionario (Cod_Fun),
    constraint fk_Codcli_pedido foreign key (Cod_Cli) references tb_cliente(Cod_Cli)
);

create table tb_titulo_pedido(
	Cod_Titulo_Pedido int auto_increment not null,
	Cod_Ped int not null,
    Cod_Tit int not null,
    Qtd_Cd int not null,
    Valor_Cd decimal(10, 2) not null,
    constraint pk_Titulopedido primary key (Cod_Titulo_Pedido),
    constraint fk_Codped foreign key (Cod_Ped) references tb_pedido(Cod_Ped),
    constraint fk_Codtit foreign key (Cod_Tit) references tb_titulo(Cod_Tit)
);

create table tb_titulo_artista(
	Cod_titulo_artista int auto_increment not null,
	Cod_Tit int not null,
    Cod_Art int not null,
    constraint pk_Cod_titulo_artista primary key (Cod_titulo_artista),
    constraint fk_CodArt_artista foreign key (Cod_Art) references tb_artista(Cod_Art),
    constraint fk_CodTit_artista foreign key (Cod_Tit) references tb_titulo(Cod_Tit)
);