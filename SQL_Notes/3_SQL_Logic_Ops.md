# SQL
### This Page Of Notes Covers The Following:
    - Logical Operators
    - 1:Many
    - Many:Many
    - Instagram Database Clone
    - Working With Lots of Instagram Data

***********************************************

## LOGIC OPERATORS

[MySQL Operators](https://dev.mysql.com/doc/refman/8.0/en/non-typed-operators.html)

**********************************************************************************

### NOT EQUAL ( != )

----------------------------------

    mysql> SELECT title, released_year FROM books WHERE released_year = 2017;
    +----------------------+---------------+
    | title                | released_year |
    +----------------------+---------------+
    | Lincoln In The Bardo |          2017 |
    +----------------------+---------------+
    1 row in set (0.00 sec)

    mysql> SELECT title FROM books WHERE released_year != 2017;                                                                                     
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
    | The Namesake                                        |
    | Norse Mythology                                     |
    | American Gods                                       |
    | Interpreter of Maladies                             |
    | A Hologram for the King: A Novel                    |
    | The Circle                                          |
    | The Amazing Adventures of Kavalier & Clay           |
    | Just Kids                                           |
    | A Heartbreaking Work of Staggering Genius           |
    | Coraline                                            |
    | What We Talk About When We Talk About Love: Stories |
    | Where I'm Calling From: Selected Stories            |
    | White Noise                                         |
    | Cannery Row                                         |
    | Oblivion: Stories                                   |
    | Consider the Lobster                                |
    | 10% Happier                                         |
    | fake_book                                           |
    +-----------------------------------------------------+
    18 rows in set (0.00 sec)

    mysql> SELECT title, author_lname FROM books;                                                                                           
    +-----------------------------------------------------+----------------+
    | title                                               | author_lname   |
    +-----------------------------------------------------+----------------+
    | The Namesake                                        | Lahiri         |
    | Norse Mythology                                     | Gaiman         |
    | American Gods                                       | Gaiman         |
    | Interpreter of Maladies                             | Lahiri         |
    | A Hologram for the King: A Novel                    | Eggers         |
    | The Circle                                          | Eggers         |
    | The Amazing Adventures of Kavalier & Clay           | Chabon         |
    | Just Kids                                           | Smith          |
    | A Heartbreaking Work of Staggering Genius           | Eggers         |
    | Coraline                                            | Gaiman         |
    | What We Talk About When We Talk About Love: Stories | Carver         |
    | Where I'm Calling From: Selected Stories            | Carver         |
    | White Noise                                         | DeLillo        |
    | Cannery Row                                         | Steinbeck      |
    | Oblivion: Stories                                   | Foster Wallace |
    | Consider the Lobster                                | Foster Wallace |
    | 10% Happier                                         | Harris         |
    | fake_book                                           | Harris         |
    | Lincoln In The Bardo                                | Saunders       |
    +-----------------------------------------------------+----------------+
    19 rows in set (0.00 sec)

    mysql> SELECT title, author_lname FROM books;                                                                                           
    +-----------------------------------------------------+----------------+
    | title                                               | author_lname   |
    +-----------------------------------------------------+----------------+
    | The Namesake                                        | Lahiri         |
    | Norse Mythology                                     | Gaiman         |
    | American Gods                                       | Gaiman         |
    | Interpreter of Maladies                             | Lahiri         |
    | A Hologram for the King: A Novel                    | Eggers         |
    | The Circle                                          | Eggers         |
    | The Amazing Adventures of Kavalier & Clay           | Chabon         |
    | Just Kids                                           | Smith          |
    | A Heartbreaking Work of Staggering Genius           | Eggers         |
    | Coraline                                            | Gaiman         |
    | What We Talk About When We Talk About Love: Stories | Carver         |
    | Where I'm Calling From: Selected Stories            | Carver         |
    | White Noise                                         | DeLillo        |
    | Cannery Row                                         | Steinbeck      |
    | Oblivion: Stories                                   | Foster Wallace |
    | Consider the Lobster                                | Foster Wallace |
    | 10% Happier                                         | Harris         |
    | fake_book                                           | Harris         |
    | Lincoln In The Bardo                                | Saunders       |
    +-----------------------------------------------------+----------------+
    19 rows in set (0.00 sec)

    mysql> SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
    +-------------+--------------+
    | title       | author_lname |
    +-------------+--------------+
    | 10% Happier | Harris       |
    | fake_book   | Harris       |
    +-------------+--------------+
    2 rows in set (0.00 sec)

    mysql> SELECT title, author_lname FROM books WHERE author_lname != 'Harris';                                                                    
    +-----------------------------------------------------+----------------+
    | title                                               | author_lname   |
    +-----------------------------------------------------+----------------+
    | The Namesake                                        | Lahiri         |
    | Norse Mythology                                     | Gaiman         |
    | American Gods                                       | Gaiman         |
    | Interpreter of Maladies                             | Lahiri         |
    | A Hologram for the King: A Novel                    | Eggers         |
    | The Circle                                          | Eggers         |
    | The Amazing Adventures of Kavalier & Clay           | Chabon         |
    | Just Kids                                           | Smith          |
    | A Heartbreaking Work of Staggering Genius           | Eggers         |
    | Coraline                                            | Gaiman         |
    | What We Talk About When We Talk About Love: Stories | Carver         |
    | Where I'm Calling From: Selected Stories            | Carver         |
    | White Noise                                         | DeLillo        |
    | Cannery Row                                         | Steinbeck      |
    | Oblivion: Stories                                   | Foster Wallace |
    | Consider the Lobster                                | Foster Wallace |
    | Lincoln In The Bardo                                | Saunders       |
    +-----------------------------------------------------+----------------+
    17 rows in set (0.00 sec)

****************************************************************

### NOT LIKE

[Not Like](https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html#operator_not-like)

-------------------------------------------------------------

    mysql> SELECT title FROM books WHERE title LIKE 'W%';
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
    | What We Talk About When We Talk About Love: Stories |
    | Where I'm Calling From: Selected Stories            |
    | White Noise                                         |
    +-----------------------------------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT title FROM books WHERE title LIKE '%W%';
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
    | A Heartbreaking Work of Staggering Genius           |
    | What We Talk About When We Talk About Love: Stories |
    | Where I'm Calling From: Selected Stories            |
    | White Noise                                         |
    | Cannery Row                                         |
    +-----------------------------------------------------+
    5 rows in set (0.00 sec)

    mysql> SELECT title FROM books WHERE title NOT LIKE 'W%';                                                                                       
    +-------------------------------------------+
    | title                                     |
    +-------------------------------------------+
    | The Namesake                              |
    | Norse Mythology                           |
    | American Gods                             |
    | Interpreter of Maladies                   |
    | A Hologram for the King: A Novel          |
    | The Circle                                |
    | The Amazing Adventures of Kavalier & Clay |
    | Just Kids                                 |
    | A Heartbreaking Work of Staggering Genius |
    | Coraline                                  |
    | Cannery Row                               |
    | Oblivion: Stories                         |
    | Consider the Lobster                      |
    | 10% Happier                               |
    | fake_book                                 |
    | Lincoln In The Bardo                      |
    +-------------------------------------------+
    16 rows in set (0.00 sec)

    mysql> SELECT title FROM books WHERE title NOT LIKE '%W%';                                                                                      
    +-------------------------------------------+
    | title                                     |
    +-------------------------------------------+
    | The Namesake                              |
    | Norse Mythology                           |
    | American Gods                             |
    | Interpreter of Maladies                   |
    | A Hologram for the King: A Novel          |
    | The Circle                                |
    | The Amazing Adventures of Kavalier & Clay |
    | Just Kids                                 |
    | Coraline                                  |
    | Oblivion: Stories                         |
    | Consider the Lobster                      |
    | 10% Happier                               |
    | fake_book                                 |
    | Lincoln In The Bardo                      |
    +-------------------------------------------+
    14 rows in set (0.00 sec)

********************************************

### GREATER THAN

- [Greater Than (>)](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_greater-than)
- [Greater Than or Equal To (>=)](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_greater-than-or-equal)

-----------------------------------------

    mysql> SELECT title, released_year FROM books ORDER BY released_year;
    +-----------------------------------------------------+---------------+
    | title                                               | released_year |
    +-----------------------------------------------------+---------------+
    | Cannery Row                                         |          1945 |
    | What We Talk About When We Talk About Love: Stories |          1981 |
    | White Noise                                         |          1985 |
    | Where I'm Calling From: Selected Stories            |          1989 |
    | Interpreter of Maladies                             |          1996 |
    | The Amazing Adventures of Kavalier & Clay           |          2000 |
    | American Gods                                       |          2001 |
    | fake_book                                           |          2001 |
    | A Heartbreaking Work of Staggering Genius           |          2001 |
    | The Namesake                                        |          2003 |
    | Coraline                                            |          2003 |
    | Oblivion: Stories                                   |          2004 |
    | Consider the Lobster                                |          2005 |
    | Just Kids                                           |          2010 |
    | A Hologram for the King: A Novel                    |          2012 |
    | The Circle                                          |          2013 |
    | 10% Happier                                         |          2014 |
    | Norse Mythology                                     |          2016 |
    | Lincoln In The Bardo                                |          2017 |
    +-----------------------------------------------------+---------------+
    19 rows in set (0.00 sec)

    mysql> SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;                                               
    +-------------------------------------------+---------------+
    | title                                     | released_year |
    +-------------------------------------------+---------------+
    | A Heartbreaking Work of Staggering Genius |          2001 |
    | fake_book                                 |          2001 |
    | American Gods                             |          2001 |
    | Coraline                                  |          2003 |
    | The Namesake                              |          2003 |
    | Oblivion: Stories                         |          2004 |
    | Consider the Lobster                      |          2005 |
    | Just Kids                                 |          2010 |
    | A Hologram for the King: A Novel          |          2012 |
    | The Circle                                |          2013 |
    | 10% Happier                               |          2014 |
    | Norse Mythology                           |          2016 |
    | Lincoln In The Bardo                      |          2017 |
    +-------------------------------------------+---------------+
    13 rows in set (0.00 sec)

    mysql> SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;                                               
    +-------------------------------------------+---------------+
    | title                                     | released_year |
    +-------------------------------------------+---------------+
    | The Amazing Adventures of Kavalier & Clay |          2000 |
    | A Heartbreaking Work of Staggering Genius |          2001 |
    | fake_book                                 |          2001 |
    | American Gods                             |          2001 |
    | Coraline                                  |          2003 |
    | The Namesake                              |          2003 |
    | Oblivion: Stories                         |          2004 |
    | Consider the Lobster                      |          2005 |
    | Just Kids                                 |          2010 |
    | A Hologram for the King: A Novel          |          2012 |
    | The Circle                                |          2013 |
    | 10% Happier                               |          2014 |
    | Norse Mythology                           |          2016 |
    | Lincoln In The Bardo                      |          2017 |
    +-------------------------------------------+---------------+
    14 rows in set (0.00 sec)

    mysql> SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;
    +-------------------------------------------+----------------+
    | title                                     | stock_quantity |
    +-------------------------------------------+----------------+
    | A Hologram for the King: A Novel          |            154 |
    | A Heartbreaking Work of Staggering Genius |            104 |
    | Coraline                                  |            100 |
    | Oblivion: Stories                         |            172 |
    | fake_book                                 |            287 |
    | Lincoln In The Bardo                      |           1000 |
    +-------------------------------------------+----------------+
    6 rows in set (0.00 sec)

***With > & >= it's looking for a boolean value (True or False value).***

    mysql> SELECT 99 > 1;
    +--------+
    | 99 > 1 |
    +--------+
    |      1 |
    +--------+
    1 row in set (0.00 sec)

    mysql> SELECT 99 > 567;
    +----------+
    | 99 > 567 |
    +----------+
    |        0 |
    +----------+
    1 row in set (0.00 sec)

**************************************************************

### LESS THAN

[Less Than (<)](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_less-than)
[Less Than or Equal To (<=)](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_less-than-or-equal)

------------------------------------------------------------

    mysql> SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;                                                
    +-----------------------------------------------------+---------------+
    | title                                               | released_year |
    +-----------------------------------------------------+---------------+
    | Cannery Row                                         |          1945 |
    | What We Talk About When We Talk About Love: Stories |          1981 |
    | White Noise                                         |          1985 |
    | Where I'm Calling From: Selected Stories            |          1989 |
    | Interpreter of Maladies                             |          1996 |
    +-----------------------------------------------------+---------------+
    5 rows in set (0.00 sec)

    mysql> SELECT title, released_year FROM books WHERE released_year <= 2000 ORDER BY released_year;                                               
    +-----------------------------------------------------+---------------+
    | title                                               | released_year |
    +-----------------------------------------------------+---------------+
    | Cannery Row                                         |          1945 |
    | What We Talk About When We Talk About Love: Stories |          1981 |
    | White Noise                                         |          1985 |
    | Where I'm Calling From: Selected Stories            |          1989 |
    | Interpreter of Maladies                             |          1996 |
    | The Amazing Adventures of Kavalier & Clay           |          2000 |
    +-----------------------------------------------------+---------------+
    6 rows in set (0.00 sec)

**************************************************************

### Logical AND

- [Logical And (&&)](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html#operator_and)
- Can be typed as 'AND' or '&&'

-------------------------------------------------------

    mysql> SELECT * FROM books WHERE author_lname='Eggers';
    +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
    | book_id | title                                     | author_fname | author_lname | released_year | stock_quantity | pages |
    +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
    |       5 | A Hologram for the King: A Novel          | Dave         | Eggers       |          2012 |            154 |   352 |
    |       6 | The Circle                                | Dave         | Eggers       |          2013 |             26 |   504 |
    |       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers       |          2001 |            104 |   437 |
    +---------+-------------------------------------------+--------------+--------------+---------------+----------------+-------+
    3 rows in set (0.00 sec)

    mysql> SELECT * FROM books WHERE released_year>2010;
    +---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
    | book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
    +---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
    |       2 | Norse Mythology                  | Neil         | Gaiman       |          2016 |             43 |   304 |
    |       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
    |       6 | The Circle                       | Dave         | Eggers       |          2013 |             26 |   504 |
    |      17 | 10% Happier                      | Dan          | Harris       |          2014 |             29 |   256 |
    |      19 | Lincoln In The Bardo             | George       | Saunders     |          2017 |           1000 |   367 |
    +---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
    5 rows in set (0.00 sec)

    mysql> SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
    +---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
    | book_id | title                            | author_fname | author_lname | released_year | stock_quantity | pages |
    +---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
    |       5 | A Hologram for the King: A Novel | Dave         | Eggers       |          2012 |            154 |   352 |
    |       6 | The Circle                       | Dave         | Eggers       |          2013 |             26 |   504 |
    +---------+----------------------------------+--------------+--------------+---------------+----------------+-------+
    2 rows in set (0.00 sec)

    mysql> SELECT title AS Title, author_lname AS Author, released_year AS Year FROM books WHERE author_lname = 'Eggers' && released_year > 2010;
    +----------------------------------+--------+------+
    | Title                            | Author | Year |
    +----------------------------------+--------+------+
    | A Hologram for the King: A Novel | Eggers | 2012 |
    | The Circle                       | Eggers | 2013 |
    +----------------------------------+--------+------+
    2 rows in set (0.00 sec)

    mysql> SELECT title AS TItle, author_lname AS Author, released_year AS Year FROM books WHERE author_lname = 'Eggers' && released_year > 2010 AND title LIKE '%novel%';
    +----------------------------------+--------+------+
    | TItle                            | Author | Year |
    +----------------------------------+--------+------+
    | A Hologram for the King: A Novel | Eggers | 2012 |
    +----------------------------------+--------+------+
    1 row in set (0.00 sec)
    
***Not limited to two conditions***

*************************************************************

### Logical OR

- [Logical Or (||)](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html#operator_or)
- Can be typed as 'OR' or '||'

------------------------------------------------------------

    mysql> SELECT title AS Title, author_lname AS Author, released_year AS Year FROM books WHERE author_lname = 'Eggers' || released_year > 2010;   +-------------------------------------------+----------+------+
    | Title                                     | Author   | Year |
    +-------------------------------------------+----------+------+
    | Norse Mythology                           | Gaiman   | 2016 |
    | A Hologram for the King: A Novel          | Eggers   | 2012 |
    | The Circle                                | Eggers   | 2013 |
    | A Heartbreaking Work of Staggering Genius | Eggers   | 2001 |
    | 10% Happier                               | Harris   | 2014 |
    | Lincoln In The Bardo                      | Saunders | 2017 |
    +-------------------------------------------+----------+------+
    6 rows in set (0.01 sec)
    
***With 'Condition 1 && Condition 2': Both sides must be equal to be true.***
***With 'Condition 1 || Condition 2': Only one side needs to be true for the whole thing to be true.***

    mysql> SELECT title AS Title, author_lname AS Author, released_year AS Year, stock_quantity AS Stock FROM books WHERE author_lname = 'Eggers' || released_year > 2010 OR stock_quantity > 100;                                                                                                 
    +-------------------------------------------+----------------+------+-------+
    | Title                                     | Author         | Year | Stock |
    +-------------------------------------------+----------------+------+-------+
    | Norse Mythology                           | Gaiman         | 2016 |    43 |
    | A Hologram for the King: A Novel          | Eggers         | 2012 |   154 |
    | The Circle                                | Eggers         | 2013 |    26 |
    | A Heartbreaking Work of Staggering Genius | Eggers         | 2001 |   104 |
    | Oblivion: Stories                         | Foster Wallace | 2004 |   172 |
    | 10% Happier                               | Harris         | 2014 |    29 |
    | fake_book                                 | Harris         | 2001 |   287 |
    | Lincoln In The Bardo                      | Saunders       | 2017 |  1000 |
    +-------------------------------------------+----------------+------+-------+
    8 rows in set (0.00 sec)

***Again, not matter how many conditions are involved, only one has to be true for the entire OR query to be true.***

**************************************************************

### BETWEEN & NOT

- [Between...AND...](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_between)
- [Not Between...AND...](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_not-between)

------------------------------------------------------------

    mysql> SELECT title AS Title, released_year AS Year FROM books;
    +-----------------------------------------------------+------+
    | Title                                               | Year |
    +-----------------------------------------------------+------+
    | The Namesake                                        | 2003 |
    | Norse Mythology                                     | 2016 |
    | American Gods                                       | 2001 |
    | Interpreter of Maladies                             | 1996 |
    | A Hologram for the King: A Novel                    | 2012 |
    | The Circle                                          | 2013 |
    | The Amazing Adventures of Kavalier & Clay           | 2000 |
    | Just Kids                                           | 2010 |
    | A Heartbreaking Work of Staggering Genius           | 2001 |
    | Coraline                                            | 2003 |
    | What We Talk About When We Talk About Love: Stories | 1981 |
    | Where I'm Calling From: Selected Stories            | 1989 |
    | White Noise                                         | 1985 |
    | Cannery Row                                         | 1945 |
    | Oblivion: Stories                                   | 2004 |
    | Consider the Lobster                                | 2005 |
    | 10% Happier                                         | 2014 |
    | fake_book                                           | 2001 |
    | Lincoln In The Bardo                                | 2017 |
    +-----------------------------------------------------+------+
    19 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year >= 2004 && released_year <= 2015 ORDER BY released_year;
    +----------------------------------+------+
    | Title                            | Year |
    +----------------------------------+------+
    | Oblivion: Stories                | 2004 |
    | Consider the Lobster             | 2005 |
    | Just Kids                        | 2010 |
    | A Hologram for the King: A Novel | 2012 |
    | The Circle                       | 2013 |
    | 10% Happier                      | 2014 |
    +----------------------------------+------+
    6 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year BETWEEN 2004 AND  2015 ORDER BY released_year;               
    +----------------------------------+------+
    | Title                            | Year |
    +----------------------------------+------+
    | Oblivion: Stories                | 2004 |
    | Consider the Lobster             | 2005 |
    | Just Kids                        | 2010 |
    | A Hologram for the King: A Novel | 2012 |
    | The Circle                       | 2013 |
    | 10% Happier                      | 2014 |
    +----------------------------------+------+
    6 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;            
    +-----------------------------------------------------+------+
    | Title                                               | Year |
    +-----------------------------------------------------+------+
    | Cannery Row                                         | 1945 |
    | What We Talk About When We Talk About Love: Stories | 1981 |
    | White Noise                                         | 1985 |
    | Where I'm Calling From: Selected Stories            | 1989 |
    | Interpreter of Maladies                             | 1996 |
    | The Amazing Adventures of Kavalier & Clay           | 2000 |
    | A Heartbreaking Work of Staggering Genius           | 2001 |
    | American Gods                                       | 2001 |
    | fake_book                                           | 2001 |
    | The Namesake                                        | 2003 |
    | Coraline                                            | 2003 |
    | Norse Mythology                                     | 2016 |
    | Lincoln In The Bardo                                | 2017 |
    +-----------------------------------------------------+------+
    13 rows in set (0.00 sec)

---------------------------------------

- [CAST()](https://dev.mysql.com/doc/refman/8.0/en/cast-functions.html#function_cast)

---------------------------------------

    mysql> SELECT CAST('2017-05-02' AS DATETIME);                                                                                                   
    +--------------------------------+
    | CAST('2017-05-02' AS DATETIME) |
    +--------------------------------+
    | 2017-05-02 00:00:00            |
    +--------------------------------+
    1 row in set (0.00 sec)

    mysql> use date_time_app;
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A

    Database changed
    mysql> SELECT * FROM people;
    +---------+------------+-----------+---------------------+
    | name    | birthdate  | birthtime | birthdt             |
    +---------+------------+-----------+---------------------+
    | Padma   | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
    | Larry   | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
    | Toaster | 2017-04-21 | 19:12:43  | 2017-04-21 19:12:43 |
    +---------+------------+-----------+---------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name AS Name, birthdt AS Birthdate FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
    +-------+---------------------+
    | Name  | Birthdate           |
    +-------+---------------------+
    | Padma | 1983-11-11 10:07:35 |
    +-------+---------------------+
    1 row in set (0.00 sec)

    mysql> SELECT name AS Name, birthdt AS Birthdate FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);
    +-------+---------------------+
    | Name  | Birthdate           |
    +-------+---------------------+
    | Padma | 1983-11-11 10:07:35 |
    +-------+---------------------+
    1 row in set (0.00 sec)

***The later is the appropriate way to look it up, even though MySQL is smart enough to understand what is being requested***

*****************************************************

### IN and NOT IN

- [IN](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_in)
- [NOT IN](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#function_not-in)

---------------------------------------------------

    mysql> SELECT title AS Title, author_lname AS Author FROM books WHERE author_lname='Carver' || author_lname='LAHIRI' || author_lname='smith';
    +-----------------------------------------------------+--------+
    | Title                                               | Author |
    +-----------------------------------------------------+--------+
    | The Namesake                                        | Lahiri |
    | Interpreter of Maladies                             | Lahiri |
    | Just Kids                                           | Smith  |
    | What We Talk About When We Talk About Love: Stories | Carver |
    | Where I'm Calling From: Selected Stories            | Carver |
    +-----------------------------------------------------+--------+
    5 rows in set (0.00 sec)

    mysql> SELECT title AS Title, author_lname AS Author FROM books WHERE author_lname IN ('Carver', 'LAHIRI', 'smith');
    +-----------------------------------------------------+--------+
    | Title                                               | Author |
    +-----------------------------------------------------+--------+
    | The Namesake                                        | Lahiri |
    | Interpreter of Maladies                             | Lahiri |
    | Just Kids                                           | Smith  |
    | What We Talk About When We Talk About Love: Stories | Carver |
    | Where I'm Calling From: Selected Stories            | Carver |
    +-----------------------------------------------------+--------+
    5 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year IN (2017, 1985);
    +----------------------+------+
    | Title                | Year |
    +----------------------+------+
    | White Noise          | 1985 |
    | Lincoln In The Bardo | 2017 |
    +----------------------+------+
    2 rows in set (0.00 sec)

    mysql> SELECT title AS Title, author_lname AS Author FROM books WHERE author_lname NOT IN ('Carver', 'LAHIRI', 'smith');                        
    +-------------------------------------------+----------------+
    | Title                                     | Author         |
    +-------------------------------------------+----------------+
    | Norse Mythology                           | Gaiman         |
    | American Gods                             | Gaiman         |
    | A Hologram for the King: A Novel          | Eggers         |
    | The Circle                                | Eggers         |
    | The Amazing Adventures of Kavalier & Clay | Chabon         |
    | A Heartbreaking Work of Staggering Genius | Eggers         |
    | Coraline                                  | Gaiman         |
    | White Noise                               | DeLillo        |
    | Cannery Row                               | Steinbeck      |
    | Oblivion: Stories                         | Foster Wallace |
    | Consider the Lobster                      | Foster Wallace |
    | 10% Happier                               | Harris         |
    | fake_book                                 | Harris         |
    | Lincoln In The Bardo                      | Saunders       |
    +-------------------------------------------+----------------+
    14 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018) ORDER BY released_year;
    +-----------------------------------------------------+------+
    | Title                                               | Year |
    +-----------------------------------------------------+------+
    | Cannery Row                                         | 1945 |
    | What We Talk About When We Talk About Love: Stories | 1981 |
    | White Noise                                         | 1985 |
    | Where I'm Calling From: Selected Stories            | 1989 |
    | Interpreter of Maladies                             | 1996 |
    | American Gods                                       | 2001 |
    | fake_book                                           | 2001 |
    | A Heartbreaking Work of Staggering Genius           | 2001 |
    | The Namesake                                        | 2003 |
    | Coraline                                            | 2003 |
    | Consider the Lobster                                | 2005 |
    | The Circle                                          | 2013 |
    | Lincoln In The Bardo                                | 2017 |
    +-----------------------------------------------------+------+
    13 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year >= 2000 && released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018) ORDER BY released_year;                                                                                         
    +-------------------------------------------+------+
    | Title                                     | Year |
    +-------------------------------------------+------+
    | American Gods                             | 2001 |
    | A Heartbreaking Work of Staggering Genius | 2001 |
    | fake_book                                 | 2001 |
    | The Namesake                              | 2003 |
    | Coraline                                  | 2003 |
    | Consider the Lobster                      | 2005 |
    | The Circle                                | 2013 |
    | Lincoln In The Bardo                      | 2017 |
    +-------------------------------------------+------+
    8 rows in set (0.00 sec)

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year >= 2000 && released_year % 2 != 0 ORDER BY released_year;
    +-------------------------------------------+------+
    | Title                                     | Year |
    +-------------------------------------------+------+
    | American Gods                             | 2001 |
    | A Heartbreaking Work of Staggering Genius | 2001 |
    | fake_book                                 | 2001 |
    | The Namesake                              | 2003 |
    | Coraline                                  | 2003 |
    | Consider the Lobster                      | 2005 |
    | The Circle                                | 2013 |
    | Lincoln In The Bardo                      | 2017 |
    +-------------------------------------------+------+
    8 rows in set (0.01 sec)

********************************************************

### CASE statement

- [CASE Syntax](https://dev.mysql.com/doc/refman/5.7/en/case.html)

----------------------------------------------------

    mysql> SELECT title AS Title, released_year AS Year, CASE WHEN released_year >= 2000 THEN 'Modern Lit' ELSE '20th Century Lit' END AS Era FROM books;
    +-----------------------------------------------------+------+------------------+
    | Title                                               | Year | Era              |
    +-----------------------------------------------------+------+------------------+
    | The Namesake                                        | 2003 | Modern Lit       |
    | Norse Mythology                                     | 2016 | Modern Lit       |
    | American Gods                                       | 2001 | Modern Lit       |
    | Interpreter of Maladies                             | 1996 | 20th Century Lit |
    | A Hologram for the King: A Novel                    | 2012 | Modern Lit       |
    | The Circle                                          | 2013 | Modern Lit       |
    | The Amazing Adventures of Kavalier & Clay           | 2000 | Modern Lit       |
    | Just Kids                                           | 2010 | Modern Lit       |
    | A Heartbreaking Work of Staggering Genius           | 2001 | Modern Lit       |
    | Coraline                                            | 2003 | Modern Lit       |
    | What We Talk About When We Talk About Love: Stories | 1981 | 20th Century Lit |
    | Where I'm Calling From: Selected Stories            | 1989 | 20th Century Lit |
    | White Noise                                         | 1985 | 20th Century Lit |
    | Cannery Row                                         | 1945 | 20th Century Lit |
    | Oblivion: Stories                                   | 2004 | Modern Lit       |
    | Consider the Lobster                                | 2005 | Modern Lit       |
    | 10% Happier                                         | 2014 | Modern Lit       |
    | fake_book                                           | 2001 | Modern Lit       |
    | Lincoln In The Bardo                                | 2017 | Modern Lit       |
    +-----------------------------------------------------+------+------------------+
    19 rows in set (0.00 sec)

    mysql> SELECT title as Title, stock_quantity as 'In Stock', CASE WHEN stock_quantity BETWEEN 0 AND 50 THEN '*' WHEN stock_quantity BETWEEN 51 AND 100 THEN '**' ELSE '***' END AS Stock FROM books;
    +-----------------------------------------------------+----------+-------+
    | Title                                               | In Stock | Stock |
    +-----------------------------------------------------+----------+-------+
    | The Namesake                                        |       32 | *     |
    | Norse Mythology                                     |       43 | *     |
    | American Gods                                       |       12 | *     |
    | Interpreter of Maladies                             |       97 | **    |
    | A Hologram for the King: A Novel                    |      154 | ***   |
    | The Circle                                          |       26 | *     |
    | The Amazing Adventures of Kavalier & Clay           |       68 | **    |
    | Just Kids                                           |       55 | **    |
    | A Heartbreaking Work of Staggering Genius           |      104 | ***   |
    | Coraline                                            |      100 | **    |
    | What We Talk About When We Talk About Love: Stories |       23 | *     |
    | Where I'm Calling From: Selected Stories            |       12 | *     |
    | White Noise                                         |       49 | *     |
    | Cannery Row                                         |       95 | **    |
    | Oblivion: Stories                                   |      172 | ***   |
    | Consider the Lobster                                |       92 | **    |
    | 10% Happier                                         |       29 | *     |
    | fake_book                                           |      287 | ***   |
    | Lincoln In The Bardo                                |     1000 | ***   |
    +-----------------------------------------------------+----------+-------+
    19 rows in set (0.00 sec)

    mysql> SELECT title as Title, CASE WHEN stock_quantity BETWEEN 0 AND 50 THEN '*' WHEN stock_quantity BETWEEN 51 AND 100 THEN '**' WHEN stock_quantity BETWEEN 101 AND 150 THEN '***' ELSE '****' END AS Stock FROM books;                                                                         
    +-----------------------------------------------------+-------+
    | Title                                               | Stock |
    +-----------------------------------------------------+-------+
    | The Namesake                                        | *     |
    | Norse Mythology                                     | *     |
    | American Gods                                       | *     |
    | Interpreter of Maladies                             | **    |
    | A Hologram for the King: A Novel                    | ****  |
    | The Circle                                          | *     |
    | The Amazing Adventures of Kavalier & Clay           | **    |
    | Just Kids                                           | **    |
    | A Heartbreaking Work of Staggering Genius           | ***   |
    | Coraline                                            | **    |
    | What We Talk About When We Talk About Love: Stories | *     |
    | Where I'm Calling From: Selected Stories            | *     |
    | White Noise                                         | *     |
    | Cannery Row                                         | **    |
    | Oblivion: Stories                                   | ****  |
    | Consider the Lobster                                | **    |
    | 10% Happier                                         | *     |
    | fake_book                                           | ****  |
    | Lincoln In The Bardo                                | ****  |
    +-----------------------------------------------------+-------+
    19 rows in set (0.00 sec)

    mysql> SELECT title as Title, CASE WHEN stock_quantity <= 50 THEN '*' WHEN stock_quantity <= 100 THEN '**' WHEN stock_quantity <= 150 THEN '***' ELSE '****' END AS Stock FROM books;
    +-----------------------------------------------------+-------+
    | Title                                               | Stock |
    +-----------------------------------------------------+-------+
    | The Namesake                                        | *     |
    | Norse Mythology                                     | *     |
    | American Gods                                       | *     |
    | Interpreter of Maladies                             | **    |
    | A Hologram for the King: A Novel                    | ****  |
    | The Circle                                          | *     |
    | The Amazing Adventures of Kavalier & Clay           | **    |
    | Just Kids                                           | **    |
    | A Heartbreaking Work of Staggering Genius           | ***   |
    | Coraline                                            | **    |
    | What We Talk About When We Talk About Love: Stories | *     |
    | Where I'm Calling From: Selected Stories            | *     |
    | White Noise                                         | *     |
    | Cannery Row                                         | **    |
    | Oblivion: Stories                                   | ****  |
    | Consider the Lobster                                | **    |
    | 10% Happier                                         | *     |
    | fake_book                                           | ****  |
    | Lincoln In The Bardo                                | ****  |
    +-----------------------------------------------------+-------+
    19 rows in set (0.00 sec)

***Don't have to include 'released_year' or 'stock_quantity' printed out to reference in the CASE.***
***In the CASE, do not include commas, or it will break it***

******************************************************************************
#### EXERCISES
******************************************************************************

- Evaluate the followig:

--------------------------------------

    SELECT 10 != 10;
    
        False

    SELECT 15 > 14 && 99 - 5 <= 94;
    
        True    

    SELECT 1 IN (5,3) || 9 BETWEEN 8 & 10;
    
        True


-----------------------------------------------------

- Select all Books Written Before 1980 (non inclusive)

----------------------------------------------------

    mysql> SELECT title AS Title, released_year AS Year FROM books WHERE released_year < 1980;
    +-------------+------+
    | Title       | Year |
    +-------------+------+
    | Cannery Row | 1945 |
    +-------------+------+
    1 row in set (0.00 sec)


----------------------------------------------------

- Select all books written by Eggers or Chabon

----------------------------------------------------

    mysql> SELECT title AS Title, author_lname AS Author FROM books WHERE author_lname IN ('Chabon', 'Eggers');                                      
    +-------------------------------------------+--------+
    | Title                                     | Author |
    +-------------------------------------------+--------+
    | A Hologram for the King: A Novel          | Eggers |
    | The Circle                                | Eggers |
    | The Amazing Adventures of Kavalier & Clay | Chabon |
    | A Heartbreaking Work of Staggering Genius | Eggers |
    +-------------------------------------------+--------+
    4 rows in set (0.00 sec)


----------------------------------------------------

- Select all books written by Lahiri, published after 2000

-----------------------------------------------------

    mysql> SELECT title AS Title, author_lname AS Author, released_year AS Year FROM books WHERE author_lname LIKE 'Lahiri' && released_year > 2000;
    +--------------+--------+------+
    | Title        | Author | Year |
    +--------------+--------+------+
    | The Namesake | Lahiri | 2003 |
    +--------------+--------+------+
    1 row in set (0.00 sec)


---------------------------------------------------

- Select all books with page counts between 100 & 200

---------------------------------------------------

    mysql> SELECT title AS Title, pages AS Pages FROM books WHERE pages BETWEEN 100 AND 200;
    +-----------------------------------------------------+-------+
    | Title                                               | Pages |
    +-----------------------------------------------------+-------+
    | Interpreter of Maladies                             |   198 |
    | What We Talk About When We Talk About Love: Stories |   176 |
    | Cannery Row                                         |   181 |
    +-----------------------------------------------------+-------+
    3 rows in set (0.00 sec)


--------------------------------------------------

- Select all books where author_lname starts with a 'C' or 'S'

--------------------------------------------------

    mysql> SELECT title AS Title, author_lname AS Author FROM books WHERE author_lname LIKE 'C%' || author_lname LIKE 'S%';                          
    +-----------------------------------------------------+-----------+
    | Title                                               | Author    |
    +-----------------------------------------------------+-----------+
    | The Amazing Adventures of Kavalier & Clay           | Chabon    |
    | Just Kids                                           | Smith     |
    | What We Talk About When We Talk About Love: Stories | Carver    |
    | Where I'm Calling From: Selected Stories            | Carver    |
    | Cannery Row                                         | Steinbeck |
    | Lincoln In The Bardo                                | Saunders  |
    +-----------------------------------------------------+-----------+
    6 rows in set (0.00 sec)

***Alternatives***

    mysql> SELECT title, author_lname FROM books WHERE SUBSTR(author_lname,1,1) = 'C' || SUBSTR(author_lname,1,1) = 'S';
    +-----------------------------------------------------+--------------+
    | title                                               | author_lname |
    +-----------------------------------------------------+--------------+
    | The Amazing Adventures of Kavalier & Clay           | Chabon       |
    | Just Kids                                           | Smith        |
    | What We Talk About When We Talk About Love: Stories | Carver       |
    | Where I'm Calling From: Selected Stories            | Carver       |
    | Cannery Row                                         | Steinbeck    |
    | Lincoln In The Bardo                                | Saunders     |
    +-----------------------------------------------------+--------------+
    6 rows in set (0.00 sec)

    mysql> SELECT title, author_lname FROM books WHERE SUBSTR(author_lname,1,1) IN ('C','S');
    +-----------------------------------------------------+--------------+
    | title                                               | author_lname |
    +-----------------------------------------------------+--------------+
    | The Amazing Adventures of Kavalier & Clay           | Chabon       |
    | Just Kids                                           | Smith        |
    | What We Talk About When We Talk About Love: Stories | Carver       |
    | Where I'm Calling From: Selected Stories            | Carver       |
    | Cannery Row                                         | Steinbeck    |
    | Lincoln In The Bardo                                | Saunders     |
    +-----------------------------------------------------+--------------+
    6 rows in set (0.00 sec)

--------------------------------------------------

- CASE STATEMENT: If title contains 'stories' -> Short Stories, 'Just Kids' and 'A Heartbreaking Work' -> Memoir, Everything else -> Novel

--------------------------------------------------

    mysql> SELECT title AS Title, CONCAT(author_fname, ' ', author_lname) AS Author, CASE WHEN title LIKE '%stories%' THEN 'Short Stories' WHEN title IN ('Just', 'Heartbreaking') THEN 'Memoir' ELSE 'Novel' END AS 'Genre' FROM books;                                                              
    +-----------------------------------------------------+----------------------+---------------+
    | Title                                               | Author               | Genre         |
    +-----------------------------------------------------+----------------------+---------------+
    | The Namesake                                        | Jhumpa Lahiri        | Novel         |
    | Norse Mythology                                     | Neil Gaiman          | Novel         |
    | American Gods                                       | Neil Gaiman          | Novel         |
    | Interpreter of Maladies                             | Jhumpa Lahiri        | Novel         |
    | A Hologram for the King: A Novel                    | Dave Eggers          | Novel         |
    | The Circle                                          | Dave Eggers          | Novel         |
    | The Amazing Adventures of Kavalier & Clay           | Michael Chabon       | Novel         |
    | Just Kids                                           | Patti Smith          | Novel         |
    | A Heartbreaking Work of Staggering Genius           | Dave Eggers          | Novel         |
    | Coraline                                            | Neil Gaiman          | Novel         |
    | What We Talk About When We Talk About Love: Stories | Raymond Carver       | Short Stories |
    | Where I'm Calling From: Selected Stories            | Raymond Carver       | Short Stories |
    | White Noise                                         | Don DeLillo          | Novel         |
    | Cannery Row                                         | John Steinbeck       | Novel         |
    | Oblivion: Stories                                   | David Foster Wallace | Short Stories |
    | Consider the Lobster                                | David Foster Wallace | Novel         |
    | 10% Happier                                         | Dan Harris           | Novel         |
    | fake_book                                           | Freida Harris        | Novel         |
    | Lincoln In The Bardo                                | George Saunders      | Novel         |
    +-----------------------------------------------------+----------------------+---------------+
    19 rows in set (0.00 sec)


--------------------------------------------------

- BONUS: title, author, how many they have written (properly pluralized)

--------------------------------------------------

    mysql> SELECT title AS Title, CONCAT(author_fname, ' ', author_lname) AS Author, CASE WHEN COUNT(title) = 1 THEN '1 book' WHEN COUNT(title)  = 2 THEN '2 books' ELSE '3 books' END AS 'Pubished' FROM books GROUP BY author_lname, author_fname;                                                 
    +-----------------------------------------------------+----------------------+----------+
    | Title                                               | Author               | Pubished |
    +-----------------------------------------------------+----------------------+----------+
    | What We Talk About When We Talk About Love: Stories | Raymond Carver       | 2 books  |
    | The Amazing Adventures of Kavalier & Clay           | Michael Chabon       | 1 book   |
    | White Noise                                         | Don DeLillo          | 1 book   |
    | A Hologram for the King: A Novel                    | Dave Eggers          | 3 books  |
    | Oblivion: Stories                                   | David Foster Wallace | 2 books  |
    | Norse Mythology                                     | Neil Gaiman          | 3 books  |
    | 10% Happier                                         | Dan Harris           | 1 book   |
    | fake_book                                           | Freida Harris        | 1 book   |
    | The Namesake                                        | Jhumpa Lahiri        | 2 books  |
    | Lincoln In The Bardo                                | George Saunders      | 1 book   |
    | Just Kids                                           | Patti Smith          | 1 book   |
    | Cannery Row                                         | John Steinbeck       | 1 book   |
    +-----------------------------------------------------+----------------------+----------+
    12 rows in set (0.00 sec)

***BETTER WAY***

    mysql> SELECT title AS Title, CONCAT(author_fname, ' ', author_lname) AS Author, CASE WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book') ELSE CONCAT(COUNT(*), ' books') END AS 'Pubished' FROM books GROUP BY author_lname, author_fname;                                                      
    +-----------------------------------------------------+----------------------+----------+
    | Title                                               | Author               | Pubished |
    +-----------------------------------------------------+----------------------+----------+
    | What We Talk About When We Talk About Love: Stories | Raymond Carver       | 2 books  |
    | The Amazing Adventures of Kavalier & Clay           | Michael Chabon       | 1 book   |
    | White Noise                                         | Don DeLillo          | 1 book   |
    | A Hologram for the King: A Novel                    | Dave Eggers          | 3 books  |
    | Oblivion: Stories                                   | David Foster Wallace | 2 books  |
    | Norse Mythology                                     | Neil Gaiman          | 3 books  |
    | 10% Happier                                         | Dan Harris           | 1 book   |
    | fake_book                                           | Freida Harris        | 1 book   |
    | The Namesake                                        | Jhumpa Lahiri        | 2 books  |
    | Lincoln In The Bardo                                | George Saunders      | 1 book   |
    | Just Kids                                           | Patti Smith          | 1 book   |
    | Cannery Row                                         | John Steinbeck       | 1 book   |
    +-----------------------------------------------------+----------------------+----------+
    12 rows in set (0.00 sec)

*******************************************************************************************

## ONE TOO MANY

*******************************************************************************************

### Relationships and JOINS

- Real world data is messy and interrelated
- Relation Basics:

1. One to One Relatinship
2. One to Many Relatinship
3. Many to Many Relatinship

-------------------------------------------

### 1:MANY

***Customers & Orders examples***

We want to store:

- A customer's first & last name
- A customer's email
- The date of the purchase
- The price of the order

How to store:

- One option is one large table
- Simplest approach is using two tables with 1:MANY


***CUSTOMERS***

    +-------------+------------+-----------+-----------------+
    | customer_id | first_name | last_name | email           |
    +-------------+------------+-----------+-----------------+
    | 1           | Boy        | George    | george@gmail.com|
    | 2           | George     | Michael   | gm@gmail.com    |
    | 3           | David      | Bowie     | david@gmail.com |
    | 4           | Blue       | Steele    | blue@gmail.com  |
    +-------------+------------+-----------+-----------------+

***ORDERS***

    +----------+--------------+-----------+-------------+
    | order_id | order_date   | amount    | customer_id |
    +----------+--------------+-----------+-------------+
    | 1        | '2016/02/10' | 99.99     | 1           |
    | 2        | '2017/11/11' | 35.50     | 1           |
    | 3        | '2014/12/12' | 800.97    | 2           |
    | 4        | '2015/01/03' | 12.50     | 2           |
    +----------+--------------+-----------+-------------+

---------------------------------------------------------------------

### [Foreign Keys](https://dev.mysql.com/doc/refman/8.0/en/ansi-diff-foreign-keys.html)

--------------------------------------------------------------------

    mysql> CREATE DATABASE customers_and_orders;
    Query OK, 1 row affected (0.00 sec)

    mysql> USE customers_and_orders;
    Database changed

    mysql> mysql> CREATE TABLE customers(
        ->     id INT AUTO_INCREMENT PRIMARY KEY,
        ->     first_name VARCHAR(100),
        ->     last_name VARCHAR(100),
        ->     email VARCHAR(100)
        -> );
    Query OK, 0 rows affected (0.02 sec)

    mysql> CREATE TABLE orders(
        ->     id INT AUTO_INCREMENT PRIMARY KEY,
        ->     order_date DATE,
        ->     amount DECIMAL(8,2),
        ->     customer_id INT,
        ->     FOREIGN KEY(customer_id) REFERENCES customers(id)
        -> );
    Query OK, 0 rows affected (0.02 sec)

***Without the reference to the FOREIGN KEY, then an order could be inserted with a customer_id that does not exist***

    mysql> INSERT INTO customers (first_name, last_name, email)
        -> VALUES  ('Boy', 'George', 'george@gmail.com'),
        ->         ('George', 'Michael', 'gm@gmail.com'),
        ->         ('David', 'Bowie', 'david@gmail.com'),
        ->         ('Blue', 'Steele', 'blue@gmail.com'),
        ->         ('Bette', 'Davis', 'bette@aol.com');
    Query OK, 5 rows affected (0.05 sec)
    Records: 5  Duplicates: 0  Warnings: 0

    mysql> INSERT INTO orders (order_date, amount, customer_id)
        -> VALUES  ('2016/02/10', 99.99, 1),
        ->         ('2017/11/11', 35.50, 1),
        ->         ('2014/12/12', 800.67, 2),
        ->         ('2015/01/03', 12.50, 2),
        ->         ('1999/04/1', 450.25, 5);
    Query OK, 5 rows affected (0.01 sec)
    Records: 5  Duplicates: 0  Warnings: 0

***This is what happens when you attempt to INSERT with an invalid customer_id***

    mysql> INSERT INTO orders (order_date, amount, customer_id)
        -> VALUES  ('2019/02/18', 45.12, 98);                                                                                                       
    ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`customers_and_orders`.`orders`, CONSTRAINT `orders_ibfk_1`
     FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`))

********************************************************************************

### [CROSS JOIN](https://dev.mysql.com/doc/refman/8.0/en/nested-join-optimization.html)

-------------------------------------------

    mysql> SELECT * FROM orders;
    +----+------------+--------+-------------+
    | id | order_date | amount | customer_id |
    +----+------------+--------+-------------+
    |  1 | 2016-02-10 |  99.99 |           1 |
    |  2 | 2017-11-11 |  35.50 |           1 |
    |  3 | 2014-12-12 | 800.67 |           2 |
    |  4 | 2015-01-03 |  12.50 |           2 |
    |  5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+--------+-------------+
    5 rows in set (0.00 sec)

    mysql> SELECT * FROM customers WHERE last_name='George';
    +----+------------+-----------+------------------+
    | id | first_name | last_name | email            |
    +----+------------+-----------+------------------+
    |  1 | Boy        | George    | george@gmail.com |
    +----+------------+-----------+------------------+
    1 row in set (0.00 sec)

    mysql> SELECT * FROM orders WHERE customer_id=1;
    +----+------------+--------+-------------+
    | id | order_date | amount | customer_id |
    +----+------------+--------+-------------+
    |  1 | 2016-02-10 |  99.99 |           1 |
    |  2 | 2017-11-11 |  35.50 |           1 |
    +----+------------+--------+-------------+
    2 rows in set (0.00 sec)

    mysql> SELECT * FROM orders WHERE customer_id=
        ->     (
        ->         SELECT id FROM customers
        ->         WHERE last_name='George'
        ->     );
    +----+------------+--------+-------------+
    | id | order_date | amount | customer_id |
    +----+------------+--------+-------------+
    |  1 | 2016-02-10 |  99.99 |           1 |
    |  2 | 2017-11-11 |  35.50 |           1 |
    +----+------------+--------+-------------+
    2 rows in set (0.00 sec)

***Use JOINS to take two tables and join them in several configurations to combine the table data into one table***

    mysql> SELECT * FROM customers, orders;
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    | id | first_name | last_name | email            | id | order_date | amount | customer_id |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |  1 | 2016-02-10 |  99.99 |           1 |
    |  3 | David      | Bowie     | david@gmail.com  |  1 | 2016-02-10 |  99.99 |           1 |
    |  4 | Blue       | Steele    | blue@gmail.com   |  1 | 2016-02-10 |  99.99 |           1 |
    |  5 | Bette      | Davis     | bette@aol.com    |  1 | 2016-02-10 |  99.99 |           1 |
    |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
    |  3 | David      | Bowie     | david@gmail.com  |  2 | 2017-11-11 |  35.50 |           1 |
    |  4 | Blue       | Steele    | blue@gmail.com   |  2 | 2017-11-11 |  35.50 |           1 |
    |  5 | Bette      | Davis     | bette@aol.com    |  2 | 2017-11-11 |  35.50 |           1 |
    |  1 | Boy        | George    | george@gmail.com |  3 | 2014-12-12 | 800.67 |           2 |
    |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
    |  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
    |  4 | Blue       | Steele    | blue@gmail.com   |  3 | 2014-12-12 | 800.67 |           2 |
    |  5 | Bette      | Davis     | bette@aol.com    |  3 | 2014-12-12 | 800.67 |           2 |
    |  1 | Boy        | George    | george@gmail.com |  4 | 2015-01-03 |  12.50 |           2 |
    |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
    |  3 | David      | Bowie     | david@gmail.com  |  4 | 2015-01-03 |  12.50 |           2 |
    |  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
    |  5 | Bette      | Davis     | bette@aol.com    |  4 | 2015-01-03 |  12.50 |           2 |
    |  1 | Boy        | George    | george@gmail.com |  5 | 1999-04-01 | 450.25 |           5 |
    |  2 | George     | Michael   | gm@gmail.com     |  5 | 1999-04-01 | 450.25 |           5 |
    |  3 | David      | Bowie     | david@gmail.com  |  5 | 1999-04-01 | 450.25 |           5 |
    |  4 | Blue       | Steele    | blue@gmail.com   |  5 | 1999-04-01 | 450.25 |           5 |
    |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    25 rows in set (0.00 sec)

***This type of JOINS is a 'Cross Joins' or 'Contagion Joins'***
***This takes every customer and conjoining it to every order***

********************************************************************************

### INNER JOINS

- Only matches with the specific content listed in the JOIN
- Can be written as 'INNER JOIN', but if 'INNER' is not included, it is implied.

----------------------------------------------------

***Implicit INNER JOIN***

    mysql> SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    | id | first_name | last_name | email            | id | order_date | amount | customer_id |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
    |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
    |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
    |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    5 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', amount AS Amount FROM customers, orders WHERE customers.id = orders.customer_id;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | Boy George     | 2016-02-10 |  99.99 |
    | Boy George     | 2017-11-11 |  35.50 |
    | George Michael | 2014-12-12 | 800.67 |
    | George Michael | 2015-01-03 |  12.50 |
    | Bette Davis    | 1999-04-01 | 450.25 |
    +----------------+------------+--------+
    5 rows in set (0.01 sec)

***Explicit INNER JOIN***

    mysql> SELECT * FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id;
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    | id | first_name | last_name | email            | id | order_date | amount | customer_id |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
    |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
    |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
    |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    5 rows in set (0.01 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', amount AS Amount FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | Boy George     | 2016-02-10 |  99.99 |
    | Boy George     | 2017-11-11 |  35.50 |
    | George Michael | 2014-12-12 | 800.67 |
    | George Michael | 2015-01-03 |  12.50 |
    | Bette Davis    | 1999-04-01 | 450.25 |
    +----------------+------------+--------+
    5 rows in set (0.00 sec)

***ARBITRARY JOIN - don't do this***

    mysql> SELECT * FROM customers JOIN orders ON customers.id=orders.id;
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    | id | first_name | last_name | email            | id | order_date | amount | customer_id |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |  2 | 2017-11-11 |  35.50 |           1 |
    |  3 | David      | Bowie     | david@gmail.com  |  3 | 2014-12-12 | 800.67 |           2 |
    |  4 | Blue       | Steele    | blue@gmail.com   |  4 | 2015-01-03 |  12.50 |           2 |
    |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    5 rows in set (0.00 sec)

***Explicit INNER JOIN is the best***

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', amount AS Amount FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id
        -> ORDER BY amount;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | George Michael | 2015-01-03 |  12.50 |
    | Boy George     | 2017-11-11 |  35.50 |
    | Boy George     | 2016-02-10 |  99.99 |
    | Bette Davis    | 1999-04-01 | 450.25 |
    | George Michael | 2014-12-12 | 800.67 |
    +----------------+------------+--------+
    5 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', amount AS Amount FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id
        -> ORDER BY order_date;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | Bette Davis    | 1999-04-01 | 450.25 |
    | George Michael | 2014-12-12 | 800.67 |
    | George Michael | 2015-01-03 |  12.50 |
    | Boy George     | 2016-02-10 |  99.99 |
    | Boy George     | 2017-11-11 |  35.50 |
    +----------------+------------+--------+
    5 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', amount AS Amount FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id
        -> GROUP BY orders.customer_id;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | Boy George     | 2016-02-10 |  99.99 |
    | George Michael | 2014-12-12 | 800.67 |
    | Bette Davis    | 1999-04-01 | 450.25 |
    +----------------+------------+--------+
    3 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', SUM(amount) AS Amount FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id
        -> GROUP BY orders.customer_id;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | Boy George     | 2016-02-10 | 135.49 |
    | George Michael | 2014-12-12 | 813.17 |
    | Bette Davis    | 1999-04-01 | 450.25 |
    +----------------+------------+--------+
    3 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, SUM(amount) AS Total FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id
        -> GROUP BY orders.customer_id
        -> ORDER BY Total DESC;
    +----------------+--------+
    | Customer       | Total  |
    +----------------+--------+
    | George Michael | 813.17 |
    | Bette Davis    | 450.25 |
    | Boy George     | 135.49 |
    +----------------+--------+
    3 rows in set (0.00 sec)

*******************************************************************************

### LEFT JOIN

- LEFT JOIN takes all of the information from the left table and the content that is requested to be matched.

-------------------------------------------------

    mysql> SELECT * FROM customers
        -> LEFT JOIN orders
        ->     ON customers.id=orders.customer_id;
    +----+------------+-----------+------------------+------+------------+--------+-------------+
    | id | first_name | last_name | email            | id   | order_date | amount | customer_id |
    +----+------------+-----------+------------------+------+------------+--------+-------------+
    |  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
    |  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
    |  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
    |  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
    |  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
    |  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+-----------+------------------+------+------------+--------+-------------+
    7 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, order_date AS 'Order Date', amount AS Amount FROM customers
        -> LEFT JOIN orders
        ->     ON customers.id=orders.customer_id;
    +----------------+------------+--------+
    | Customer       | Order Date | Amount |
    +----------------+------------+--------+
    | Boy George     | 2016-02-10 |  99.99 |
    | Boy George     | 2017-11-11 |  35.50 |
    | George Michael | 2014-12-12 | 800.67 |
    | George Michael | 2015-01-03 |  12.50 |
    | David Bowie    | NULL       |   NULL |
    | Blue Steele    | NULL       |   NULL |
    | Bette Davis    | 1999-04-01 | 450.25 |
    +----------------+------------+--------+
    7 rows in set (0.00 sec)

    mysql> SELECT CONCAT(first_name, ' ', last_name) AS Customer, SUM(amount) AS Total FROM customers
        -> LEFT JOIN orders
        ->     ON customers.id=orders.customer_id
        -> GROUP BY customers.id;
    +----------------+--------+
    | Customer       | Total  |
    +----------------+--------+
    | Boy George     | 135.49 |
    | George Michael | 813.17 |
    | David Bowie    |   NULL |
    | Blue Steele    |   NULL |
    | Bette Davis    | 450.25 |
    +----------------+--------+
    5 rows in set (0.00 sec)

***Simple way to substitute NULL with an actual value, use IFNULL, instead of a lengthy CASE statement***

    mysql> SELECT  CONCAT(first_name, ' ', last_name) AS Customer,
        ->         IFNULL(SUM(amount), 0) as Total
        -> FROM customers
        -> LEFT JOIN orders
        ->     ON customers.id=orders.customer_id
        -> GROUP BY customers.id;
    +----------------+--------+
    | Customer       | Total  |
    +----------------+--------+
    | Boy George     | 135.49 |
    | George Michael | 813.17 |
    | David Bowie    |   0.00 |
    | Blue Steele    |   0.00 |
    | Bette Davis    | 450.25 |
    +----------------+--------+
    5 rows in set (0.00 sec)

    mysql> SELECT  CONCAT(first_name, ' ', last_name) AS Customer,
        ->         IFNULL(SUM(amount), 0) as Total
        -> FROM customers
        -> LEFT JOIN orders
        ->     ON customers.id=orders.customer_id
        -> GROUP BY customers.id
        -> ORDER BY Total;
    +----------------+--------+
    | Customer       | Total  |
    +----------------+--------+
    | Blue Steele    |   0.00 |
    | David Bowie    |   0.00 |
    | Boy George     | 135.49 |
    | Bette Davis    | 450.25 |
    | George Michael | 813.17 |
    +----------------+--------+
    5 rows in set (0.01 sec)

********************************************************************************

### RIGHT JOINS
#### PT 1

- RIGHT JOINS takes the information requested to be matched & all of the information from the right table into a new table

----------------------------------------------

    mysql> SELECT * FROM customers
        -> JOIN orders
        ->     ON customers.id=orders.customer_id;
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    | id | first_name | last_name | email            | id | order_date | amount | customer_id |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    |  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
    |  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
    |  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
    |  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
    |  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-01 | 450.25 |           5 |
    +----+------------+-----------+------------------+----+------------+--------+-------------+
    5 rows in set (0.00 sec)

    mysql> SELECT * FROM customers
        -> RIGHT JOIN orders
        ->     ON customers.id=orders.customer_id;
    +------+------------+-----------+------------------+----+------------+--------+-------------+
    | id   | first_name | last_name | email            | id | order_date | amount | customer_id |
    +------+------------+-----------+------------------+----+------------+--------+-------------+
    |    1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
    |    1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
    |    2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
    |    2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
    |    5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-01 | 450.25 |           5 |
    +------+------------+-----------+------------------+----+------------+--------+-------------+
    5 rows in set (0.00 sec)

***The reason there does not appear to be a difference is because there are not any orders that are not associated to a customer***

- The only way to acheive this would be to fudge the data
- This could happen in a real world setting if someone accidentally deleted info or an order was associated to the wrong customer_id
- It would not be easy to delete a customer, due to the FOREIGN KEY constraint, without deleting the associated order first.
- Another real world scenario would be that a DB was inherited, that did not have a FOREIGN KEY constraint.
- There really isn't a difference between RIGHT & LEFT JOIN if you change the order of the joined tables.
- Some developments won't even support a RIGHT JOIN.

********************************************************************************
#### EXERCISES
********************************************************************************

- WRITE THIS SCEHMA

    STUDENTS        PAPERS
    - id            - title
    - first_name    - grade
                    - student_id

-----------------------------------------------

    mysql> CREATE TABLE students(
        ->     id INT AUTO_INCREMENT PRIMARY KEY,
        ->     first_name VARCHAR(100)
        -> );
    Query OK, 0 rows affected (0.01 sec)

    mysql> CREATE TABLE papers(
        ->     id INT AUTO_INCREMENT PRIMARY KEY,
        ->     title VARCHAR(100),
        ->     grade INT,
        ->     student_id INT,
        ->     FOREIGN KEY(student_id) REFERENCES students(id)
        -> );
    Query OK, 0 rows affected (0.01 sec)

    mysql> INSERT INTO students (first_name)
        -> VALUES  ('Caleb'),
        ->         ('Samantha'),
        ->         ('Raj'),
        ->         ('Carlos'),
        ->         ('Lisa');
    Query OK, 5 rows affected (0.01 sec)
    Records: 5  Duplicates: 0  Warnings: 0

    mysql> INSERT INTO papers (student_id, title, grade)
        -> VALUES  (1, 'My First Book Report', 60),
        ->         (1, 'My Second Book Report', 75),
        ->         (2, 'Russian Lit Through The Ages', 94),
        ->         (2, 'De Montaigne and The Art of the Essay', 98),
        ->         (4, 'Borges and Magical Realism', 89);
    Query OK, 5 rows affected (0.01 sec)
    Records: 5  Duplicates: 0  Warnings: 0

-----------------------------------------------

- Print student name, title, grade

-----------------------------------------------

    mysql> SELECT first_name AS Student, title as Paper, grade as Grade FROM students
        -> INNER JOIN papers
        ->     ON students.id=papers.student_id;
    +----------+---------------------------------------+-------+
    | Student  | Paper                                 | Grade |
    +----------+---------------------------------------+-------+
    | Caleb    | My First Book Report                  |    60 |
    | Caleb    | My Second Book Report                 |    75 |
    | Samantha | Russian Lit Through The Ages          |    94 |
    | Samantha | De Montaigne and The Art of the Essay |    98 |
    | Carlos   | Borges and Magical Realism            |    89 |
    +----------+---------------------------------------+-------+
    5 rows in set (0.00 sec)

***Could also use a RIGHT JOIN and get the same result***

-----------------------------------------------

- Print all student's names, titles, grades

-----------------------------------------------

    mysql> SELECT first_name AS Student, title as Paper, grade as Grade FROM students
        -> LEFT JOIN papers
        ->     ON students.id=papers.student_id;
    +----------+---------------------------------------+-------+
    | Student  | Paper                                 | Grade |
    +----------+---------------------------------------+-------+
    | Caleb    | My First Book Report                  |    60 |
    | Caleb    | My Second Book Report                 |    75 |
    | Samantha | Russian Lit Through The Ages          |    94 |
    | Samantha | De Montaigne and The Art of the Essay |    98 |
    | Raj      | NULL                                  |  NULL |
    | Carlos   | Borges and Magical Realism            |    89 |
    | Lisa     | NULL                                  |  NULL |
    +----------+---------------------------------------+-------+
    7 rows in set (0.00 sec)

-----------------------------------------------

- Print all student's names, titles (missing if null), grades (0 if null)

----------------------------------------------

    mysql> SELECT first_name AS Student, IFNULL(title, 'Missing') as Paper, IFNULL(grade, 0) as Grade FROM students
        -> LEFT JOIN papers
        ->     ON students.id=papers.student_id;
    +----------+---------------------------------------+-------+
    | Student  | Paper                                 | Grade |
    +----------+---------------------------------------+-------+
    | Caleb    | My First Book Report                  |    60 |
    | Caleb    | My Second Book Report                 |    75 |
    | Samantha | Russian Lit Through The Ages          |    94 |
    | Samantha | De Montaigne and The Art of the Essay |    98 |
    | Raj      | Missing                               |     0 |
    | Carlos   | Borges and Magical Realism            |    89 |
    | Lisa     | Missing                               |     0 |
    +----------+---------------------------------------+-------+
    7 rows in set (0.00 sec)

-----------------------------------------------

- Print student names, average grade

----------------------------------------------

    mysql> SELECT first_name AS Student, IFNULL(AVG(grade), 0) AS Grade FROM students
        -> LEFT JOIN papers
        ->     ON students.id=papers.student_id
        -> GROUP BY students.id
        -> ORDER BY Grade DESC;
    +----------+---------+
    | Student  | Grade   |
    +----------+---------+
    | Samantha | 96.0000 |
    | Carlos   | 89.0000 |
    | Caleb    | 67.5000 |
    | Lisa     |  0.0000 |
    | Raj      |  0.0000 |
    +----------+---------+
    5 rows in set (0.00 sec)

----------------------------------------------

- Print student names, average grade, with pass/fail status (75 or higher passes)

----------------------------------------------

    mysql> SELECT first_name AS Student, IFNULL(AVG(grade), 0) AS Grade,
        ->     CASE
        ->         WHEN AVG(grade) >= 75 THEN 'Passing'
        ->         ELSE 'Failing'
        ->     END AS 'Passing/Failing' FROM students
        -> LEFT JOIN papers
        ->     ON students.id=papers.student_id
        -> GROUP BY students.id
        -> ORDER BY Grade DESC;
    +----------+---------+-----------------+
    | Student  | Grade   | Passing/Failing |
    +----------+---------+-----------------+
    | Samantha | 96.0000 | Passing         |
    | Carlos   | 89.0000 | Passing         |
    | Caleb    | 67.5000 | Failing         |
    | Lisa     |  0.0000 | Failing         |
    | Raj      |  0.0000 | Failing         |
    +----------+---------+-----------------+
    5 rows in set (0.00 sec)

***As 'NULL >= 75' is NULL, the CASE statement is skipping over it, and counting NULL toward the ELSE of the statement.***
***Adding "WHEN AVG(grade) IS NULL THEN 'FAILING'" is a good idea to be sure that NULL doesn't askew the CASE statement.***

********************************************************************************

## MANY:MANY

********************************************************************************

### [MANY:MANY Basics](http://webdev.slides.com/coltsteele/mysql-99-104#/37)

***Some Examples***

Books     <-> Authors
Blog Post <-> Tags
Students  <-> Classes

- Imagine creating a TV show reviewing application

Series Data
    +
    |
Reviews Data
    |
    +
Reviewers Data

***Reviewers***

    +------------+
    | id         |
    +------------+
    | first_name |
    +------------+
    | last_name  |
    +------------+

***Series***

    +---------------+
    | id            |
    +---------------+
    | title         |
    +---------------+
    | released_year |
    +---------------+
    | genre         |
    +---------------+

***Review***

    +----------------+
    | id             |
    +----------------+
    | rating         |
    +----------------+
    | series_id      | <-> points to series.id
    +----------------+
    | reviewer_id    | <-> points to reviewers.id
    +----------------+

---------------------------------------------------------------

    mysql> CREATE DATABASE tv_review_app;
    Query OK, 1 row affected (0.00 sec)

    mysql> USE tv_review_app;
    Database changed

    mysql> CREATE TABLE reviewers (
        ->     id INT AUTO_INCREMENT PRIMARY KEY,
        ->     first_name VARCHAR(100),
        ->     last_name VARCHAR(100)
        -> );
    Query OK, 0 rows affected (0.01 sec)

    mysql> CREATE TABLE series (
    ->     id INT AUTO_INCREMENT PRIMARY KEY,
    ->     title VARCHAR(100),
    ->     released_year YEAR(4),
    ->     genre VARCHAR(100)
    -> );
    Query OK, 0 rows affected (0.01 sec)

    mysql> INSERT INTO series (title, released_year, genre) VALUES
        ->     ('Archer', 2009, 'Animation'),
        ->     ('Arrested Development', 2003, 'Comedy'),
        ->     ("Bob's Burgers", 2011, 'Animation'),
        ->     ('Bojack Horseman', 2014, 'Animation'),
        ->     ("Breaking Bad", 2008, 'Drama'),
        ->     ('Curb Your Enthusiasm', 2000, 'Comedy'),
        ->     ("Fargo", 2014, 'Drama'),
        ->     ('Freaks and Geeks', 1999, 'Comedy'),
        ->     ('General Hospital', 1963, 'Drama'),
        ->     ('Halt and Catch Fire', 2014, 'Drama'),
        ->     ('Malcolm In The Middle', 2000, 'Comedy'),
        ->     ('Pushing Daisies', 2007, 'Comedy'),
        ->     ('Seinfeld', 1989, 'Comedy'),
        ->     ('Stranger Things', 2016, 'Drama');
    Query OK, 14 rows affected (0.01 sec)
    Records: 14  Duplicates: 0  Warnings: 0

    mysql> INSERT INTO reviewers (first_name, last_name) VALUES
        ->     ('Thomas', 'Stoneman'),
        ->     ('Wyatt', 'Skaggs'),
        ->     ('Kimbra', 'Masters'),
        ->     ('Domingo', 'Cortes'),
        ->     ('Colt', 'Steele'),
        ->     ('Pinkie', 'Petit'),
        ->     ('Marlon', 'Crafford');
    Query OK, 7 rows affected (0.01 sec)
    Records: 7  Duplicates: 0  Warnings: 0

    mysql> SELECT * FROM series;
    +----+-----------------------+---------------+-----------+
    | id | title                 | released_year | genre     |
    +----+-----------------------+---------------+-----------+
    |  1 | Archer                |          2009 | Animation |
    |  2 | Arrested Development  |          2003 | Comedy    |
    |  3 | Bob's Burgers         |          2011 | Animation |
    |  4 | Bojack Horseman       |          2014 | Animation |
    |  5 | Breaking Bad          |          2008 | Drama     |
    |  6 | Curb Your Enthusiasm  |          2000 | Comedy    |
    |  7 | Fargo                 |          2014 | Drama     |
    |  8 | Freaks and Geeks      |          1999 | Comedy    |
    |  9 | General Hospital      |          1963 | Drama     |
    | 10 | Halt and Catch Fire   |          2014 | Drama     |
    | 11 | Malcolm In The Middle |          2000 | Comedy    |
    | 12 | Pushing Daisies       |          2007 | Comedy    |
    | 13 | Seinfeld              |          1989 | Comedy    |
    | 14 | Stranger Things       |          2016 | Drama     |
    +----+-----------------------+---------------+-----------+
    14 rows in set (0.00 sec)

    mysql> SELECt * FROM reviewers;
    +----+------------+-----------+
    | id | first_name | last_name |
    +----+------------+-----------+
    |  1 | Thomas     | Stoneman  |
    |  2 | Wyatt      | Skaggs    |
    |  3 | Kimbra     | Masters   |
    |  4 | Domingo    | Cortes    |
    |  5 | Colt       | Steele    |
    |  6 | Pinkie     | Petit     |
    |  7 | Marlon     | Crafford  |
    +----+------------+-----------+
    7 rows in set (0.00 sec)

    mysql> CREATE TABLE reviews (
        ->     id INT AUTO_INCREMENT PRIMARY KEY,
        ->     rating DECIMAL(2,1),
        ->     series_id INT,
        ->     reviewer_id INT,
        ->     FOREIGN KEY(series_id) REFERENCES series(id),
        ->     FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
        -> );
    Query OK, 0 rows affected (0.01 sec)

    mysql> INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
        ->     (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
        ->     (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
        ->     (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
        ->     (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
        ->     (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
        ->     (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
        ->     (7,2,9.1),(7,5,9.7),
        ->     (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
        ->     (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
        ->     (10,5,9.9),
        ->     (13,3,8.0),(13,4,7.2),
        ->     (14,2,8.5),(14,3,8.9),(14,4,8.9);
    Query OK, 47 rows affected (0.01 sec)
    Records: 47  Duplicates: 0  Warnings: 0

    mysql> SELECT * FROM reviews;
    +----+--------+-----------+-------------+
    | id | rating | series_id | reviewer_id |
    +----+--------+-----------+-------------+
    |  1 |    8.0 |         1 |           1 |
    |  2 |    7.5 |         1 |           2 |
    |  3 |    8.5 |         1 |           3 |
    |  4 |    7.7 |         1 |           4 |
    |  5 |    8.9 |         1 |           5 |
    |  6 |    8.1 |         2 |           1 |
    |  7 |    6.0 |         2 |           4 |
    |  8 |    8.0 |         2 |           3 |
    |  9 |    8.4 |         2 |           6 |
    | 10 |    9.9 |         2 |           5 |
    | 11 |    7.0 |         3 |           1 |
    | 12 |    7.5 |         3 |           6 |
    | 13 |    8.0 |         3 |           4 |
    | 14 |    7.1 |         3 |           3 |
    | 15 |    8.0 |         3 |           5 |
    | 16 |    7.5 |         4 |           1 |
    | 17 |    7.8 |         4 |           3 |
    | 18 |    8.3 |         4 |           4 |
    | 19 |    7.6 |         4 |           2 |
    | 20 |    8.5 |         4 |           5 |
    | 21 |    9.5 |         5 |           1 |
    | 22 |    9.0 |         5 |           3 |
    | 23 |    9.1 |         5 |           4 |
    | 24 |    9.3 |         5 |           2 |
    | 25 |    9.9 |         5 |           5 |
    | 26 |    6.5 |         6 |           2 |
    | 27 |    7.8 |         6 |           3 |
    | 28 |    8.8 |         6 |           4 |
    | 29 |    8.4 |         6 |           2 |
    | 30 |    9.1 |         6 |           5 |
    | 31 |    9.1 |         7 |           2 |
    | 32 |    9.7 |         7 |           5 |
    | 33 |    8.5 |         8 |           4 |
    | 34 |    7.8 |         8 |           2 |
    | 35 |    8.8 |         8 |           6 |
    | 36 |    9.3 |         8 |           5 |
    | 37 |    5.5 |         9 |           2 |
    | 38 |    6.8 |         9 |           3 |
    | 39 |    5.8 |         9 |           4 |
    | 40 |    4.3 |         9 |           6 |
    | 41 |    4.5 |         9 |           5 |
    | 42 |    9.9 |        10 |           5 |
    | 43 |    8.0 |        13 |           3 |
    | 44 |    7.2 |        13 |           4 |
    | 45 |    8.5 |        14 |           2 |
    | 46 |    8.9 |        14 |           3 |
    | 47 |    8.9 |        14 |           4 |
    +----+--------+-----------+-------------+
    47 rows in set (0.00 sec)

********************************************************************************

#### TV Joins Challenge 1

- List series ratings

------------------------------------------------------------

    mysql> SELECT title AS 'Series Title', rating AS Rating
        -> FROM series
        -> INNER JOIN reviews
        ->     ON series.id=reviews.series_id
        -> ORDER BY title;
    +----------------------+--------+
    | Series Title         | Rating |
    +----------------------+--------+
    | Archer               |    8.0 |
    | Archer               |    7.5 |
    | Archer               |    8.5 |
    | Archer               |    7.7 |
    | Archer               |    8.9 |
    | Arrested Development |    8.1 |
    | Arrested Development |    6.0 |
    | Arrested Development |    8.0 |
    | Arrested Development |    8.4 |
    | Arrested Development |    9.9 |
    | Bob's Burgers        |    7.0 |
    | Bob's Burgers        |    7.5 |
    | Bob's Burgers        |    8.0 |
    | Bob's Burgers        |    7.1 |
    | Bob's Burgers        |    8.0 |
    | Bojack Horseman      |    7.5 |
    | Bojack Horseman      |    7.8 |
    | Bojack Horseman      |    8.3 |
    | Bojack Horseman      |    7.6 |
    | Bojack Horseman      |    8.5 |
    | Breaking Bad         |    9.5 |
    | Breaking Bad         |    9.0 |
    | Breaking Bad         |    9.1 |
    | Breaking Bad         |    9.3 |
    | Breaking Bad         |    9.9 |
    | Curb Your Enthusiasm |    6.5 |
    | Curb Your Enthusiasm |    7.8 |
    | Curb Your Enthusiasm |    8.8 |
    | Curb Your Enthusiasm |    8.4 |
    | Curb Your Enthusiasm |    9.1 |
    | Fargo                |    9.1 |
    | Fargo                |    9.7 |
    | Freaks and Geeks     |    8.5 |
    | Freaks and Geeks     |    7.8 |
    | Freaks and Geeks     |    8.8 |
    | Freaks and Geeks     |    9.3 |
    | General Hospital     |    5.5 |
    | General Hospital     |    6.8 |
    | General Hospital     |    5.8 |
    | General Hospital     |    4.3 |
    | General Hospital     |    4.5 |
    | Halt and Catch Fire  |    9.9 |
    | Seinfeld             |    8.0 |
    | Seinfeld             |    7.2 |
    | Stranger Things      |    8.5 |
    | Stranger Things      |    8.9 |
    | Stranger Things      |    8.9 |
    +----------------------+--------+
    47 rows in set (0.01 sec)

-----------------------------------------------------------------------

#### TV Joins Challenge 2

- Average series ratings

------------------------------------------------------------------------

    mysql> SELECT
        ->     title AS 'Series Title',
        ->     AVG(rating) as 'Average Rating'
        -> FROM series
        -> INNER JOIN reviews
        ->     ON series.id=reviews.series_id
        -> GROUP BY series.id
        -> ORDER BY AVG(rating);
    +----------------------+----------------+
    | Series Title         | Average Rating |
    +----------------------+----------------+
    | General Hospital     |        5.38000 |
    | Bob's Burgers        |        7.52000 |
    | Seinfeld             |        7.60000 |
    | Bojack Horseman      |        7.94000 |
    | Arrested Development |        8.08000 |
    | Curb Your Enthusiasm |        8.12000 |
    | Archer               |        8.12000 |
    | Freaks and Geeks     |        8.60000 |
    | Stranger Things      |        8.76667 |
    | Breaking Bad         |        9.36000 |
    | Fargo                |        9.40000 |
    | Halt and Catch Fire  |        9.90000 |
    +----------------------+----------------+
    12 rows in set (0.00 sec)

---------------------------------------------------------------------

#### TV Joins Challenge 3

- Reviewers & Rating

--------------------------------------------------------------------

    mysql> SELECT
        ->     CONCAT(first_name, ' ', last_name) AS Reviewer,
        ->     rating AS Rating
        -> FROM reviewers
        -> INNER JOIN reviews
        ->     ON reviewers.id=reviews.reviewer_id;
    +-----------------+--------+
    | Reviewer        | Rating |
    +-----------------+--------+
    | Thomas Stoneman |    8.0 |
    | Thomas Stoneman |    8.1 |
    | Thomas Stoneman |    7.0 |
    | Thomas Stoneman |    7.5 |
    | Thomas Stoneman |    9.5 |
    | Wyatt Skaggs    |    7.5 |
    | Wyatt Skaggs    |    7.6 |
    | Wyatt Skaggs    |    9.3 |
    | Wyatt Skaggs    |    6.5 |
    | Wyatt Skaggs    |    8.4 |
    | Wyatt Skaggs    |    9.1 |
    | Wyatt Skaggs    |    7.8 |
    | Wyatt Skaggs    |    5.5 |
    | Wyatt Skaggs    |    8.5 |
    | Kimbra Masters  |    8.5 |
    | Kimbra Masters  |    8.0 |
    | Kimbra Masters  |    7.1 |
    | Kimbra Masters  |    7.8 |
    | Kimbra Masters  |    9.0 |
    | Kimbra Masters  |    7.8 |
    | Kimbra Masters  |    6.8 |
    | Kimbra Masters  |    8.0 |
    | Kimbra Masters  |    8.9 |
    | Domingo Cortes  |    7.7 |
    | Domingo Cortes  |    6.0 |
    | Domingo Cortes  |    8.0 |
    | Domingo Cortes  |    8.3 |
    | Domingo Cortes  |    9.1 |
    | Domingo Cortes  |    8.8 |
    | Domingo Cortes  |    8.5 |
    | Domingo Cortes  |    5.8 |
    | Domingo Cortes  |    7.2 |
    | Domingo Cortes  |    8.9 |
    | Colt Steele     |    8.9 |
    | Colt Steele     |    9.9 |
    | Colt Steele     |    8.0 |
    | Colt Steele     |    8.5 |
    | Colt Steele     |    9.9 |
    | Colt Steele     |    9.1 |
    | Colt Steele     |    9.7 |
    | Colt Steele     |    9.3 |
    | Colt Steele     |    4.5 |
    | Colt Steele     |    9.9 |
    | Pinkie Petit    |    8.4 |
    | Pinkie Petit    |    7.5 |
    | Pinkie Petit    |    8.8 |
    | Pinkie Petit    |    4.3 |
    +-----------------+--------+
    47 rows in set (0.00 sec)

------------------------------------------------------------

#### TV Joins Challenge 4

- Unreviewed Series

------------------------------------------------------------

    mysql> SELECT
        ->     title AS 'Unreviewed Series'
        -> FROM series
        -> LEFT JOIN reviews
        ->     ON series.id=reviews.series_id
        -> WHERE rating IS NULL;
    +-----------------------+
    | Unreviewed Series     |
    +-----------------------+
    | Malcolm In The Middle |
    | Pushing Daisies       |
    +-----------------------+
    2 rows in set (0.00 sec)

------------------------------------------------------------

#### TV Joins Challenge 5

- Genre Avg Rating

------------------------------------------------------------

    mysql> SELECT 
        ->     genre AS Genre,
        ->     ROUND(
        ->         AVG(rating),
        ->         2
        ->     )
        ->         AS 'Average Rating'
        -> FROM series
        -> INNER JOIN reviews
        ->     ON series.id=reviews.series_id
        -> GROUP BY genre;
    +-----------+----------------+
    | Genre     | Average Rating |
    +-----------+----------------+
    | Animation |           7.86 |
    | Comedy    |           8.16 |
    | Drama     |           8.04 |
    +-----------+----------------+
    3 rows in set (0.00 sec)

------------------------------------------------------------

#### TV Joins Challenge 6

- Unreviewed Series

------------------------------------------------------------

    mysql> SELECT
        ->     CONCAT(first_name, ' ', last_name) AS Reviewer,
        ->     COUNT(IFNULL(rating, 0)) AS 'Count',
        ->     MIN(IFNULL(rating, 0)) AS 'Min',
        ->     MAX(IFNULL(rating, 0)) AS 'Max',
        ->     AVG(IFNULL(rating, 0)) AS 'Average Rating',
        ->     CASE
        ->         WHEN COUNT(rating) >= 10 THEN 'POWER USER'
        ->         WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ->         ELSE 'INACTIVE'
        ->     END AS Status
        -> FROM reviewers
        -> LEFT JOIN reviews
        ->     ON reviewers.id=reviews.reviewer_id
        -> GROUP BY reviewers.id;
    +-----------------+-------+------+------+----------------+------------+
    | Reviewer        | Count | Min  | Max  | Average Rating | Status     |
    +-----------------+-------+------+------+----------------+------------+
    | Thomas Stoneman |     5 |  7.0 |  9.5 |        8.02000 | ACTIVE     |
    | Wyatt Skaggs    |     9 |  5.5 |  9.3 |        7.80000 | ACTIVE     |
    | Kimbra Masters  |     9 |  6.8 |  9.0 |        7.98889 | ACTIVE     |
    | Domingo Cortes  |    10 |  5.8 |  9.1 |        7.83000 | POWER USER |
    | Colt Steele     |    10 |  4.5 |  9.9 |        8.77000 | POWER USER |
    | Pinkie Petit    |     4 |  4.3 |  8.8 |        7.25000 | ACTIVE     |
    | Marlon Crafford |     1 |  0.0 |  0.0 |        0.00000 | INACTIVE   |
    +-----------------+-------+------+------+----------------+------------+
    7 rows in set (0.00 sec)

------------------------------------------------------------

#### TV Joins Challenge 7

- 3 Tables

------------------------------------------------------------

    mysql> SELECT 
        ->     title AS Title,
        ->     rating AS Rating,
        ->     CONCAT(first_name, ' ', last_name) AS Reviewer
        -> FROM reviewers
        -> INNER JOIN reviews
        ->     ON reviewers.id = reviews.reviewer_id
        -> INNER JOIN series
        ->     ON series.id = reviews.series_id
        -> ORDER BY Title;
    +----------------------+--------+-----------------+
    | Title                | Rating | Reviewer        |
    +----------------------+--------+-----------------+
    | Archer               |    8.0 | Thomas Stoneman |
    | Archer               |    7.7 | Domingo Cortes  |
    | Archer               |    8.5 | Kimbra Masters  |
    | Archer               |    7.5 | Wyatt Skaggs    |
    | Archer               |    8.9 | Colt Steele     |
    | Arrested Development |    8.1 | Thomas Stoneman |
    | Arrested Development |    6.0 | Domingo Cortes  |
    | Arrested Development |    8.0 | Kimbra Masters  |
    | Arrested Development |    8.4 | Pinkie Petit    |
    | Arrested Development |    9.9 | Colt Steele     |
    | Bob's Burgers        |    7.0 | Thomas Stoneman |
    | Bob's Burgers        |    8.0 | Domingo Cortes  |
    | Bob's Burgers        |    7.1 | Kimbra Masters  |
    | Bob's Burgers        |    7.5 | Pinkie Petit    |
    | Bob's Burgers        |    8.0 | Colt Steele     |
    | Bojack Horseman      |    8.5 | Colt Steele     |
    | Bojack Horseman      |    7.6 | Wyatt Skaggs    |
    | Bojack Horseman      |    7.5 | Thomas Stoneman |
    | Bojack Horseman      |    8.3 | Domingo Cortes  |
    | Bojack Horseman      |    7.8 | Kimbra Masters  |
    | Breaking Bad         |    9.5 | Thomas Stoneman |
    | Breaking Bad         |    9.1 | Domingo Cortes  |
    | Breaking Bad         |    9.0 | Kimbra Masters  |
    | Breaking Bad         |    9.9 | Colt Steele     |
    | Breaking Bad         |    9.3 | Wyatt Skaggs    |
    | Curb Your Enthusiasm |    8.4 | Wyatt Skaggs    |
    | Curb Your Enthusiasm |    8.8 | Domingo Cortes  |
    | Curb Your Enthusiasm |    7.8 | Kimbra Masters  |
    | Curb Your Enthusiasm |    9.1 | Colt Steele     |
    | Curb Your Enthusiasm |    6.5 | Wyatt Skaggs    |
    | Fargo                |    9.1 | Wyatt Skaggs    |
    | Fargo                |    9.7 | Colt Steele     |
    | Freaks and Geeks     |    8.8 | Pinkie Petit    |
    | Freaks and Geeks     |    8.5 | Domingo Cortes  |
    | Freaks and Geeks     |    7.8 | Wyatt Skaggs    |
    | Freaks and Geeks     |    9.3 | Colt Steele     |
    | General Hospital     |    4.5 | Colt Steele     |
    | General Hospital     |    4.3 | Pinkie Petit    |
    | General Hospital     |    6.8 | Kimbra Masters  |
    | General Hospital     |    5.8 | Domingo Cortes  |
    | General Hospital     |    5.5 | Wyatt Skaggs    |
    | Halt and Catch Fire  |    9.9 | Colt Steele     |
    | Seinfeld             |    8.0 | Kimbra Masters  |
    | Seinfeld             |    7.2 | Domingo Cortes  |
    | Stranger Things      |    8.9 | Kimbra Masters  |
    | Stranger Things      |    8.5 | Wyatt Skaggs    |
    | Stranger Things      |    8.9 | Domingo Cortes  |
    +----------------------+--------+-----------------+
    47 rows in set (0.00 sec)

********************************************************************************

## Instagram Clone

********************************************************************************

### Schema Design

------------------------------------------

    +---------------+
    | USERS         |
    +---------------+
    | id            |
    | username      |
    | created_at    |
    +---------------+

*** Super simple set up ***

- id = INT
- username = VARCHAR
- created_at = TIMESTAMP when the user signs up / default of NOW
- Work done in /instagram/ig_clone.sql

-------------------------------------------

    CREATE DATABASE ig_clone;
    USE ig_clone;

    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255) UNIQUE NOT NULL,
        created_at TIMESTAMP DEFAULT NOW()
    );

    mysql> source MySQL/instagram/ig_clone.sql                                                                                                                               
    Query OK, 1 row affected (0.00 sec)

    Database changed
    Query OK, 0 rows affected (0.07 sec)

    mysql> DESCRIBE users;
    +------------+--------------+------+-----+-------------------+----------------+
    | Field      | Type         | Null | Key | Default           | Extra          |
    +------------+--------------+------+-----+-------------------+----------------+
    | id         | int(11)      | NO   | PRI | NULL              | auto_increment |
    | username   | varchar(255) | NO   | UNI | NULL              |                |
    | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
    +------------+--------------+------+-----+-------------------+----------------+
    3 rows in set (0.00 sec)
    
********************************************************************************

### Adding Photos schema

    +---------------+
    | PHOTOS        |
    +---------------+
    | id            |
    | image_url     |
    | user_id       |
    | created_at    |
    +---------------+

- user_id poins to users.id

-----------------------------------

    CREATE TABLE photos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        image_url VARCHAR(255) NOT NULL,
        user_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(user_id) REFERENCES users(id)
    );

    mysql> source MySQL/instagram/ig_clone.sql;
    ERROR 1007 (HY000): Can't create database 'ig_clone'; database exists
    Database changed
    ERROR 1050 (42S01): Table 'users' already exists
    Query OK, 0 rows affected (0.08 sec)

    mysql> DESCRIBE photos;
    +------------+--------------+------+-----+-------------------+----------------+
    | Field      | Type         | Null | Key | Default           | Extra          |
    +------------+--------------+------+-----+-------------------+----------------+
    | id         | int(11)      | NO   | PRI | NULL              | auto_increment |
    | image_url  | varchar(255) | NO   |     | NULL              |                |
    | user_id    | int(11)      | NO   | MUL | NULL              |                |
    | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
    +------------+--------------+------+-----+-------------------+----------------+
    4 rows in set (0.01 sec)

********************************************************************************

### COMMENTS Schema

    +---------------+
    | COMMENTS      |
    +---------------+
    | id            |
    | comment_text  |
    | user_id       |
    | photo_id      |
    | created_at    |
    +---------------+

- user_id <=> users.id
- photo_id <=> photos.id

--------------------------

    CREATE TABLE comments (
        id INT AUTO_INCREMENT PRIMARY KEY,
        comment_text VARCHAR(255) NOT NULL,
        user_id INT NOT NULL,
        photo_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(photo_id) REFERENCES photos(id)
    );

    mysql> source MySQL/instagram/ig_clone.sql;                                                                                                                              ERROR 1007 (HY000): Can't create database 'ig_clone'; database exists
    Database changed
    ERROR 1050 (42S01): Table 'users' already exists
    ERROR 1050 (42S01): Table 'photos' already exists
    Query OK, 0 rows affected (0.08 sec)

    mysql> DESCRIBE comments;
    +--------------+--------------+------+-----+-------------------+----------------+
    | Field        | Type         | Null | Key | Default           | Extra          |
    +--------------+--------------+------+-----+-------------------+----------------+
    | id           | int(11)      | NO   | PRI | NULL              | auto_increment |
    | comment_text | varchar(255) | NO   |     | NULL              |                |
    | user_id      | int(11)      | NO   | MUL | NULL              |                |
    | photo_id     | int(11)      | NO   | MUL | NULL              |                |
    | created_at   | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
    +--------------+--------------+------+-----+-------------------+----------------+
    5 rows in set (0.00 sec)

********************************************************************************

### LIKES Schema

    +---------------+
    | LIKES         |
    +---------------+
    | user_id       |
    | photo_id      |
    | created_at    |
    +---------------+

- Very simple set up
- user_id <=> users.id
- photo_id <=> photos.id
- No unique id for likes, as there will be no reference to it in separate tables

--------------------------

    CREATE TABLE likes (
        user_id INT NOT NULL,
        photo_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(photo_id) REFERENCES photos(id),
        PRIMARY KEY(user_id, photo_id)
    );

    mysql> source MySQL/instagram/ig_clone.sql;
    ERROR 1007 (HY000): Can't create database 'ig_clone'; database exists
    Database changed
    ERROR 1050 (42S01): Table 'users' already exists
    ERROR 1050 (42S01): Table 'photos' already exists
    ERROR 1050 (42S01): Table 'comments' already exists
    Query OK, 0 rows affected (0.07 sec)

    mysql> DESCRIBE likes;
    +------------+-----------+------+-----+-------------------+-------+
    | Field      | Type      | Null | Key | Default           | Extra |
    +------------+-----------+------+-----+-------------------+-------+
    | user_id    | int(11)   | NO   | PRI | NULL              |       |
    | photo_id   | int(11)   | NO   | PRI | NULL              |       |
    | created_at | timestamp | NO   |     | CURRENT_TIMESTAMP |       |
    +------------+-----------+------+-----+-------------------+-------+
    3 rows in set (0.00 sec)

*****************************

### FOLLOWS Schema

    +---------------+
    | FOLLOWS       |
    +---------------+
    | follower_id   |
    | followee_id   |
    | created_at    |
    +---------------+

- follower_id <=> users.id
- followee_id <=> users.id

----------------------------

    CREATE TABLE follows (
        follower_id INT NOT NULL,
        followee_id INT NOT NULL,
        created_at TIMESTAMP DEFAULT NOW(),
        FOREIGN KEY(follower_id) REFERENCES users(id),
        FOREIGN KEY(followee_id) REFERENCES users(id),
        PRIMARY KEY(follower_id, followee_id)
    );

    mysql> source MySQL/instagram/ig_clone.sql;
    ERROR 1007 (HY000): Can't create database 'ig_clone'; database exists
    Database changed
    ERROR 1050 (42S01): Table 'users' already exists
    ERROR 1050 (42S01): Table 'photos' already exists
    ERROR 1050 (42S01): Table 'comments' already exists
    ERROR 1050 (42S01): Table 'likes' already exists
    Query OK, 0 rows affected (0.07 sec)

    mysql> DESCRIBE follows;
    +-------------+-----------+------+-----+-------------------+-------+
    | Field       | Type      | Null | Key | Default           | Extra |
    +-------------+-----------+------+-----+-------------------+-------+
    | follower_id | int(11)   | NO   | PRI | NULL              |       |
    | followee_id | int(11)   | NO   | PRI | NULL              |       |
    | created_at  | timestamp | NO   |     | CURRENT_TIMESTAMP |       |
    +-------------+-----------+------+-----+-------------------+-------+
    3 rows in set (0.00 sec)

***********************************

### HASHTAGS Schema

- Could set up by adding a TAGS column to the Photos table (ADVANTAGE: easy to implement | DISADVANTAGE: cannot store additional info, like when the first was used and have to be careful when searching)
- Could use two tables: Photos & Tags (ADVANTAGE: unlimited tags | DISADVANTAGE: slower than previous option)
- BEST OPTION: Use 3 tables; Photos, Photo_Tags, Tags (ADVANTAGE: unlimited tags, can add additional info | DISADVANTAGE: more work when inserting/updating, have to worry about orphans)
- [Tagging Speed Tests](http://howto.philippkeller.com/2005/06/19/Tagsystems-performance-tests/) - not the one referred to in the course, but good substitute

--------------------------------

    CREATE TABLE tags(
        id INT AUTO_INCREMENT PRIMARY KEY,
        tag_name VARCHAR(255) UNIQUE,
        created_at TIMESTAMP DEFAULT NOW()
    );

    CREATE TABLE photo_tags(
        photo_id INT NOT NULL,
        tag_id INT NOT NULL,
        FOREIGN KEY(photo_id) REFERENCES photos(id),
        FOREIGN KEY(tag_id) REFERENCES tags(id),
        PRIMARY KEY(photo_id, tag_id)
    );

    mysql> source MySQL/instagram/ig_clone.sql;                                                                                                                              ERROR 1007 (HY000): Can't create database 'ig_clone'; database exists
    Database changed
    ERROR 1050 (42S01): Table 'users' already exists
    ERROR 1050 (42S01): Table 'photos' already exists
    ERROR 1050 (42S01): Table 'comments' already exists
    ERROR 1050 (42S01): Table 'likes' already exists
    ERROR 1050 (42S01): Table 'follows' already exists
    Query OK, 0 rows affected (0.08 sec)

    Query OK, 0 rows affected (0.08 sec)

    mysql> SHOW TABLES;
    +--------------------+
    | Tables_in_ig_clone |
    +--------------------+
    | comments           |
    | follows            |
    | likes              |
    | photo_tags         |
    | photos             |
    | tags               |
    | users              |
    +--------------------+
    7 rows in set (0.00 sec)

    mysql> DESCRIBE tags;
    +------------+--------------+------+-----+-------------------+----------------+
    | Field      | Type         | Null | Key | Default           | Extra          |
    +------------+--------------+------+-----+-------------------+----------------+
    | id         | int(11)      | NO   | PRI | NULL              | auto_increment |
    | tag_name   | varchar(255) | YES  | UNI | NULL              |                |
    | created_at | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
    +------------+--------------+------+-----+-------------------+----------------+
    3 rows in set (0.00 sec)

    mysql> DESCRIBE photo_tags;
    +----------+---------+------+-----+---------+-------+
    | Field    | Type    | Null | Key | Default | Extra |
    +----------+---------+------+-----+---------+-------+
    | photo_id | int(11) | NO   | PRI | NULL    |       |
    | tag_id   | int(11) | NO   | PRI | NULL    |       |
    +----------+---------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

**********************************************************

## WORKING WITH INSTAGRAM DATA

*********************************************************

### INSERTING DATA SET

- Updated ig_clone.sql to include "DROP DATABASE IF EXISTS ig_clone;"

--------------------------------

    mysql> source MySQL/instagram/ig_clone.sql;
    Query OK, 7 rows affected (0.25 sec)

    Query OK, 1 row affected (0.00 sec)

    Database changed
    Query OK, 0 rows affected (0.07 sec)

    Query OK, 0 rows affected (0.08 sec)

    Query OK, 0 rows affected (0.09 sec)

    Query OK, 0 rows affected (0.08 sec)

    Query OK, 0 rows affected (0.08 sec)

    Query OK, 0 rows affected (0.08 sec)

    Query OK, 0 rows affected (0.08 sec)

    Query OK, 100 rows affected (0.02 sec)
    Records: 100  Duplicates: 0  Warnings: 0

    Query OK, 257 rows affected (0.02 sec)
    Records: 257  Duplicates: 0  Warnings: 0

    Query OK, 7623 rows affected (0.24 sec)
    Records: 7623  Duplicates: 0  Warnings: 0

    Query OK, 7488 rows affected (0.41 sec)
    Records: 7488  Duplicates: 0  Warnings: 0

    Query OK, 8782 rows affected (0.37 sec)
    Records: 8782  Duplicates: 0  Warnings: 0

    Query OK, 21 rows affected (0.01 sec)
    Records: 21  Duplicates: 0  Warnings: 0

    Query OK, 501 rows affected (0.03 sec)
    Records: 501  Duplicates: 0  Warnings: 0

*****************************

### INSTAGRAM CODE CHALLENGES

--------------------------------------

#### CHALLENGE 1

- Find 5 oldest users

--------------------------------------

    mysql> SELECT 
        ->     username AS Username,
        ->     DATE_FORMAT(created_at, '%m/%d/%Y') AS Joined
        -> FROM users
        -> ORDER BY created_at
        ->     LIMIT 5;
    +------------------+------------+
    | Username         | Joined     |
    +------------------+------------+
    | Darby_Herzog     | 05/06/2016 |
    | Emilio_Bernier52 | 05/06/2016 |
    | Elenor88         | 05/08/2016 |
    | Nicole71         | 05/09/2016 |
    | Jordyn.Jacobson2 | 05/14/2016 |
    +------------------+------------+
    5 rows in set (0.00 sec)

    mysql> SELECT 
        ->     username AS Username,
        ->     DATE_FORMAT(created_at, '%M %D, %Y') AS Joined
        -> FROM users
        -> ORDER BY created_at
        ->     LIMIT 5;
    +------------------+----------------+
    | Username         | Joined         |
    +------------------+----------------+
    | Darby_Herzog     | May 6th, 2016  |
    | Emilio_Bernier52 | May 6th, 2016  |
    | Elenor88         | May 8th, 2016  |
    | Nicole71         | May 9th, 2016  |
    | Jordyn.Jacobson2 | May 14th, 2016 |
    +------------------+----------------+
    5 rows in set (0.00 sec)

--------------------------------------

#### CHALLENGE 2

- Most popular registration date

--------------------------------------

    mysql> SELECT 
        ->     DAYNAME(created_at) AS Day,
        ->     COUNT(*) AS Total
        -> FROM users
        -> GROUP BY Day
        -> ORDER BY Total DESC
        -> LIMIT 2;
    +----------+-------+
    | Day      | Total |
    +----------+-------+
    | Thursday |    16 |
    | Sunday   |    16 |
    +----------+-------+
    2 rows in set (0.01 sec)

--------------------------------------

#### CHALLENGE 3

- Find users who have never posted a photo

--------------------------------------

    mysql> SELECT
        ->     username AS User,
        ->     DATE_FORMAT(users.created_at, '%m/%d/%Y') AS Joined,
        ->     IFNULL(image_url, 'No Posts') AS Posts
        -> FROM users
        -> LEFT JOIN photos
        ->     ON users.id = photos.user_id
        -> WHERE photos.id IS NUll
        -> ORDER BY Joined DESC;
    +---------------------+------------+----------+
    | User                | Joined     | Posts    |
    +---------------------+------------+----------+
    | Duane60             | 12/21/2016 | No Posts |
    | Kasandra_Homenick   | 12/12/2016 | No Posts |
    | Aniya_Hackett       | 12/07/2016 | No Posts |
    | Franco_Keebler64    | 11/13/2016 | No Posts |
    | Bartholome.Bernhard | 11/06/2016 | No Posts |
    | Morgan.Kassulke     | 10/30/2016 | No Posts |
    | Tierra.Trantow      | 10/03/2016 | No Posts |
    | Leslie67            | 09/21/2016 | No Posts |
    | Jessyca_West        | 09/14/2016 | No Posts |
    | Ollie_Ledner37      | 08/04/2016 | No Posts |
    | Janelle.Nikolaus81  | 07/21/2016 | No Posts |
    | Mckenna17           | 07/17/2016 | No Posts |
    | Pearl7              | 07/08/2016 | No Posts |
    | Mike.Auer39         | 07/01/2016 | No Posts |
    | Bethany20           | 06/03/2016 | No Posts |
    | Nia_Haag            | 05/14/2016 | No Posts |
    | Darby_Herzog        | 05/06/2016 | No Posts |
    | Maxwell.Halvorson   | 04/18/2017 | No Posts |
    | Esmeralda.Mraz57    | 03/03/2017 | No Posts |
    | Linnea59            | 02/07/2017 | No Posts |
    | Jaclyn81            | 02/06/2017 | No Posts |
    | David.Osinski47     | 02/05/2017 | No Posts |
    | Julien_Schmidt      | 02/02/2017 | No Posts |
    | Hulda.Macejkovic    | 01/25/2017 | No Posts |
    | Rocio33             | 01/23/2017 | No Posts |
    | Esther.Zulauf61     | 01/14/2017 | No Posts |
    +---------------------+------------+----------+
    26 rows in set (0.00 sec)

***Could have also used a RIGHT JOIN, to get the same result***

--------------------------------------

#### CHALLENGE 4

- Identify most popular photo & it's user

--------------------------------------

    mysql> SELECT
        ->     photos.image_url as Photo,
        ->     users.username as 'Posted by User',
        ->     COUNT(likes.user_id) AS Likes
        -> FROM photos
        -> INNER JOIN likes
        ->     ON likes.photo_id = photos.id
        -> INNER JOIN users
        ->     ON users.id = photos.user_id
        -> GROUP BY photos.id
        -> ORDER BY Likes DESC
        ->     LIMIT 1;
    +---------------------+----------------+-------+
    | Photo               | Posted by User | Likes |
    +---------------------+----------------+-------+
    | https://jarret.name | Zack_Kemmer93  |    48 |
    +---------------------+----------------+-------+
    1 row in set (0.00 sec)

--------------------------------------

#### CHALLENGE 5

- Average Posts for Users

--------------------------------------

    mysql> SELECT
        ->     (SELECT
        ->         COUNT(*)
        ->     FROM photos) /
        ->     (SELECT
        ->         COUNT(*)
        ->     FROM users) AS Average;
    +---------+
    | Average |
    +---------+
    |  2.5700 |
    +---------+
    1 row in set (0.00 sec)

--------------------------------------

#### CHALLENGE 6

- Five Most Commonly Used Hashtags

--------------------------------------

    mysql> SELECT
        ->     tag_name AS Hashtag,
        ->     COUNT(*) AS Used
        -> FROM tags
        -> INNER JOIN photo_tags
        ->     ON photo_tags.tag_id = tags.id
        -> GROUP BY Hashtag
        -> ORDER BY Used DESC
        ->     LIMIT 5;
    +---------+------+
    | Hashtag | Used |
    +---------+------+
    | smile   |   59 |
    | beach   |   42 |
    | party   |   39 |
    | fun     |   38 |
    | concert |   24 |
    +---------+------+
    5 rows in set (0.01 sec)

--------------------------------------

#### CHALLENGE 7

- Identifying Bots

--------------------------------------

    mysql> SELECT
        ->     username AS User,
        ->     COUNT(*) AS Likes
        -> FROM users
        -> INNER JOIN likes
        ->     ON likes.user_id = users.id
        -> GROUP BY likes.user_id
        -> HAVING Likes = (SELECT COUNT(*) FROM photos);
    +--------------------+-------+
    | User               | Likes |
    +--------------------+-------+
    | Aniya_Hackett      |   257 |
    | Jaclyn81           |   257 |
    | Rocio33            |   257 |
    | Maxwell.Halvorson  |   257 |
    | Ollie_Ledner37     |   257 |
    | Mckenna17          |   257 |
    | Duane60            |   257 |
    | Julien_Schmidt     |   257 |
    | Mike.Auer39        |   257 |
    | Nia_Haag           |   257 |
    | Leslie67           |   257 |
    | Janelle.Nikolaus81 |   257 |
    | Bethany20          |   257 |
    +--------------------+-------+
    13 rows in set (0.01 sec)