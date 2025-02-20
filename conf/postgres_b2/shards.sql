CREATE TABLE books
(
    id bigint not null,
    category_id int not null,
    author character varying not null,
    title character varying not null,
    year int not null,
    CONSTRAINT year_check CHECK (year > 1920 and year <= 1999)
);

CREATE INDEX year_idx ON books USING btree(year);

