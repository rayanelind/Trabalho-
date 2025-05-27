-- Modelo Físico
-- Script SQL para criação das tabelas

CREATE TABLE Localidade (
    id_localidade INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Zona (
    id_zona INT PRIMARY KEY,
    numero INT,
    id_localidade INT,
    FOREIGN KEY (id_localidade) REFERENCES Localidade(id_localidade)
);

CREATE TABLE Secao (
    id_secao INT PRIMARY KEY,
    numero INT,
    id_zona INT,
    FOREIGN KEY (id_zona) REFERENCES Zona(id_zona)
);

CREATE TABLE Eleitor (
    id_eleitor INT PRIMARY KEY,
    nome VARCHAR(100),
    titulo_eleitoral VARCHAR(20),
    id_secao INT,
    FOREIGN KEY (id_secao) REFERENCES Secao(id_secao)
);

CREATE TABLE Partido (
    id_partido INT PRIMARY KEY,
    nome VARCHAR(100),
    sigla VARCHAR(10)
);

CREATE TABLE Candidato (
    id_candidato INT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    id_partido INT,
    FOREIGN KEY (id_partido) REFERENCES Partido(id_partido)
);