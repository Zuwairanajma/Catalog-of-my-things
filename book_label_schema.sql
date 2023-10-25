-- Create item table
CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);
-- schema for labels
CREATE TABLE Label (
  id int generated always as identity,
  title VARCHAR(255),
  color VARCHAR(255)
  publish_date date,
  items text[],
  primary key (id)
  foreign key (item_id) references item(id)
);

-- create schema for book
CREATE TABLE Books (
  id Int generated always as identity,
  publisher varchar(255),
  cover_status varchar(255),
  publish_date date,
  archived boolean,
  label_id Int,
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  PRIMARY KEY (id)
);

CREATE INDEX label_idx ON Books (label_id);