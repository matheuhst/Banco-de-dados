SELECT * FROM jogos;
SELECT * FROM jogadores;
SELECT * FROM partidas;
SELECT * FROM participantes_partidas;
SELECT * FROM avaliacoes_jogos;

/*Mostra o nome e o nickname de cada jogador*/
SELECT nome, nickname FROM jogadores;

/*Mostra o jogo e quando o jogo foi criado*/
SELECT nome, dt_created FROM jogos;

/*Mostra cada jogo que o jogador jogou*/
SELECT j.nickname, n.nome 
FROM jogadores AS j 
INNER JOIN jogos AS n ON n.id_jogo = j.id_jogador 
WHERE j.id_jogador = 1;

/*Mostra cada comentário de cada jogo*/
SELECT c.comentario, j.nome 
FROM avaliacoes_jogos AS c
INNER JOIN jogos AS j ON c.id_avaliacao = j.id_jogo
WHERE j.id_jogo = 2;

/*Mostra cada vencedor de cada partida de um determinado jogo*/
SELECT j.nome, p.id_vencedor, n.nickname
FROM jogos AS j
INNER JOIN partidas AS p ON j.id_jogo = p.id_vencedor
INNER JOIN jogadores AS n ON p.id_vencedor = n.id_jogador
WHERE j.id_jogo = 4;
