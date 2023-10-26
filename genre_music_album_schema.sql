CREATE TABLE music_albums (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    FOREIGN KEY (id) REFERENCES items(id)
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
