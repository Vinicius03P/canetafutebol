-- Tabela para armazenar grupos
CREATE TABLE Grupos (
    idGrupos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

-- Tabela para armazenar jogadores
CREATE TABLE Jogadores (
    idJogadores INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

-- Tabela para associar jogadores aos grupos
CREATE TABLE Grupo_Jogador (
    idGrupo_jogador INT PRIMARY KEY AUTO_INCREMENT,
    idgrupos INT,
    idJogador INT,
    FOREIGN KEY (grupo_id) REFERENCES Grupos(grupo_id),
    FOREIGN KEY (jogador_id) REFERENCES Jogador(jogador_id)
);

-- Tabela para armazenar partidas
CREATE TABLE Partida (
    idPartida INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    idGrupos INT,
    FOREIGN KEY (idGrupos) REFERENCES Grupos(idGrupos)
);

-- Tabela para associar jogadores aos times em uma partida
CREATE TABLE Times (
    idTimes INT PRIMARY KEY AUTO_INCREMENT,
    idPartida INT,
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida)
);

-- Tabela para associar jogadores aos times
CREATE TABLE Time_Jogador (
    idTimejogador INT PRIMARY KEY AUTO_INCREMENT,
    idTimes INT,
    idJogador INT,
    FOREIGN KEY (idTimes) REFERENCES Times(idTimes),
    FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador)
);

-- Tabela para armazenar eventos em partidas
CREATE TABLE Evento (
    idEvento INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    idJogador INT,
    idPartida INT,
    FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida)
);

-- Tabela para armazenar gols
CREATE TABLE Gol (
    idGol INT PRIMARY KEY AUTO_INCREMENT,
    idJogador INT,
    idPartida INT,
    FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida)
);