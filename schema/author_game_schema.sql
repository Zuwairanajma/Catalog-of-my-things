-- Create author table

CREATE TABLE Author(
    id int generated always as identity,
    first_name varchar(255),
    last_name varchar(255),
    items text[]
    primary key (id)
    foreign key (item_id) references item(id)
);

-- Create game table

CREATE TABLE Game(
    id int generated always as identity,
    multiplayer varchar(255),
    last_played_at date,
    published_date date,
    archived boolean,
    author_id int,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
    primary key (id)
);