/*Removendo as tabelas via SQL*/
DROP TABLE comments;
DROP TABLE posts;

/*Criando as tabelas*/

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE posts(
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT now(),
    user_id INT REFERENCES users(user_id)
);

CREATE TABLE comments(
    comment_id SERIAL PRIMARY KEY,
    comment TEXT NOT NULL, 
    created_at TIMESTAMP DEFAULT now(),
    post_id INT REFERENCES posts(post_id),
    user_id INT REFERENCES users(user_id)
);


/*Inserindo os dados*/

INSERT INTO users(
    username, email
) VALUES ('moi123', 'moises@gmail.com'), 
         ('matheus987', 'matheus@gmail.com'),
         ('wendel456', 'wendel@gmail.com');

INSERT INTO posts(title, description, user_id) 
VALUES ('Primeira postagem', 'Aula de banco de dados', 1),
        ('Dia 02', 'Não aguento mais a faculdade', 2),
        ('Cansei', 'Vou trancar a faculdade a faculdade', 2);


INSERT INTO comments(comment,  post_id, user_id) 
VALUES ('Boa.', 1, 2),
        ('KKKKKKKKKK anão', 2, 2),
        ('Cinema', 1, 1);

INSERT INTO posts(title)
VALUES ('Hoje estou aqui novamente.');

INSERT INTO comments(comment, post_id)
VALUES ('Mas vai ter que ser assim, né irmão?', 4),
('O cara vai trancar a faculdade na segunda semana do segundo semestre, aí não dá né', 3), 
('Pelo menos isso é bom, né?', 4);
