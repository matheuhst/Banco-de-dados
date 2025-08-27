CREATE TABLE jogos(
    id_jogo SERIAL PRIMARY KEY,
    nome VARCHAR (20) NOT NULL,
    categoria VARCHAR (15),
    jogMin INT,
    jogMax INT,
    tempoEstimado INT,
    dt_created TIMESTAMP DEFAULT now()
);

CREATE TABLE jogadores(
    id_jogador SERIAL PRIMARY KEY,
    nome VARCHAR (15),
    email VARCHAR (40) UNIQUE,
    dataNascimento DATE,
    nickname VARCHAR (15)
)

CREATE TABLE partidas(
    id_partida SERIAL PRIMARY KEY,
    data TIMESTAMP DEFAULT now(),
    local VARCHAR (50),
    duracao INT,
    id_jogo INT REFERENCES jogos(id_jogo),
    id_vencedor INT REFERENCES jogadores(id_jogador)
);

CREATE TABLE participantes_partidas (
    id_partida INT NOT NULL,
    id_jogador INT NOT NULL,
    pontuacao INT,
    ordem_jogo INT,
    
    PRIMARY KEY (id_partida, id_jogador),
    
    FOREIGN KEY (id_partida) REFERENCES partidas(id_partida),
    FOREIGN KEY (id_jogador) REFERENCES jogadores(id_jogador)
);

CREATE TABLE avaliacoes_jogos(
    id_avaliacao SERIAL PRIMARY KEY,
    nota INT,
    comentario TEXT,
    dt_avaliacao TIMESTAMP DEFAULT now(),
    id_jogador INT REFERENCES jogadores(id_jogador),
    id_jogo INT REFERENCES jogos(id_jogo)
)

/*Apagar as tabelas*/

DROP TABLE jogos;
DROP TABLE jogadores;
DROP TABLE participantes_partidas;
DROP TABLE partidas;
DROP TABLE avaliacoes_jogos;
