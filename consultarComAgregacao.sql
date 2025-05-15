select
    regiao as 'Regiao',
    sum(populacao) as Total
from estados
group by regiao
order by Total DESC

select
    sum(populacao) as Total
from estados

select
    avg(populacao) as Total
from estados