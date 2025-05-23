select * from `cidades`

CREATE TABLE if not EXISTS prefeitos (
    id int unsigned not null AUTO_INCREMENT,
    nome VARCHAR(255) not null,
    cidade_id int unsigned,
    PRIMARY KEY(id),
    unique KEY (cidade_id),
    foreign key (cidade_id) references cidades(id)
);

select * from prefeitos

insert into prefeitos (nome, cidade_id)
VALUES
    ('Rodrigo Neves', 2);

insert into prefeitos (nome, cidade_id)
VALUES
    ('Raquel Lira', 3),
    ('Zenaldo Coutinho', null);

INSERT INTO prefeitos ( nome, cidade_id ) 
VALUES
    ('Rafael Greca', null);

select * from cidades c inner join prefeitos p on c.id = p.cidade_id;
select * from cidades c left outer join prefeitos p on c.id = p.cidade_id;
select * from cidades c right join prefeitos p on c.id = p.cidade_id;
