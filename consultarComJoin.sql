select
    e.nome as Estados,
    c.nome as Cidades,
    regiao as Região  
from estados e, cidades c
where e.id = c.estado_id;

select * from estados limit 2;
select * from estados order by populacao desc;
select * from estados where regiao = 'Norte';
select * from estados where populacao > 7;
select * from estados where regiao = 'Nordeste' AND populacao >= 7;
select COUNT(distinct regiao) from `estados`;
select avg(populacao) from `estados`; 

select sigla, COUNT(*) as Sigla FROM `estados` group by sigla;

select
    e.nome as Estados,
    c.nome as Cidades,
    regiao as Região  
from estados e
inner join cidades c 
    on e.id = c.estado_id