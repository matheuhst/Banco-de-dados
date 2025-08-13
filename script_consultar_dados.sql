/*Mostrar todos os usuários*/
SELECT * FROM users;

/*Mostrar um usuário filtrando por id*/
SELECT * FROM users WHERE user_id = 2;

/*Mostrar nome de usuário e quando foi criado*/
SELECT username, created_at FROM users;

/*Mostrar todos os posts*/
SELECT * FROM posts;

/*Mostrar todos os comentários*/
SELECT * FROM comments;

/*Mostrar todos os posts de um usuário mostrando junto seu username*/
SELECT p.title, u.username 
FROM posts AS p 
INNER JOIN users AS u ON u.user_id = p.user_id 
WHERE p.user_id = 2;

/*Mostrar um post(title, description) pelo seu id e seus comentários*/
SELECT p.title, p.description, c.comment
FROM posts AS p
INNER JOIN comments AS c ON c.post_id = p.post_id
WHERE p.post_id = 1;

SELECT u.username, p.title, c.comment 
FROM users AS u 
INNER JOIN posts AS p ON p.user_id = u.user_id 
INNER JOIN comments AS c ON c.user_id = p.user_id 
WHERE u.user_id = 2;
