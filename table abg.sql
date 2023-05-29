Last login: Sat May 27 13:41:46 on ttys000
/Library/PostgreSQL/14/scripts/runpsql.sh; exit                                 
aleksandrsapoznikov@MacBook-Air-Aleksandr ~ % /Library/PostgreSQL/14/scripts/runpsql.sh; exit
Server [localhost]: 
Database [postgres]: 
Port [5433]: 
Username [postgres]: 
Password for user postgres: 
psql (14.8)
Type "help" for help.

postgres=# create database homework
postgres-# ;
CREATE DATABASE
postgres=# \c homework
You are now connected to database "homework" as user "postgres".
homework=# \c
You are now connected to database "homework" as user "postgres".
homework=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# \c homework
You are now connected to database "homework" as user "postgres".
homework=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# drop database homework
postgres-# ;
DROP DATABASE
postgres=# create database abg
postgres-# ;
CREATE DATABASE
postgres=# \c abg
You are now connected to database "abg" as user "postgres".
abg=# CREATE TABLE authors (id SERIAL PRIMARY KEY, name VARCHAR(200) NOT NULL DEFAULT 'lore', year DATE
abg(# ;
abg(# )
abg-# ;
ERROR:  syntax error at or near ";"
LINE 2: ;
        ^
abg=# create table authors (id serial primary key, name varchar(200) not null default 'lore', year date not null default '1970-01-01');
CREATE TABLE
CREATE TABLE table books (id serial primary key, title varchar(200) not null default 'noname', genre_id int not null default 0);
abg=# create table genres (id serial primary key, genre varchar(100) not null default 'unknown');
CREATE TABLE
abg=# create table authors_books (author_id int not null default 0, book_id int not null default 0);
CREATE TABLE
abg=# INSERT INTO genres (genre) VALUES ('SF'), ('novels'), ('story'), ('horror');
INSERT 0 4
abg=# INSERT INTO books(title, genre_id) VALUES ('Майстер і Маргарита', 2), ('Фауст', 0), ('Білий клик', 3), ('Дюна', 1), ('Війна і мир', 2);
INSERT 0 5
abg=# INSERT INTO authors (name) VALUES ('Френк Герберт'), ('Михайло Булгаков'), ('Джек Лондон'), ('Йоган Ґете'), ('Роберт Хайнлайн');
INSERT 0 5
abg=# INSERT INTO authors_books (author_id, book_id) VALUES (1, 4), (2, 1), (3, 3), (4, 2);
INSERT 0 4
abg=# select title, genre from books inner join genres on books.genre_id = genres.id;
        title        | genre  
---------------------+--------
 Майстер і Маргарита | novels
 Білий клик          | story
 Дюна                | SF
 Війна і мир         | novels
(4 rows)

abg=# select title, genre from books left join genres on books.genre_id = genres.id;
        title        | genre  
---------------------+--------
 Майстер і Маргарита | novels
 Фауст               | 
 Білий клик          | story
 Дюна                | SF
 Війна і мир         | novels
(5 rows)

abg=# select title, genre from books right join genres on books.genre_id = genres.id;
        title        | genre  
---------------------+--------
 Майстер і Маргарита | novels
 Білий клик          | story
 Дюна                | SF
 Війна і мир         | novels
                     | horror
(5 rows)

abg=# select title, genre from books full join genres on books.genre_id = genres.id;
        title        | genre  
---------------------+--------
 Майстер і Маргарита | novels
 Фауст               | 
 Білий клик          | story
 Дюна                | SF
 Війна і мир         | novels
                     | horror
(6 rows)

abg=# select title, genre from books left join genres on books.genre_id = genres.id
abg-# UNION
abg-# select title, genre from books right join genres on books.genre_id = genres.id;
        title        | genre  
---------------------+--------
 Фауст               | 
                     | horror
 Білий клик          | story
 Дюна                | SF
 Війна і мир         | novels
 Майстер і Маргарита | novels
(6 rows)

abg=# select authors.author_id, authors.author_name, books.book_id, books.book_title, genres.genre_name
abg-# from authors
abg-# join authors_books on authors.author_id = authors_books.author_id
abg-# join books on authors_books.book_id = books.book_id
abg-# join genres on books.genre_id = genres.genre_id;
ERROR:  column authors.author_id does not exist
LINE 3: join authors_books on authors.author_id = authors_books.auth...
                              ^
abg=# SELECT column_name, table_name
abg-# FROM information_schema.columns
abg-# WHERE table_name IN ('authors', 'authors_books', 'books', 'genres');
 column_name |  table_name   
-------------+---------------
 book_id     | authors_books
 id          | genres
 author_id   | authors_books
 id          | authors
 year        | authors
 id          | books
 genre_id    | books
 name        | authors
 title       | books
 genre       | genres
(10 rows)

abg=# SELECT a.author_id, a.author_name, b.book_id, b.book_title, g.genre_name
abg-# FROM authors AS a
abg-# JOIN authors_books AS ab ON a.author_id = ab.author_id
abg-# JOIN books AS b ON ab.book_id = b.book_id
abg-# JOIN genres AS g ON b.genre_id = g.id;
ERROR:  column a.author_id does not exist
LINE 3: JOIN authors_books AS ab ON a.author_id = ab.author_id
                                    ^
HINT:  Perhaps you meant to reference the column "ab.author_id".
abg=# SELECT ab.author_id, a.author_name, ab.book_id, b.book_title, g.genre_name
abg-# FROM authors AS a
abg-# JOIN authors_books AS ab ON a.author_id = ab.author_id
abg-# JOIN books AS b ON ab.book_id = b.book_id
abg-# JOIN genres AS g ON b.genre_id = g.id;
ERROR:  column a.author_id does not exist
LINE 3: JOIN authors_books AS ab ON a.author_id = ab.author_id
                                    ^
HINT:  Perhaps you meant to reference the column "ab.author_id".
abg=# select title, genre from books full join genres on (genres.id = genres.genre_id);
ERROR:  column genres.genre_id does not exist
LINE 1: ...genre from books full join genres on (genres.id = genres.gen...
                                                             ^
HINT:  Perhaps you meant to reference the column "genres.genre".
abg=# select title, genre from books full join genres on (genres.id = books.genre_id);
        title        | genre  
---------------------+--------
 Майстер і Маргарита | novels
 Фауст               | 
 Білий клик          | story
 Дюна                | SF
 Війна і мир         | novels
                     | horror
(6 rows)

abg=# select title, author from books full join authors on (authors.id = authors.book_id);
ERROR:  column authors.book_id does not exist
LINE 1: ...hor from books full join authors on (authors.id = authors.bo...
                                                             ^
abg=# select title, author from books full join authors on (authors.id = authors_books);
ERROR:  column "authors_books" does not exist
LINE 1: ...hor from books full join authors on (authors.id = authors_bo...
                                                             ^
abg=# select title, author from books full join authors on (authors.id = author_id);
ERROR:  column "author_id" does not exist
LINE 1: ...hor from books full join authors on (authors.id = author_id)...
                                                             ^
abg=# SELECT title, author
abg-# FROM books
abg-# FULL JOIN authors ON authors.id = books.author_id;
ERROR:  column books.author_id does not exist
LINE 3: FULL JOIN authors ON authors.id = books.author_id;
                                          ^
abg=# select title, author from books full join authors on authors.id = books.id;
ERROR:  column "author" does not exist
LINE 1: select title, author from books full join authors on authors...
                      ^
abg=# select books.title, authors.author from books full join authors on (authors.id = books.id);
ERROR:  column authors.author does not exist
LINE 1: select books.title, authors.author from books full join auth...
                            ^
abg=# select a.id as author_id, a.name as author_name, b.id as book_id, b.title as book_title, g.genre as genre_name
abg-# from authors as a 
abg-# join authors_books as ab on a.id = ab.author_id
abg-# join books as b on ab.book_id = b.id
abg-# join genres as g on b.genre_id = g_id;
ERROR:  column "g_id" does not exist
LINE 5: join genres as g on b.genre_id = g_id;
                                         ^
abg=# select a.id as author_id, a.name as author_name, b.id as book_id, b.title as book_title, g.genre as genre_name
from authors as a
join authors_books as ab on a.id = ab.author_id
join books as b on ab.book_id = b.id
join genres as g on b.genre_id = g.id;
abg-# ;
ERROR:  missing FROM-clause entry for table "a"
LINE 1: select a.id as author_id, a.name as author_name, b.id as boo...
               ^
abg=# select a.id as author_id, a.name as author_name, b.id as book_id, b.title as book_title, g.genre as genre_name
abg-# from authors as a
abg-# join authors_books as ab on a.id = ab.author_id
abg-# join books as b on ab.book_id = b.id
abg-# join genres as g on b.genre_id = g.id;
 author_id |   author_name    | book_id |     book_title      | genre_name 
-----------+------------------+---------+---------------------+------------
         1 | Френк Герберт    |       4 | Дюна                | SF
         2 | Михайло Булгаков |       1 | Майстер і Маргарита | novels
         3 | Джек Лондон      |       3 | Білий клик          | story
(3 rows)

abg=# 
