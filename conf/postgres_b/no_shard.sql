CREATE TABLE books
(
    id bigint not null,
    category_id int not null,
    author character varying not null,
    title character varying not null,
    year int not null
);