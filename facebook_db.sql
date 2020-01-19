DROP DATABASE IF EXISTS facebook_db;
CREATE DATABASE facebook_db;

\c facebook_db

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS likes;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    poster_id INT REFERENCES users(id) ON DELETE SET NULL,
    body TEXT
);

CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    liker_id INT REFERENCES users(id) ON DELETE SET NULL,
    post_id INT REFERENCES posts(id) ON DELETE SET NULL
);

INSERT INTO users (name, age)
    VALUES ('Jovanni', 26),
            ('Phil', 28),
            ('Jon', 24),
            ('Liz', 22),
            ('Tony', 38);
    INSERT INTO posts (poster_id, body)
        VALUES (4, 'Hello Everybody'),
                (4, 'My name is Liz'),
                (4, 'Do you guys want to be friends?'),
                (1, 'No I do not want to be friends'),
                (2, 'You suck'),
                (3, 'Dont be mean guys'),
                (5, 'Hi Liz, I am Tony');
    INSERT INTO likes (liker_id, post_id)
        VALUES (1, 1),
                (1, 2),
                (1, 3),
                (1, 5),
                (1, 6),
                (1, 7),
                (2, 5),
                (3, 5),
                (3, 4),
                (4, 5),
                (4, 6),
                (5, 4),
                (5, 5),
                (5, 6);
                


-- SELECT * FROM posts
--     JOIN (SELECT post_id, count(*) 
--     FROM likes 
--     GROUP BY post_id) AS count_table ON COUNT_table.post_id = posts.id
--     WHERE posts.id = 5
-- This will grab the count of how many times a post is seen in the likes tables

