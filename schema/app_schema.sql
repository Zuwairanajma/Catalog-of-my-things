CREATE TABLE items (
    id INT PRIMARY KEY,
    published_date DATE,
    archived BOOLEAN
);

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    item_id INT,
    title VARCHAR(255),
    author_id INT,
    cover_state VARCHAR(255),
    publisher VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE genres (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE labels (
    title VARCHAR(255) PRIMARY KEY
);

CREATE TABLE games (
    id INT PRIMARY KEY,
    item_id INT,
    multiplayer BOOLEAN,
    last_played_at DATE,
    published_date DATE,
    author_id INT,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (author_id) REFERENCES game_authors(id)
);

CREATE TABLE music_albums (
    id INT PRIMARY KEY,
    item_id INT,
    genre_id INT,
    title VARCHAR(255),
    on_spotify BOOLEAN,
    published_date DATE,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);