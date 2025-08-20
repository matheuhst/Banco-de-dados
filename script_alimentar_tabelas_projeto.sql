INSERT INTO jogos(
    nome,
    categoria,
    jogMin,
    jogMax,
    tempoEstimado
) VALUES ('Jogo da vida', 'Tabuleiro', 2, 6, 60),
         ('Uno', 'Cartas', 2, 10, 30),
         ('Detetive', 'Tabuleiro', 3, 8, 60),
         ('Magic', 'Cartas', 2, 4, 20),
         ('RPG', 'RPG', 2, 8, 240);


INSERT INTO jogadores(
    nome,
    email,
    dataNascimento,
    nickname
) VALUES ('Marcelo', 'marcelo@gmail.com', '2006-08-03', 'mainthevoid'),
         ('Matheus', 'matheus@gmail.com', '2006-10-11', 'matheuhst'),
         ('Brendo', 'fireboycapirotadoenzodesouza@gmail.com', '2007-02-14', 'kagakill'),
         ('Mauricio', 'mauricio@gmail.com', '2006-06-17', 'juninbr'),
         ('Felipe', 'felipe@gmail.com', '2007-06-28', 'felipinho69');

INSERT INTO partidas (
    local,
    duracao,
    id_jogo,
    id_vencedor
) VALUES ('IFSP - CPV', 80, 1, 3),
         ('IFSP - CPV', 20, 2, 1),
         ('IFSP - CPV', 65, 3, 2),
         ('IFSP - CPV', 8, 4, 4),
         ('IFSP - CPV', 240, 5, 5);

INSERT INTO participantes_partidas(
    id_partida,
    id_jogador,
    pontuacao,
    ordem_jogo,
) VALUES (1, 1, 6, 1),
         (1, 2, 7, 2),
         (1, 3, 8, 3),
         (1, 4, 9, 4),
         (1, 5, 10, 4);
         
