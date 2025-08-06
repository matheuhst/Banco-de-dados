CREATE TABLE posts(
    post_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL
);

CREATE TABLE comments(
    comment_id INT PRIMARY KEY,
    comment TEXT NOT NULL, 
    created_at TIMESTAMP NOT NULL,
    post_id INT REFERENCES posts(post_id)
);



INSERT INTO posts(post_id, title, description, created_at) 
VALUES (1, 
        'Primeira postagem', 
        'Essa é a minha primeira postagem', 
        '2025-08-05 21:30'),
        (2, 
        'Dia 02',
        'Não aguento mais a faculdade',
        '2025-08-05 22:30'),
        (3, 
        'Cansei',
        'Vou trancar a faculdade a faculdade',
        '2025-08-05 22:34');


INSERT INTO comments(comment_id, comment, created_at, post_id) 
VALUES (1,
        'Boa.',
        '2025-08-05 21:31',
        1),
        (2,
        'KKKKKKKKKK anão',
        '2025-08-05 22:32',
        1),
        (3,
        'Cinema',
        '2025-08-05 22:36',
        1);