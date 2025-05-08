CREATE DATABASE ControleEstoque;
USE ControleEstoque;

create table fornecedor (
    id_fornecedor integer primary key auto_increment,
    nome text not null,
    cnpj varchar(14) unique not null,
    contato text
);

create table setor (
    id_setor int primary key auto_increment,
    nome text not null
);

create table pedido_compra (
    id_pedido integer primary key auto_increment,
    id_fornecedor integer,
    data_emissao date not null,
    status varchar(20) default 'Pendente',
    foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

create table item_pedido (
    id_item_pedido integer primary key auto_increment,
    id_pedido integer,
    id_produto integer,
    quantidade integer not null,
    preco_total decimal (10,2) not null,
    foreign key (id_pedido) references pedido_compra(id_pedido),
    foreign key (id_produto) references produto(id_produto)
);

create table produto (
    id_produto integer primary key auto_increment,
    nome text not null,
    descricao text,
    categoria text,
    quantidade_estoque integer default 0,
    preco_unitario decimal(10,2) not null,
    data_validade date
);

create table movimentacao_estoque (
    id_moviemntacao integer primary key auto_increment,
    id_produto integer,
    tipo enum('entrada', 'saida') not null,
    quantidade integer not null,
    data date not null,
    id_funcionario integer,
    foreign key (id_produto) references produto(id_produto),
    foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table funcionario (
    id_funcionario integer primary key auto_increment,
    id_setor integer,
    nome text not null,
    foreign key (id_setor) references setor(id_setor)
);

DELIMITER

create trigger atualizacao_estoque_entrada
after insert on movimentacao_estoque
for each row begin
    if new.tipo = 'entrada' then
        update produto
        set quantidade_estoque = quantidade_estoque + new.quantidade
        where id_produto = new.id_produto;
    end if;
end;

create trigger atualizacao_estoque_saida
after insert on movimentacao_estoque
for each row begin
    if new.tipo = 'saida' then
        update produto
        set quantidade_estoque = quantidade_estoque - new.quantidade
        where id_produto = new.id_produto;
    end if;
end;

create trigger calcula_preco_total
before insert on item_pedido
for each row
begin
    declare preco decimal (10,2);
    select preco_unitario into preco from produto where id_produto = new.id_produto;
    set new.preco_total = preco * new.quantidade;
end

DELIMITER;