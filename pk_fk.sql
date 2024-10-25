CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL
);
CREATE TABLE authored (
    author_id INTEGER,
    book_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    PRIMARY KEY (author_id, book_id) 
);

INSERT INTO authors (id, name) VALUES
(1, 'Abdul Rauf'),
(2, 'Muhammad Ahsan'),
(3, 'Muhammad Umar');

INSERT INTO books (id, title) VALUES
(1, ': )'),
(2, 'PPP Zindabad'),
(3, 'The history of Arain (no one cares about)');

INSERT INTO authored (author_id, book_id) VALUES
(1, 1),
(2, 3),
(3, 2);