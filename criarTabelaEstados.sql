create table estados (
    id int UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    sigla VARCHAR(2) NOT NULL,
    regiao ENUM('Norte', 'Nordeste', 'Centro-Oeste', 'Sudeste', 'Sul') NOT NULL,
    populacao DECIMAl(5,2) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (nome),
    UNIQUE KEY (sigla)
);