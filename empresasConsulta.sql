create table if not exists empresas (
    id int unsigned not null AUTO_INCREMENT,
    nome varchar(255) not null,
    cnpj int unsigned,
    PRIMARY KEY (id),
    unique key(cnpj)
);

create table if not exists empresas_unidades (
    empresa_id int unsigned not null,
    cidade_id int unsigned not null,
    sede tinyint(1) not null,
    primary key (empresa_id, cidade_id)
);

alter table empresas modify cnpj varchar(14);

insert into empresas (nome, cnpj)
VALUES 
    ('Bradesco', 92839478234227),
    ('Vale', 48237487264296),
    ('Cielo', 2142432536534);

desc empresas;
desc prefeitos;

insert into empresas_unidades (empresa_id, cidade_id, sede)
VALUES
    (1, 1, 1),
    (1, 2, 0),
    (2, 1, 0),
    (2, 2, 1);

select e.nome, c.nome as Cidade
from empresas e, empresas_unidades eu, cidades c
where e.id = eu.empresa_id
and c.id = eu.cidade_id
and sede