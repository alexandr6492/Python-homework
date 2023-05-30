
select a.id as author_id, a.name as author_name, b.id as book_id, b.title as book_title, g.genre as genre_name
from authors as a
join authors_books as ab on a.id = ab.author_id
join books as b on ab.book_id = b.id
join genres as g on b.genre_id = g.id;


 author_id |   author_name    | book_id |     book_title      | genre_name 
-----------+------------------+---------+---------------------+------------
         1 | Френк Герберт    |       4 | Дюна                | SF
         2 | Михайло Булгаков |       1 | Майстер і Маргарита | novels
         3 | Джек Лондон      |       3 | Білий клик          | story
(3 rows)


