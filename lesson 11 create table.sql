Last login: Sat May 20 20:55:27 on ttys002
/Library/PostgreSQL/15/scripts/runpsql.sh; exit
aleksandrsapoznikov@MacBook-Air-Aleksandr ~ % /Library/PostgreSQL/15/scripts/runpsql.sh; exit
Server [localhost]: 
Database [postgres]: 
Port [5432]: 
Username [postgres]: 
Password for user postgres: 
psql (15.3)
Type "help" for help.

postgres=# \l
                                            List of databases
   Name    |  Owner   | Encoding | Collate | Ctype | ICU Locale | Locale Provider |   Access privileges   
-----------+----------+----------+---------+-------+------------+-----------------+-----------------------
 postgres  | postgres | UTF8     | C       | C     |            | libc            | 
 template0 | postgres | UTF8     | C       | C     |            | libc            | =c/postgres          +
           |          |          |         |       |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | C       | C     |            | libc            | =c/postgres          +
           |          |          |         |       |            |                 | postgres=CTc/postgres
(3 rows)

postgres=# create database films;
CREATE DATABASE
postgres=# \c films
You are now connected to database "films" as user "postgres".
films=# create table actor (id serial, name varchar(100) not null default 'Tom';
films(# );
ERROR:  syntax error at or near ";"
LINE 1: ... actor (id serial, name varchar(100) not null default 'Tom';
                                                                      ^
films=# create table actor (id serial, name varchar(100) not null default 'Tom');
CREATE TABLE
films=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner   
--------+--------------+----------+----------
 public | actor        | table    | postgres
 public | actor_id_seq | sequence | postgres
(2 rows)

films=# \d actor
                                    Table "public.actor"
 Column |          Type          | Collation | Nullable |              Default              
--------+------------------------+-----------+----------+-----------------------------------
 id     | integer                |           | not null | nextval('actor_id_seq'::regclass)
 name   | character varying(100) |           | not null | 'Tom'::character varying

films=# alter table actor add column lastname varchar(100) not null default 'Cruz';
ALTER TABLE
films=# \d actor
                                     Table "public.actor"
  Column  |          Type          | Collation | Nullable |              Default              
----------+------------------------+-----------+----------+-----------------------------------
 id       | integer                |           | not null | nextval('actor_id_seq'::regclass)
 name     | character varying(100) |           | not null | 'Tom'::character varying
 lastname | character varying(100) |           | not null | 'Cruz'::character varying

films=# insert into actor (name) values ('Tom');
INSERT 0 1
films=# select * from actor;
 id | name | lastname 
----+------+----------
  1 | Tom  | Cruz
(1 row)

films=# insert into actor (name) values ('Adam');
INSERT 0 1
films=# select * from actor;
 id | name | lastname 
----+------+----------
  1 | Tom  | Cruz
  2 | Adam | Cruz
(2 rows)

films=# insert into actor (lastname) values ('Sandler');
INSERT 0 1
films=# select * from actor;
 id | name | lastname 
----+------+----------
  1 | Tom  | Cruz
  2 | Adam | Cruz
  3 | Tom  | Sandler
(3 rows)

films=# drop table actor;
DROP TABLE
films=# \d
Did not find any relations.
films=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# \c films
You are now connected to database "films" as user "postgres".
films=# create table actor (id serial, Name varchar(100), not null 'Adam');
ERROR:  syntax error at or near "not"
LINE 1: create table actor (id serial, Name varchar(100), not null '...
                                                          ^
films=# create table actor (id serial, Name varchar(100), not null default 'Adam');
ERROR:  syntax error at or near "not"
LINE 1: create table actor (id serial, Name varchar(100), not null d...
                                                          ^
films=# create table actor (id serial, Name varchar(100) not null 'Adam');
ERROR:  syntax error at or near "'Adam'"
LINE 1: ... table actor (id serial, Name varchar(100) not null 'Adam');
                                                               ^
films=# create table actor (id serial, Name varchar(100) not null default 'Adam');
CREATE TABLE
films=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner   
--------+--------------+----------+----------
 public | actor        | table    | postgres
 public | actor_id_seq | sequence | postgres
(2 rows)

films=# \d actor
                                    Table "public.actor"
 Column |          Type          | Collation | Nullable |              Default              
--------+------------------------+-----------+----------+-----------------------------------
 id     | integer                |           | not null | nextval('actor_id_seq'::regclass)
 name   | character varying(100) |           | not null | 'Adam'::character varying

films=# alter table add column Lastname varchar(100) not null default 'Sandler');
ERROR:  syntax error at or near "column"
LINE 1: alter table add column Lastname varchar(100) not null defaul...
                        ^
films=# alter table actor add column Lastname varchar(100) not null default 'Sandler');
ERROR:  syntax error at or near ")"
LINE 1: ...dd column Lastname varchar(100) not null default 'Sandler');
                                                                     ^
films=# alter table actor add column Lastname varchar(100) not null default 'Sandler';
ALTER TABLE
films=# \d actor
                                     Table "public.actor"
  Column  |          Type          | Collation | Nullable |              Default              
----------+------------------------+-----------+----------+-----------------------------------
 id       | integer                |           | not null | nextval('actor_id_seq'::regclass)
 name     | character varying(100) |           | not null | 'Adam'::character varying
 lastname | character varying(100) |           | not null | 'Sandler'::character varying

films=# create table Film (id serial, Name varchar(100) not null default 'Break into the NBA');
CREATE TABLE
films=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner   
--------+--------------+----------+----------
 public | actor        | table    | postgres
 public | actor_id_seq | sequence | postgres
 public | film         | table    | postgres
 public | film_id_seq  | sequence | postgres
(4 rows)

films=# \d film
                                       Table "public.film"
 Column |          Type          | Collation | Nullable |                 Default                 
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('film_id_seq'::regclass)
 name   | character varying(100) |           | not null | 'Break into the NBA'::character varying

films=# alter table film add column genre varchar(100) not null default 'Sport';
ALTER TABLE
films=# \d film
                                       Table "public.film"
 Column |          Type          | Collation | Nullable |                 Default                 
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('film_id_seq'::regclass)
 name   | character varying(100) |           | not null | 'Break into the NBA'::character varying
 genre  | character varying(100) |           | not null | 'Sport'::character varying

films=# create table producer (id serial, Name varchar(100) not null default 'Jeremiah');
CREATE TABLE
films=# \d 
               List of relations
 Schema |      Name       |   Type   |  Owner   
--------+-----------------+----------+----------
 public | actor           | table    | postgres
 public | actor_id_seq    | sequence | postgres
 public | film            | table    | postgres
 public | film_id_seq     | sequence | postgres
 public | producer        | table    | postgres
 public | producer_id_seq | sequence | postgres
(6 rows)

films=# \d producer
                                    Table "public.producer"
 Column |          Type          | Collation | Nullable |               Default                
--------+------------------------+-----------+----------+--------------------------------------
 id     | integer                |           | not null | nextval('producer_id_seq'::regclass)
 name   | character varying(100) |           | not null | 'Jeremiah'::character varying

films=# alter table producer add column Lastname varchar(100) noy null default 'Zagar';
ERROR:  syntax error at or near "noy"
LINE 1: ...r table producer add column Lastname varchar(100) noy null d...
                                                             ^
films=# alter table producer add column Lastname varchar(100) not null default 'Zagar';
ALTER TABLE
films=# \d producer
                                     Table "public.producer"
  Column  |          Type          | Collation | Nullable |               Default                
----------+------------------------+-----------+----------+--------------------------------------
 id       | integer                |           | not null | nextval('producer_id_seq'::regclass)
 name     | character varying(100) |           | not null | 'Jeremiah'::character varying
 lastname | character varying(100) |           | not null | 'Zagar'::character varying

films=# 
