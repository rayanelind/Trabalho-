
-- MODELO LÓGICO

CREATE TABLE Localidade (
  id_localidade INT PRIMARY KEY,
  nome VARCHAR(100)
);

CREATE TABLE Zona_Eleitoral (
  id_zona INT PRIMARY KEY,
  numero INT,
  id_localidade INT,
  FOREIGN KEY (id_localidade) REFERENCES Localidade(id_localidade)
);

CREATE TABLE Secao_Eleitoral (
  id_secao INT PRIMARY KEY,
  numero INT,
  id_zona INT,
  FOREIGN KEY (id_zona) REFERENCES Zona_Eleitoral(id_zona)
);

CREATE TABLE Eleitor (
  id_eleitor INT PRIMARY KEY,
  nome VARCHAR(100),
  titulo_eleitor VARCHAR(20),
  id_secao INT,
  FOREIGN KEY (id_secao) REFERENCES Secao_Eleitoral(id_secao)
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

CREATE TABLE Voto (
  id_voto INT PRIMARY KEY,
  id_eleitor INT,
  id_candidato INT,
  data_hora DATETIME,
  FOREIGN KEY (id_eleitor) REFERENCES Eleitor(id_eleitor),
  FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato)
);

-- MODELO FÍSICO (MySQL)

CREATE TABLE Localidade (
  id_localidade INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE Zona_Eleitoral (
  id_zona INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL,
  id_localidade INT NOT NULL,
  FOREIGN KEY (id_localidade) REFERENCES Localidade(id_localidade)
);

CREATE TABLE Secao_Eleitoral (
  id_secao INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL,
  id_zona INT NOT NULL,
  FOREIGN KEY (id_zona) REFERENCES Zona_Eleitoral(id_zona)
);

CREATE TABLE Eleitor (
  id_eleitor INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  titulo_eleitor VARCHAR(20) UNIQUE NOT NULL,
  id_secao INT NOT NULL,
  FOREIGN KEY (id_secao) REFERENCES Secao_Eleitoral(id_secao)
);

CREATE TABLE Partido (
  id_partido INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  sigla VARCHAR(10) NOT NULL
);

CREATE TABLE Candidato (
  id_candidato INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  id_partido INT NOT NULL,
  FOREIGN KEY (id_partido) REFERENCES Partido(id_partido)
);

CREATE TABLE Voto (
  id_voto INT AUTO_INCREMENT PRIMARY KEY,
  id_eleitor INT NOT NULL,
  id_candidato INT NOT NULL,
  data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_eleitor) REFERENCES Eleitor(id_eleitor),
  FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato)
);
