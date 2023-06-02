
# Task 1 

insert into users (id, name, pwd, email, gender) values

(1, 'Vasya', '21341234qwfsdf', 'mmm@mmail.com', 'm'),
(2, 'Alex', '21341234', 'mmm@gmail.com', 'm'),
(3, 'Alexey', 'qq21341234Q', 'alexey@gmail.com', 'm'),
(4, 'Helen', 'MarryMeeee', 'hell@gmail.com', 'f'),
(5, 'Jenny', 'SmakeMyb', 'eachup@gmail.com', 'f'),
(6, 'Lora', 'burn23', 'tpicks@gmail.com', 'f');

INSERT 0 6

select * from users;


 id |  name  |      pwd       |      email       | gender 
----+--------+----------------+------------------+--------
  1 | Vasya  | 21341234qwfsdf | mmm@mmail.com    | m
  2 | Alex   | 21341234       | mmm@gmail.com    | m
  3 | Alexey | qq21341234Q    | alexey@gmail.com | m
  4 | Helen  | MarryMeeee     | hell@gmail.com   | f
  5 | Jenny  | SmakeMyb       | eachup@gmail.com | f
  6 | Lora   | burn23         | tpicks@gmail.com | f
(6 rows)



# Task 2 

select CONCAT

('This is ', name, ', ', 

CASE when gender = 'm' 

then 'he' else 'she' END, ' has email', email) as info from users;


                     info                     
----------------------------------------------
 This is Vasya, he has emailmmm@mmail.com
 This is Alex, he has emailmmm@gmail.com
 This is Alexey, he has emailalexey@gmail.com
 This is Helen, she has emailhell@gmail.com
 This is Jenny, she has emaileachup@gmail.com
 This is Lora, she has emailtpicks@gmail.com
(6 rows)


        

# Task 3 

WITH boys AS (
        SELECT COUNT(*) AS boys_count FROM users WHERE gender = 'm'
), girls AS (
        SELECT COUNT(*) AS girls_count FROM users WHERE gender = 'f'
)
        SELECT 'Gender information:' AS header
UNION ALL
        SELECT CONCAT('We have ', boys_count, ' boys!') AS boys_info FROM boys
UNION ALL
        SELECT CONCAT('We have ', girls_count, ' girls!') AS girls_info FROM girls;


       header        
---------------------
 Gender information:
 We have 3 boys!
 We have 3 girls!
(3 rows)




# Task 5

SELECT v.name, COUNT(w.word) AS words
FROM vocabulary v
JOIN word w ON v.id = w.vocabulary_id
GROUP BY v.name;


  name   | words 
---------+-------
 animals |    10
 school  |    10
 SF      |    10
 human   |    10
 nature  |    10
(5 rows)



