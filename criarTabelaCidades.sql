create table if not exists cidades (
    id int unsigned not null AUTO_INCREMENT primary key,
    nome VARCHAR(255) not null,
    estado_id int unsigned not null,
    area decimal(10,2),
    foreign key (estado_id) REFERENCES estados(id)
);

SELECT * FROM estados where id = 25

INSERT INTO cidades ( nome, area, estado_id ) 
VALUES
('Campinas', 795, 25);

insert into cidades (nome, area, estado_id)
values
('Niterói', 133.9, 19);

insert into cidades (nome, area, estado_id)
values ('Caruaru', 920.6, (select id from estados where sigla = 'PE'))

insert into cidades (nome, area, estado_id)
values ('Juazeiro do norte', 248.2, (select id from estados where sigla = 'CE'))

select * from cidades
