# WHAT IS SQL

>* Structured Query Language
* SQL is the language used to interact with data in a DB
* SQL is a relational DB

##### QUICK PREVIEW

"Find all users who are 18 or older" => SELECT * FROM Users WHERE Age >= 18;

##### Working with MySWL is primarily Writing SQL

COMMON Relational DBMS > all using SQL

>* MySQL
* SQLite
* PostgesSQL
* Oracle
* Many others

**[MySQL](https://dev.mysql.com/doc/)**
~~~
"SELECT * FROM Users WHERE Age >= 18;"
~~~
*and*
            
***PostgesSQL***
~~~
"SELECT * FROM Users WHERE Age >= 18;"
~~~

>* There are slight differences in syntax
* There is an SQL Standard
* Once you learn SQL it is easy to switch between DBMS

~~~
to start MySQL in c9
mysql-ctl start

to access interface
mysql-ctl cli

to exit interface
exit; quit; \q; or ctl+c

to stop
mysql-ctl stop

to show dbs
show databases

to create a db:
CREATE DATABASE <name>;

to delete a db:
DROP DATABASE <name>;

to use a db;
USE <db name>;

identify what DB being used:
SELECT database();
~~~

___

## [TABLES](https://dev.mysql.com/doc/refman/8.0/en/tables-table.html)

>- Heart of SQL
- A db is just a bunch of tables

___

##### [Data Types](https://dev.mysql.com/doc/refman/8.0/en/data-type-overview.html)


Numeric         String          Date
-------------------------------------------
* INT           * CHAR          * DATE
* SMALLINT      * VARCHAR       * DATETIME
* TINYINT       * BINARY        * TIMESTAMP
* MEDIUMINT     * VARBINARY     * TIME
* BIGINT        * BLOB          * YEAR
* DECIMAL       * TINYBLOB 
* NUMERIC       * MEDIUMBLOB
* FLOART        * LONGBLOB
* DIUBLE        * TEXT
* BIT           * TINYTEXT
                * MEDIUMTEXT
                * LONGTEXT
                * ENUM

##### [INT](https://dev.mysql.com/doc/refman/8.0/en/integer-types.html)

>- A whole number
- Nax value 2147483647

##### [VARCHAR](https://dev.mysql.com/doc/refman/8.0/en/char.html)

>- A variable-length string
- Between 1 & 255

___
#### EXERCISE
___

USERNAME        TWEET           LIKES
----------------------------------------
VARCHAR(15)     VARCHAR(140)    INT

~~~
CREATE TABLE tablename<shoulde be plurralized>
    (
        column_name data_type,
        column_name data_type
    );

    CREATE TABLE cats
        (
            name VARCHAR(100),
            age INT
        ),
~~~
___
    
## CREATING [DB](https://dev.mysql.com/doc/refman/8.0/en/create-database.html) & [TABLE](https://dev.mysql.com/doc/refman/8.0/en/create-table.html)
~~~
mysql> CREATE DATABASE dog_app;

mysql> use dog_app;

mysql> CREATE TABLE dogs (name VARCHAR(100), age INT);
~~~    
*Now to check if tables/dbs were created*
~~~
mysql> SHOW TABLES;

mysql> SHOW COLUMNS FROM <tablename>;
~~~
*Or....*
~~~
mysql> DESC <tablename>;   
~~~
*Though not identical*

___

### [Deleting Tables](https://dev.mysql.com/doc/refman/8.0/en/delete.html)

- To delete a table use "DROP TABLE <tablename>;"
- Create database <bakery_app>
- Use <bakery_app>
- Create the table <pasteries (name VARCHAR(50), quantity INT)>
- Desc <pasteries>
- DROP TABLE <pasteries>

___

    mysql> CREATE DATABASE bakery_app;
    Query OK, 1 row affected (0.00 sec)

    mysql> use bakery_app;
    Database changed
    mysql> CREATE TABLE pasteries (name VARCHAR(50), quantity INT);
    Query OK, 0 rows affected (0.02 sec)

    mysql> DESC pasteries
        -> ;
    +----------+-------------+------+-----+---------+-------+
    | Field    | Type        | Null | Key | Default | Extra |
    +----------+-------------+------+-----+---------+-------+
    | name     | varchar(50) | YES  |     | NULL    |       |
    | quantity | int(11)     | YES  |     | NULL    |       |
    +----------+-------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

    mysql> DROP TABLE pasteries;
    Query OK, 0 rows affected (0.01 sec)

    mysql> DROP DATABASE bakery_app;
    Query OK, 0 rows affected (0.00 sec)

******************************************

### [INSERT](https://dev.mysql.com/doc/refman/8.0/en/insert.html) command

- INSERT INTO dogs(name, age) VALUES ('Name', X);

-----------------------------------------------------

    mysql> use dog_app
    Database changed
    mysql> create table (name VARCHAR(100), age INT);
    ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(name VARCHAR(100), age INT)' at line 1
    mysql> create table dogs (name VARCHAR(100), age INT);                                                                                      
    Query OK, 0 rows affected (0.02 sec)

    mysql> INSERT INTO dogs(name, age)
        -> VALUES ('Saide', 8);
    Query OK, 1 row affected (0.01 sec)

    mysql> INSERT INTO dogs(name, age) VALUES ('Sadie', 8);                                                                                     
    Query OK, 1 row affected (0.00 sec)

    mysql> INSERT INTO dogs(name, age) VALUES ('Tank', 8);                                                                                      
    Query OK, 1 row affected (0.01 sec)

    mysql> INSERT INTO dogs(name, age) VALUES ('Alex', 11);                                                                                    
    Query OK, 1 row affected (0.01 sec)

    mysql> INSERT INTO dogs(name, age) VALUES ('Elway', 3);                                                                                   
    Query OK, 1 row affected (0.01 sec)

    mysql> INSERT INTO dogs(name, age) VALUES ('Tilly', 1);                                                                                    
    Query OK, 1 row affected (0.01 sec)

    mysql> desc dogs;
    +-------+--------------+------+-----+---------+-------+
    | Field | Type         | Null | Key | Default | Extra |
    +-------+--------------+------+-----+---------+-------+
    | name  | varchar(100) | YES  |     | NULL    |       |
    | age   | int(11)      | YES  |     | NULL    |       |
    +-------+--------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

*************************************

### How to check for data

---------------------------------------

    mysql> select * from dogs;
    +-------+------+
    | name  | age  |
    +-------+------+
    | Saide |    8 |
    | Sadie |    8 |
    | Tank  |    8 |
    | Alex  |   11 |
    | Elway |    3 |
    | Tilly |    1 |
    +-------+------+
    6 rows in set (0.00 sec)
    
***There is a lot more to do with SELECT command***

*****************************************************

### MULTIPLE INSERT

    INSERT INTO dogs (name, age)
    VALUES ('name1',  5),
           ('name2', 3),
           ('name3', 7);
           
--------------------------------------------------

    mysql> INSERT INTO dogs (name, age) VALUES ('Roxy', 10), ('Boo', 1);
    Query OK, 2 rows affected (0.01 sec)
    Records: 2  Duplicates: 0  Warnings: 0

*********************************************************
#### EXERCISE
*********************************************************

    mysql> CREATE DATABASE people_app;
    Query OK, 1 row affected (0.00 sec)

    mysql> use people_app;
    Database changed
    mysql> create table people (first_name varchar(50), last_name varchar(50), age int);
    Query OK, 0 rows affected (0.02 sec)

    mysql> desc people;
    +------------+-------------+------+-----+---------+-------+
    | Field      | Type        | Null | Key | Default | Extra |
    +------------+-------------+------+-----+---------+-------+
    | first_name | varchar(50) | YES  |     | NULL    |       |
    | last_name  | varchar(50) | YES  |     | NULL    |       |
    | age        | int(11)     | YES  |     | NULL    |       |
    +------------+-------------+------+-----+---------+-------+
    3 rows in set (0.01 sec)

    mysql> insert into people (first_name, last_name, age) value ('Chris', 'Smith', 35);
    Query OK, 1 row affected (0.02 sec)

    mysql> insert into people (last_name, age, first_name) value ('Marcon', 37, 'Matt');
    Query OK, 1 row affected (0.01 sec)

    mysql> insert into people (first_name, last_name, age) values ('Tim', 'Adkins', 42), ('Corey', 'Wood', 38), ('Jeff', 'Bockelman', 34);
    Query OK, 3 rows affected (0.00 sec)
    Records: 3  Duplicates: 0  Warnings: 0

    mysql> select * from people;
    +------------+-----------+------+
    | first_name | last_name | age  |
    +------------+-----------+------+
    | Chris      | Smith     |   35 |
    | Matt       | Marcon    |   37 |
    | Tim        | Adkins    |   42 |
    | Corey      | Wood      |   38 |
    | Jeff       | Bockelman |   34 |
    +------------+-----------+------+
    5 rows in set (0.00 sec)

*********************************

## [WARNINGS](https://dev.mysql.com/doc/refman/8.0/en/show-warnings.html)

- SHOW WARNINGS; - will allow you to check any warnings
- If a string is too long, it will get truncated. So the extra characters will be completely cut off
- If a string is enter in an INT field, you will receive a warning: Incorrect interger value. The INT will be saved as 0.

***********************************************

## [NULL and NOT_NULL](https://dev.mysql.com/doc/refman/8.0/en/working-with-null.html)

- Value is unknown
- NULL YES means it is ok that it doesn't have a value.
- The value will reflect in the table as NULL

************************************************

### HOW TO REQUIRE NOT_NULL

- CREATE TABLE dogs2 (name VARCHAR(100) NOT NULL, age INT NOT NULL);

-------------------------------------------

    mysql> CREATE TABLE dogs2 (name VARCHAR(100) NOT NULL, age INT NOT NULL);
    Query OK, 0 rows affected (0.05 sec)

    mysql> desc dogs2;
    +-------+--------------+------+-----+---------+-------+
    | Field | Type         | Null | Key | Default | Extra |
    +-------+--------------+------+-----+---------+-------+
    | name  | varchar(100) | NO   |     | NULL    |       |
    | age   | int(11)      | NO   |     | NULL    |       |
    +-------+--------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

    mysql> insert into dogs2 (name) values('Sadie');
    Query OK, 1 row affected, 1 warning (0.01 sec)

    mysql> show warnings;
    +---------+------+------------------------------------------+
    | Level   | Code | Message                                  |
    +---------+------+------------------------------------------+
    | Warning | 1364 | Field 'age' doesn't have a default value |
    +---------+------+------------------------------------------+
    1 row in set (0.00 sec)

    mysql> select * from dogs2;
    +-------+-----+
    | name  | age |
    +-------+-----+
    | Sadie |   0 |
    +-------+-----+
    1 row in set (0.00 sec)

    mysql> insert into dogs2 (age) values (3);
    Query OK, 1 row affected, 1 warning (0.01 sec)

    mysql> show warnings;
    +---------+------+-------------------------------------------+
    | Level   | Code | Message                                   |
    +---------+------+-------------------------------------------+
    | Warning | 1364 | Field 'name' doesn't have a default value |
    +---------+------+-------------------------------------------+
    1 row in set (0.00 sec)

    mysql> desc dogs2;
    +-------+--------------+------+-----+---------+-------+
    | Field | Type         | Null | Key | Default | Extra |
    +-------+--------------+------+-----+---------+-------+
    | name  | varchar(100) | NO   |     | NULL    |       |
    | age   | int(11)      | NO   |     | NULL    |       |
    +-------+--------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

***********************************************

## DEFAULT VALUES

- Help to set up default values

--------------------------------------------

    mysql> CREATE TABLE dogs3 (name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99);
    Query OK, 0 rows affected (0.02 sec)

    mysql> insert into dogs3 (age) values (12);
    Query OK, 1 row affected (0.01 sec)

    mysql> select * from dogs3;
    +---------+------+
    | name    | age  |
    +---------+------+
    | unnamed |   12 |
    +---------+------+
    1 row in set (0.00 sec)

--------------------------------------------

    mysql> create table dogs4 (name VARCHAR(50) NOT NULL DEFAULT 'unnamed', age INT NOT NULL DEFAULT 99);                                       
    Query OK, 0 rows affected (0.01 sec)

    mysql> insert into dogs4 (name) values (Null);                                                                                              
    ERROR 1048 (23000): Column 'name' cannot be null

***If NOT_NULL is not enter, any variable could be entered in as NULL.***

*******************************

### PRIMARY KEYS

- Primary KEY is used to ensure data is uniquely identifiable
- To help keep things unique, add a Primary Key

-------------------------------------

    mysql> CREATE TABLE dogs5 (dog_id INT NOT NULL, name VARCHAR(50), age INT, PRIMARY KEY (dog_id));                                           
    Query OK, 0 rows affected (0.01 sec)

    mysql> DESC dogs5;
    +--------+-------------+------+-----+---------+-------+
    | Field  | Type        | Null | Key | Default | Extra |
    +--------+-------------+------+-----+---------+-------+
    | dog_id | int(11)     | NO   | PRI | NULL    |       |
    | name   | varchar(50) | YES  |     | NULL    |       |
    | age    | int(11)     | YES  |     | NULL    |       |
    +--------+-------------+------+-----+---------+-------+
    3 rows in set (0.00 sec)

    mysql> insert into dogs5 (dog_id, name, age) values(1, 'Sadie', 8);                                                                         
    Query OK, 1 row affected (0.00 sec)

    mysql> insert into dogs5 (dog_id, name, age) values(2, 'Tank', 8);                                                                          
    Query OK, 1 row affected (0.00 sec)

    mysql> insert into dogs5 (dog_id, name, age) VALUES(1, 'Elway', 4);
    ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

    mysql> select * from dogs5;
    +--------+-------+------+
    | dog_id | name  | age  |
    +--------+-------+------+
    |      1 | Sadie |    8 |
    |      2 | Tank  |    8 |
    +--------+-------+------+
    2 rows in set (0.00 sec)

-----------------------------------------------------

    mysql> create table dogs6 (dog_id INT NOT NULL AUTO_INCREMENT, name VARCHAR(50), age INT, PRIMARY KEY (dog_id));                            
    Query OK, 0 rows affected (0.02 sec)

    mysql> desc dogs6;
    +--------+-------------+------+-----+---------+----------------+
    | Field  | Type        | Null | Key | Default | Extra          |
    +--------+-------------+------+-----+---------+----------------+
    | dog_id | int(11)     | NO   | PRI | NULL    | auto_increment |
    | name   | varchar(50) | YES  |     | NULL    |                |
    | age    | int(11)     | YES  |     | NULL    |                |
    +--------+-------------+------+-----+---------+----------------+
    3 rows in set (0.01 sec)

    mysql> insert into dogs6(name, age) values('Sadie', 8), ('Tank', 8), ('Elway', 4), ('Boo', 1), ('Roxy', 11);
    Query OK, 5 rows affected (0.01 sec)
    Records: 5  Duplicates: 0  Warnings: 0

    mysql> select * from dogs6;
    +--------+-------+------+
    | dog_id | name  | age  |
    +--------+-------+------+
    |      1 | Sadie |    8 |
    |      2 | Tank  |    8 |
    |      3 | Elway |    4 |
    |      4 | Boo   |    1 |
    |      5 | Roxy  |   11 |
    +--------+-------+------+
    5 rows in set (0.00 sec)

*****************************
#### EXERCISE
*****************************

    mysql> create database employee_app;
    Query OK, 1 row affected (0.00 sec)

    mysql> use employee_app;
    Database changed

    mysql> create table employees(id INT NOT NULL AUTO_INCREMENT, last_name VARCHAR(20) NOT NULL, first_name VARCHAR(20) NOT NULL, middle_int VARCHAR(1), age INT NOT NULL, current_status VARCHAR(20) NOT NULL DEFAULT 'employed', PRIMARY KEY (id));
    Query OK, 0 rows affected (0.01 sec)

    mysql> desc employees;
    +----------------+-------------+------+-----+----------+----------------+
    | Field          | Type        | Null | Key | Default  | Extra          |
    +----------------+-------------+------+-----+----------+----------------+
    | id             | int(11)     | NO   | PRI | NULL     | auto_increment |
    | last_name      | varchar(20) | NO   |     | NULL     |                |
    | first_name     | varchar(20) | NO   |     | NULL     |                |
    | middle_int     | varchar(1)  | YES  |     | NULL     |                |
    | age            | int(11)     | NO   |     | NULL     |                |
    | current_status | varchar(20) | NO   |     | employed |                |
    +----------------+-------------+------+-----+----------+----------------+
    6 rows in set (0.00 sec)


***COULD ALSO SET UP TABLE LIKE SO:***

    create table employees(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, last_name VARCHAR(20) NOT NULL, first_name VARCHAR(20) NOT NULL, middle_int VARCHAR(1), age INT NOT NULL, current_status VARCHAR(20) NOT NULL DEFAULT 'employed');

********************************************************

## CRUD

- Create (INSERT INTO)
- Read
- Update
- Delete/Destroy

------------------------------------------------------

    mysql> create database cat_app;
    Query OK, 1 row affected (0.00 sec)

    mysql> use cat_app;
    Database changed
    mysql> 
    mysql> create table cats (cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), breed VARCHAR(100), age INT);
    Query OK, 0 rows affected (0.01 sec)

    mysql> desc cats;
    +--------+--------------+------+-----+---------+----------------+
    | Field  | Type         | Null | Key | Default | Extra          |
    +--------+--------------+------+-----+---------+----------------+
    | cat_id | int(11)      | NO   | PRI | NULL    | auto_increment |
    | name   | varchar(100) | YES  |     | NULL    |                |
    | breed  | varchar(100) | YES  |     | NULL    |                |
    | age    | int(11)      | YES  |     | NULL    |                |
    +--------+--------------+------+-----+---------+----------------+
    4 rows in set (0.00 sec)

    mysql> insert into cats (name, breed, age) values ('Ringo', 'Tabby', 4), ('Cindy', 'Maine Coon', 10), ('Dumbledore', 'Maine Coon', 11), ('Egg', 'Persian', 4), ('Misty', 'Tabby', 13), ('George Michael', 'Ragdoll', 9), ('Jackson', 'Sphynx', 7);                                     
    Query OK, 7 rows affected (0.03 sec)
    Records: 7  Duplicates: 0  Warnings: 0

*********************************************************

### Read data

- SELECT * FROM cats;
- "*" means select all colums from the table 'cats'

-----------------------------------------

    mysql> select * from cats
        -> ;
    +--------+----------------+------------+------+
    | cat_id | name           | breed      | age  |
    +--------+----------------+------------+------+
    |      1 | Ringo          | Tabby      |    4 |
    |      2 | Cindy          | Maine Coon |   10 |
    |      3 | Dumbledore     | Maine Coon |   11 |
    |      4 | Egg            | Persian    |    4 |
    |      5 | Misty          | Tabby      |   13 |
    |      6 | George Michael | Ragdoll    |    9 |
    |      7 | Jackson        | Sphynx     |    7 |
    +--------+----------------+------------+------+
    7 rows in set (0.00 sec)

***SELECT Expression is how we select a specific column.***

    mysql> select name from cats;
    +----------------+
    | name           |
    +----------------+
    | Ringo          |
    | Cindy          |
    | Dumbledore     |
    | Egg            |
    | Misty          |
    | George Michael |
    | Jackson        |
    +----------------+
    7 rows in set (0.00 sec)

    mysql> select age from cats;
    +------+
    | age  |
    +------+
    |    4 |
    |   10 |
    |   11 |
    |    4 |
    |   13 |
    |    9 |
    |    7 |
    +------+
    7 rows in set (0.00 sec)

    mysql> select breed from cats;
    +------------+
    | breed      |
    +------------+
    | Tabby      |
    | Maine Coon |
    | Maine Coon |
    | Persian    |
    | Tabby      |
    | Ragdoll    |
    | Sphynx     |
    +------------+
    7 rows in set (0.00 sec)

    mysql> select name, age from cats;
    +----------------+------+
    | name           | age  |
    +----------------+------+
    | Ringo          |    4 |
    | Cindy          |   10 |
    | Dumbledore     |   11 |
    | Egg            |    4 |
    | Misty          |   13 |
    | George Michael |    9 |
    | Jackson        |    7 |
    +----------------+------+
    7 rows in set (0.00 sec)

    mysql> select cat_id, name, age from cats;
    +--------+----------------+------+
    | cat_id | name           | age  |
    +--------+----------------+------+
    |      1 | Ringo          |    4 |
    |      2 | Cindy          |   10 |
    |      3 | Dumbledore     |   11 |
    |      4 | Egg            |    4 |
    |      5 | Misty          |   13 |
    |      6 | George Michael |    9 |
    |      7 | Jackson        |    7 |
    +--------+----------------+------+
    7 rows in set (0.00 sec)

    mysql> select cat_id, name, age, breed from cats;
    +--------+----------------+------+------------+
    | cat_id | name           | age  | breed      |
    +--------+----------------+------+------------+
    |      1 | Ringo          |    4 | Tabby      |
    |      2 | Cindy          |   10 | Maine Coon |
    |      3 | Dumbledore     |   11 | Maine Coon |
    |      4 | Egg            |    4 | Persian    |
    |      5 | Misty          |   13 | Tabby      |
    |      6 | George Michael |    9 | Ragdoll    |
    |      7 | Jackson        |    7 | Sphynx     |
    +--------+----------------+------+------------+
    7 rows in set (0.00 sec)

    mysql> select age, breed, name, cat_id from cats;
    +------+------------+----------------+--------+
    | age  | breed      | name           | cat_id |
    +------+------------+----------------+--------+
    |    4 | Tabby      | Ringo          |      1 |
    |   10 | Maine Coon | Cindy          |      2 |
    |   11 | Maine Coon | Dumbledore     |      3 |
    |    4 | Persian    | Egg            |      4 |
    |   13 | Tabby      | Misty          |      5 |
    |    9 | Ragdoll    | George Michael |      6 |
    |    7 | Sphynx     | Jackson        |      7 |
    +------+------------+----------------+--------+
    7 rows in set (0.00 sec)

*******************************************************

## Intro to WHERE

- The WHERE clause allows you to select data specifically.

------------------------------------------------------

    mysql> select * from cats where age=4;
    +--------+-------+---------+------+
    | cat_id | name  | breed   | age  |
    +--------+-------+---------+------+
    |      1 | Ringo | Tabby   |    4 |
    |      4 | Egg   | Persian |    4 |
    +--------+-------+---------+------+
    2 rows in set (0.00 sec)

    mysql> select * from cats where name='Egg';                                                                                                 
    +--------+------+---------+------+
    | cat_id | name | breed   | age  |
    +--------+------+---------+------+
    |      4 | Egg  | Persian |    4 |
    +--------+------+---------+------+
    1 row in set (0.00 sec)

    mysql> select * from cats where name='EGG';
    +--------+------+---------+------+
    | cat_id | name | breed   | age  |
    +--------+------+---------+------+
    |      4 | Egg  | Persian |    4 |
    +--------+------+---------+------+
    1 row in set (0.00 sec)

***By default, case insensitive***

****************************************
#### EXERCISES
****************************************

    mysql> select cat_id from cats;
    +--------+
    | cat_id |
    +--------+
    |      1 |
    |      2 |
    |      3 |
    |      4 |
    |      5 |
    |      6 |
    |      7 |
    +--------+
    7 rows in set (0.00 sec)

    mysql> select name, breed from cats;
    +----------------+------------+
    | name           | breed      |
    +----------------+------------+
    | Ringo          | Tabby      |
    | Cindy          | Maine Coon |
    | Dumbledore     | Maine Coon |
    | Egg            | Persian    |
    | Misty          | Tabby      |
    | George Michael | Ragdoll    |
    | Jackson        | Sphynx     |
    +----------------+------------+
    7 rows in set (0.00 sec)

    mysql> select name, age from cats where breed='Tabby';
    +-------+------+
    | name  | age  |
    +-------+------+
    | Ringo |    4 |
    | Misty |   13 |
    +-------+------+
    2 rows in set (0.00 sec)

    mysql> select cat_id, age from cats where cat_id=age;
    +--------+------+
    | cat_id | age  |
    +--------+------+
    |      4 |    4 |
    |      7 |    7 |
    +--------+------+
    2 rows in set (0.00 sec)

***********************************************************

## Intro to ALIASES

- Easier to read results

----------------------------------------------------------

    mysql> select cat_id as id, name from cats;
    +----+----------------+
    | id | name           |
    +----+----------------+
    |  1 | Ringo          |
    |  2 | Cindy          |
    |  3 | Dumbledore     |
    |  4 | Egg            |
    |  5 | Misty          |
    |  6 | George Michael |
    |  7 | Jackson        |
    +----+----------------+
    7 rows in set (0.00 sec)

    mysql> select cat_id as id, name as cat from cats;                                                                                          
    +----+----------------+
    | id | cat            |
    +----+----------------+
    |  1 | Ringo          |
    |  2 | Cindy          |
    |  3 | Dumbledore     |
    |  4 | Egg            |
    |  5 | Misty          |
    |  6 | George Michael |
    |  7 | Jackson        |
    +----+----------------+
    7 rows in set (0.00 sec)

    mysql> desc cats;
    +--------+--------------+------+-----+---------+----------------+
    | Field  | Type         | Null | Key | Default | Extra          |
    +--------+--------------+------+-----+---------+----------------+
    | cat_id | int(11)      | NO   | PRI | NULL    | auto_increment |
    | name   | varchar(100) | YES  |     | NULL    |                |
    | breed  | varchar(100) | YES  |     | NULL    |                |
    | age    | int(11)      | YES  |     | NULL    |                |
    +--------+--------------+------+-----+---------+----------------+
    4 rows in set (0.00 sec)

*********************************************************************

### the UPDATE command

-------------------------------------------------------

    mysql> update cats set breed='Shorthair' where breed='Tabby';
    Query OK, 2 rows affected (0.01 sec)
    Rows matched: 2  Changed: 2  Warnings: 0

    mysql> select * from cats;
    +--------+----------------+------------+------+
    | cat_id | name           | breed      | age  |
    +--------+----------------+------------+------+
    |      1 | Ringo          | Shorthair  |    4 |
    |      2 | Cindy          | Maine Coon |   10 |
    |      3 | Dumbledore     | Maine Coon |   11 |
    |      4 | Egg            | Persian    |    4 |
    |      5 | Misty          | Shorthair  |   13 |
    |      6 | George Michael | Ragdoll    |    9 |
    |      7 | Jackson        | Sphynx     |    7 |
    +--------+----------------+------------+------+
    7 rows in set (0.01 sec)

    mysql> update cats set age=14 where name='Misty';
    Query OK, 1 row affected (0.01 sec)
    Rows matched: 1  Changed: 1  Warnings: 0

    mysql> select * from cats;
    +--------+----------------+------------+------+
    | cat_id | name           | breed      | age  |
    +--------+----------------+------------+------+
    |      1 | Ringo          | Shorthair  |    4 |
    |      2 | Cindy          | Maine Coon |   10 |
    |      3 | Dumbledore     | Maine Coon |   11 |
    |      4 | Egg            | Persian    |    4 |
    |      5 | Misty          | Shorthair  |   14 |
    |      6 | George Michael | Ragdoll    |    9 |
    |      7 | Jackson        | Sphynx     |    7 |
    +--------+----------------+------------+------+
    7 rows in set (0.00 sec)

***UPDATING RULE OF THUMB:***

    Try SELECTing before UPDATE

********************************************************
#### EXERCISES
********************************************************

    mysql> update cats set name='Jack' where name='Jackson';                                                                               
    Query OK, 1 row affected (0.01 sec)
    Rows matched: 1  Changed: 1  Warnings: 0
    mysql> select * from cats;
    +--------+----------------+------------+------+
    | cat_id | name           | breed      | age  |
    +--------+----------------+------------+------+
    |      1 | Ringo          | Shorthair  |    4 |
    |      2 | Cindy          | Maine Coon |   10 |
    |      3 | Dumbledore     | Maine Coon |   11 |
    |      4 | Egg            | Persian    |    4 |
    |      5 | Misty          | Shorthair  |   14 |
    |      6 | George Michael | Ragdoll    |    9 |
    |      7 | Jack           | Sphynx     |    7 |
    +--------+----------------+------------+------+
    7 rows in set (0.00 sec)

    mysql> update cats set breed='British Shorthair' where name='Ringo';
    Query OK, 1 row affected (0.01 sec)
    Rows matched: 1  Changed: 1  Warnings: 0

    mysql> select * from cats;
    +--------+----------------+-------------------+------+
    | cat_id | name           | breed             | age  |
    +--------+----------------+-------------------+------+
    |      1 | Ringo          | British Shorthair |    4 |
    |      2 | Cindy          | Maine Coon        |   10 |
    |      3 | Dumbledore     | Maine Coon        |   11 |
    |      4 | Egg            | Persian           |    4 |
    |      5 | Misty          | Shorthair         |   14 |
    |      6 | George Michael | Ragdoll           |    9 |
    |      7 | Jack           | Sphynx            |    7 |
    +--------+----------------+-------------------+------+
    7 rows in set (0.00 sec)

    mysql> update cats set age=12 where breed='Maine Coon';
    Query OK, 2 rows affected (0.01 sec)
    Rows matched: 2  Changed: 2  Warnings: 0

    mysql> select * from cats;
    +--------+----------------+-------------------+------+
    | cat_id | name           | breed             | age  |
    +--------+----------------+-------------------+------+
    |      1 | Ringo          | British Shorthair |    4 |
    |      2 | Cindy          | Maine Coon        |   12 |
    |      3 | Dumbledore     | Maine Coon        |   12 |
    |      4 | Egg            | Persian           |    4 |
    |      5 | Misty          | Shorthair         |   14 |
    |      6 | George Michael | Ragdoll           |    9 |
    |      7 | Jack           | Sphynx            |    7 |
    +--------+----------------+-------------------+------+
    7 rows in set (0.00 sec)

****************************************************************

## Intro to DELETE/DESTROY

- More important to select * from <table> prior to deleting

--------------------------------------------------------

    mysql> delete from cats where name='egg';
    Query OK, 1 row affected (0.00 sec)

    mysql> select * from cats;
    +--------+----------------+-------------------+------+
    | cat_id | name           | breed             | age  |
    +--------+----------------+-------------------+------+
    |      1 | Ringo          | British Shorthair |    4 |
    |      2 | Cindy          | Maine Coon        |   12 |
    |      3 | Dumbledore     | Maine Coon        |   12 |
    |      5 | Misty          | Shorthair         |   14 |
    |      6 | George Michael | Ragdoll           |    9 |
    |      7 | Jack           | Sphynx            |    7 |
    +--------+----------------+-------------------+------+
    6 rows in set (0.00 sec)

***"DELETE FROM cats;" will delete the content, but not the tables***

****************************************************
#### EXERCISE
****************************************************

    mysql> select * from cats;
    +--------+----------------+-------------------+------+
    | cat_id | name           | breed             | age  |
    +--------+----------------+-------------------+------+
    |      1 | Ringo          | British Shorthair |    4 |
    |      2 | Cindy          | Maine Coon        |   12 |
    |      3 | Dumbledore     | Maine Coon        |   12 |
    |      5 | Misty          | Shorthair         |   14 |
    |      6 | George Michael | Ragdoll           |    9 |
    |      7 | Jack           | Sphynx            |    7 |
    +--------+----------------+-------------------+------+
    6 rows in set (0.00 sec)

    mysql> select * from cats where age=4;
    +--------+-------+-------------------+------+
    | cat_id | name  | breed             | age  |
    +--------+-------+-------------------+------+
    |      1 | Ringo | British Shorthair |    4 |
    +--------+-------+-------------------+------+
    1 row in set (0.00 sec)

    mysql> delete from cats where age=4;
    Query OK, 1 row affected (0.00 sec)

    mysql> select * from cats;
    +--------+----------------+------------+------+
    | cat_id | name           | breed      | age  |
    +--------+----------------+------------+------+
    |      2 | Cindy          | Maine Coon |   12 |
    |      3 | Dumbledore     | Maine Coon |   12 |
    |      5 | Misty          | Shorthair  |   14 |
    |      6 | George Michael | Ragdoll    |    9 |
    |      7 | Jack           | Sphynx     |    7 |
    +--------+----------------+------------+------+
    5 rows in set (0.00 sec)

    mysql> delete from cats where cat_id=age;
    Query OK, 1 row affected (0.02 sec)

    mysql> delete from cats;
    Query OK, 4 rows affected (0.01 sec)

    mysql> select * from cats;
    Empty set (0.00 sec)

******************************************************
#### CRUD Challenge Section
******************************************************

- SIZE is an internal SQL term, so better to avoid using

------------------------------------------------------------------

    mysql> create database shirts_db;
    Query OK, 1 row affected (0.00 sec)

    mysql> use shirts_db;
    Database changed
    mysql> create table shirts (shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, article VARCHAR(30), color VARCHAR(30), shirt_size VARCHAR(5),last_worn INT);
    Query OK, 0 rows affected (0.02 sec)

    mysql> insert into shirts(article, color, shirt_size, last_worn) values ('t-shirt', 'white', 's', 10), ('t-shirt', 'green', 's', 200), ('polo shirt', 'black', 'm', 10), ('tank top', 'blue', 's', 50), ('t-shirt', 'pink', 's', 0), ('polo shirt', 'red', 'm', 5), ('tank top', 'white', 's', 200), ('tank top', 'blue', 'm', 15);
    Query OK, 8 rows affected (0.01 sec)
    Records: 8  Duplicates: 0  Warnings: 0

    mysql> select * from shirts;
    +----------+------------+-------+------------+-----------+
    | shirt_id | article    | color | shirt_size | last_worn |
    +----------+------------+-------+------------+-----------+
    |        1 | t-shirt    | white | s          |        10 |
    |        2 | t-shirt    | green | s          |       200 |
    |        3 | polo shirt | black | m          |        10 |
    |        4 | tank top   | blue  | s          |        50 |
    |        5 | t-shirt    | pink  | s          |         0 |
    |        6 | polo shirt | red   | m          |         5 |
    |        7 | tank top   | white | s          |       200 |
    |        8 | tank top   | blue  | m          |        15 |
    +----------+------------+-------+------------+-----------+
    8 rows in set (0.00 sec)

    mysql> insert into shirts(color, article, shirt_size, last_worn) values('purple', 'polo shirt', 'm', 50);
    Query OK, 1 row affected (0.01 sec)

    mysql> select * from shirts;
    +----------+------------+--------+------------+-----------+
    | shirt_id | article    | color  | shirt_size | last_worn |
    +----------+------------+--------+------------+-----------+
    |        1 | t-shirt    | white  | s          |        10 |
    |        2 | t-shirt    | green  | s          |       200 |
    |        3 | polo shirt | black  | m          |        10 |
    |        4 | tank top   | blue   | s          |        50 |
    |        5 | t-shirt    | pink   | s          |         0 |
    |        6 | polo shirt | red    | m          |         5 |
    |        7 | tank top   | white  | s          |       200 |
    |        8 | tank top   | blue   | m          |        15 |
    |        9 | polo shirt | purple | m          |        50 |
    +----------+------------+--------+------------+-----------+
    9 rows in set (0.00 sec)

    mysql> select article, color from shirts;
    +------------+--------+
    | article    | color  |
    +------------+--------+
    | t-shirt    | white  |
    | t-shirt    | green  |
    | polo shirt | black  |
    | tank top   | blue   |
    | t-shirt    | pink   |
    | polo shirt | red    |
    | tank top   | white  |
    | tank top   | blue   |
    | polo shirt | purple |
    +------------+--------+
    9 rows in set (0.00 sec)

    mysql> select article, color, last_worn from shirts where shirt_size='m';
    +------------+--------+-----------+
    | article    | color  | last_worn |
    +------------+--------+-----------+
    | polo shirt | black  |        10 |
    | polo shirt | red    |         5 |
    | tank top   | blue   |        15 |
    | polo shirt | purple |        50 |
    +------------+--------+-----------+
    4 rows in set (0.00 sec)

    mysql> select article, color, shirt_size, last_worn from shirts where shirt_size='m';                                                       
    +------------+--------+------------+-----------+
    | article    | color  | shirt_size | last_worn |
    +------------+--------+------------+-----------+
    | polo shirt | black  | m          |        10 |
    | polo shirt | red    | m          |         5 |
    | tank top   | blue   | m          |        15 |
    | polo shirt | purple | m          |        50 |
    +------------+--------+------------+-----------+
    4 rows in set (0.00 sec)

    mysql> update shirts set shirt_size='l' where article='polo shirt';
    Query OK, 3 rows affected (0.01 sec)
    Rows matched: 3  Changed: 3  Warnings: 0

    mysql> select * from shirts;
    +----------+------------+--------+------------+-----------+
    | shirt_id | article    | color  | shirt_size | last_worn |
    +----------+------------+--------+------------+-----------+
    |        1 | t-shirt    | white  | s          |        10 |
    |        2 | t-shirt    | green  | s          |       200 |
    |        3 | polo shirt | black  | l          |        10 |
    |        4 | tank top   | blue   | s          |        50 |
    |        5 | t-shirt    | pink   | s          |         0 |
    |        6 | polo shirt | red    | l          |         5 |
    |        7 | tank top   | white  | s          |       200 |
    |        8 | tank top   | blue   | m          |        15 |
    |        9 | polo shirt | purple | l          |        50 |
    +----------+------------+--------+------------+-----------+
    9 rows in set (0.00 sec)

    mysql> select * from shirts;
    +----------+------------+--------+------------+-----------+
    | shirt_id | article    | color  | shirt_size | last_worn |
    +----------+------------+--------+------------+-----------+
    |        1 | t-shirt    | white  | s          |        10 |
    |        2 | t-shirt    | green  | s          |       200 |
    |        3 | polo shirt | black  | l          |        10 |
    |        4 | tank top   | blue   | s          |        50 |
    |        5 | t-shirt    | pink   | s          |         0 |
    |        6 | polo shirt | red    | l          |         5 |
    |        7 | tank top   | white  | s          |       200 |
    |        8 | tank top   | blue   | m          |         0 |
    |        9 | polo shirt | purple | l          |        50 |
    +----------+------------+--------+------------+-----------+
    9 rows in set (0.00 sec)

    mysql> update shirts set shirt_size='xs', color='off white' where color='white';
    Query OK, 2 rows affected (0.01 sec)
    Rows matched: 2  Changed: 2  Warnings: 0

    mysql> select * from shirts;
    +----------+------------+-----------+------------+-----------+
    | shirt_id | article    | color     | shirt_size | last_worn |
    +----------+------------+-----------+------------+-----------+
    |        1 | t-shirt    | off white | xs         |        10 |
    |        2 | t-shirt    | green     | s          |       200 |
    |        3 | polo shirt | black     | l          |        10 |
    |        4 | tank top   | blue      | s          |        50 |
    |        5 | t-shirt    | pink      | s          |         0 |
    |        6 | polo shirt | red       | l          |         5 |
    |        7 | tank top   | off white | xs         |       200 |
    |        8 | tank top   | blue      | m          |         0 |
    |        9 | polo shirt | purple    | l          |        50 |
    +----------+------------+-----------+------------+-----------+
    9 rows in set (0.00 sec)

    mysql> delete from shirts where last_worn=200;
    Query OK, 2 rows affected (0.01 sec)

    mysql> select * from shirts;
    +----------+------------+-----------+------------+-----------+
    | shirt_id | article    | color     | shirt_size | last_worn |
    +----------+------------+-----------+------------+-----------+
    |        1 | t-shirt    | off white | xs         |        10 |
    |        3 | polo shirt | black     | l          |        10 |
    |        4 | tank top   | blue      | s          |        50 |
    |        5 | t-shirt    | pink      | s          |         0 |
    |        6 | polo shirt | red       | l          |         5 |
    |        8 | tank top   | blue      | m          |         0 |
    |        9 | polo shirt | purple    | l          |        50 |
    +----------+------------+-----------+------------+-----------+
    7 rows in set (0.00 sec)

    mysql> delete from shirts where article='tank top';
    Query OK, 2 rows affected (0.01 sec)

    mysql> select * from shirts;
    +----------+------------+-----------+------------+-----------+
    | shirt_id | article    | color     | shirt_size | last_worn |
    +----------+------------+-----------+------------+-----------+
    |        1 | t-shirt    | off white | xs         |        10 |
    |        3 | polo shirt | black     | l          |        10 |
    |        5 | t-shirt    | pink      | s          |         0 |
    |        6 | polo shirt | red       | l          |         5 |
    |        9 | polo shirt | purple    | l          |        50 |
    +----------+------------+-----------+------------+-----------+
    5 rows in set (0.00 sec)

    mysql> delete from shirts;
    Query OK, 5 rows affected (0.01 sec)

    mysql> select * from shirts;                                                                                                                
    Empty set (0.00 sec)

    mysql> drop table shirts;
    Query OK, 0 rows affected (0.01 sec)

**********************************************************

## STRING FUNCTIONS

- Running SQL files
- When creating the file, be sure to use .sql at the end
- To run: source file_name.sql

--------------------------------------------------------------

    mysql> use cat_app;
    Database changed
    mysql> source first_file.sql;
    Query OK, 0 rows affected (0.01 sec)

    mysql> desc cats;
    +--------+--------------+------+-----+---------+----------------+
    | Field  | Type         | Null | Key | Default | Extra          |
    +--------+--------------+------+-----+---------+----------------+
    | cat_id | int(11)      | NO   | PRI | NULL    | auto_increment |
    | name   | varchar(100) | YES  |     | NULL    |                |
    | age    | int(11)      | YES  |     | NULL    |                |
    +--------+--------------+------+-----+---------+----------------+
    3 rows in set (0.00 sec)

    mysql> source testing/insert.sql;
    Query OK, 1 row affected (0.01 sec)

    Query OK, 1 row affected (0.00 sec)

    mysql> select * from cats;
    +--------+---------+------+
    | cat_id | name    | age  |
    +--------+---------+------+
    |      1 | Charlie |   17 |
    |      2 | Connie  |   10 |
    +--------+---------+------+
    2 rows in set (0.00 sec)

*******************************************

### SET UP BOOKS APP

------------------------------------------------

    mysql> create database books_app;
    Query OK, 1 row affected (0.01 sec)

    mysql> use books_app;
    Database changed
    mysql> source books_app/book-data.sql;
    Query OK, 0 rows affected (0.01 sec)

    Query OK, 16 rows affected (0.01 sec)
    Records: 16  Duplicates: 0  Warnings: 0

    mysql> show tables;
    +---------------------+
    | Tables_in_books_app |
    +---------------------+
    | books               |
    +---------------------+
    1 row in set (0.00 sec)

    mysql> select * from books;
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    | book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    |       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
    |       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
    |       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
    |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
    |       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
    |       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
    |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
    |       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
    |       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
    |      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
    |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
    |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
    |      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
    |      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
    |      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
    |      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    16 rows in set (0.00 sec)

    mysql> desc books;
    +----------------+--------------+------+-----+---------+----------------+
    | Field          | Type         | Null | Key | Default | Extra          |
    +----------------+--------------+------+-----+---------+----------------+
    | book_id        | int(11)      | NO   | PRI | NULL    | auto_increment |
    | title          | varchar(100) | YES  |     | NULL    |                |
    | author_fname   | varchar(100) | YES  |     | NULL    |                |
    | author_lname   | varchar(100) | YES  |     | NULL    |                |
    | released_year  | int(11)      | YES  |     | NULL    |                |
    | stock_quantity | int(11)      | YES  |     | NULL    |                |
    | pages          | int(11)      | YES  |     | NULL    |                |
    +----------------+--------------+------+-----+---------+----------------+
    7 rows in set (0.00 sec)

**************************************************************************

### CONCAT

- CONCAT (x,y,z) combines to make one thing
- CONCAT(column, anotherColumn)
- CONCAT(author_fname, author_lname)
- CONCAT(column, 'text', anotherColumn, 'more text')
- CONCAT(author_fname, ' ', author_lname)

------------------------------------------------------------------

    mysql> select concat(author_fname, ' ', author_lname) from books;
    +-----------------------------------------+
    | concat(author_fname, ' ', author_lname) |
    +-----------------------------------------+
    | Jhumpa Lahiri                           |
    | Neil Gaiman                             |
    | Neil Gaiman                             |
    | Jhumpa Lahiri                           |
    | Dave Eggers                             |
    | Dave Eggers                             |
    | Michael Chabon                          |
    | Patti Smith                             |
    | Dave Eggers                             |
    | Neil Gaiman                             |
    | Raymond Carver                          |
    | Raymond Carver                          |
    | Don DeLillo                             |
    | John Steinbeck                          |
    | David Foster Wallace                    |
    | David Foster Wallace                    |
    +-----------------------------------------+
    16 rows in set (0.00 sec)

    mysql> select concat(author_fname, ' ', author_lname) as 'full name' from books;                                                            
    +----------------------+
    | full name            |
    +----------------------+
    | Jhumpa Lahiri        |
    | Neil Gaiman          |
    | Neil Gaiman          |
    | Jhumpa Lahiri        |
    | Dave Eggers          |
    | Dave Eggers          |
    | Michael Chabon       |
    | Patti Smith          |
    | Dave Eggers          |
    | Neil Gaiman          |
    | Raymond Carver       |
    | Raymond Carver       |
    | Don DeLillo          |
    | John Steinbeck       |
    | David Foster Wallace |
    | David Foster Wallace |
    +----------------------+
    16 rows in set (0.00 sec)

    mysql> select author_fname as first, author_lname as last, concat(author_fname, ' ', author_lname) as full from books;
    +---------+----------------+----------------------+
    | first   | last           | full                 |
    +---------+----------------+----------------------+
    | Jhumpa  | Lahiri         | Jhumpa Lahiri        |
    | Neil    | Gaiman         | Neil Gaiman          |
    | Neil    | Gaiman         | Neil Gaiman          |
    | Jhumpa  | Lahiri         | Jhumpa Lahiri        |
    | Dave    | Eggers         | Dave Eggers          |
    | Dave    | Eggers         | Dave Eggers          |
    | Michael | Chabon         | Michael Chabon       |
    | Patti   | Smith          | Patti Smith          |
    | Dave    | Eggers         | Dave Eggers          |
    | Neil    | Gaiman         | Neil Gaiman          |
    | Raymond | Carver         | Raymond Carver       |
    | Raymond | Carver         | Raymond Carver       |
    | Don     | DeLillo        | Don DeLillo          |
    | John    | Steinbeck      | John Steinbeck       |
    | David   | Foster Wallace | David Foster Wallace |
    | David   | Foster Wallace | David Foster Wallace |
    +---------+----------------+----------------------+
    16 rows in set (0.00 sec)

------------------------------------------------------------

### CONCAT_WS

------------------------------------------------------

    mysql> SELECT
        ->     CONCAT_WS(' - ', title, author_fname, author_lname)
        -> FROM books;
    +------------------------------------------------------------------------+
    | CONCAT_WS(' - ', title, author_fname, author_lname)                    |
    +------------------------------------------------------------------------+
    | The Namesake - Jhumpa - Lahiri                                         |
    | Norse Mythology - Neil - Gaiman                                        |
    | American Gods - Neil - Gaiman                                          |
    | Interpreter of Maladies - Jhumpa - Lahiri                              |
    | A Hologram for the King: A Novel - Dave - Eggers                       |
    | The Circle - Dave - Eggers                                             |
    | The Amazing Adventures of Kavalier & Clay - Michael - Chabon           |
    | Just Kids - Patti - Smith                                              |
    | A Heartbreaking Work of Staggering Genius - Dave - Eggers              |
    | Coraline - Neil - Gaiman                                               |
    | What We Talk About When We Talk About Love: Stories - Raymond - Carver |
    | Where I'm Calling From: Selected Stories - Raymond - Carver            |
    | White Noise - Don - DeLillo                                            |
    | Cannery Row - John - Steinbeck                                         |
    | Oblivion: Stories - David - Foster Wallace                             |
    | Consider the Lobster - David - Foster Wallace                          |
    +------------------------------------------------------------------------+
    16 rows in set (0.01 sec)

**************************************************************************

### SUBSTRING

-------------------------------------------------------------------------

    mysql> SELECT SUBSTRING('Hello World', 1, 4);
    +--------------------------------+
    | SUBSTRING('Hello World', 1, 4) |
    +--------------------------------+
    | Hell                           |
    +--------------------------------+
    1 row in set (0.00 sec)

    mysql> SELECT SUBSTRING('Hello World', 7);
    +-----------------------------+
    | SUBSTRING('Hello World', 7) |
    +-----------------------------+
    | World                       |
    +-----------------------------+
    1 row in set (0.00 sec)

    mysql> select substring('Hello World', -3);
    +------------------------------+
    | substring('Hello World', -3) |
    +------------------------------+
    | rld                          |
    +------------------------------+
    1 row in set (0.00 sec)

    mysql> select substring(title, 1, 10) from books;
    +-------------------------+
    | substring(title, 1, 10) |
    +-------------------------+
    | The Namesa              |
    | Norse Myth              |
    | American G              |
    | Interprete              |
    | A Hologram              |
    | The Circle              |
    | The Amazin              |
    | Just Kids               |
    | A Heartbre              |
    | Coraline                |
    | What We Ta              |
    | Where I'm               |
    | White Nois              |
    | Cannery Ro              |
    | Oblivion:               |
    | Consider t              |
    +-------------------------+
    16 rows in set (0.00 sec)

    mysql> source books_app/book_code.sql;
    +---------------+
    | short title   |
    +---------------+
    | The Namesa... |
    | Norse Myth... |
    | American G... |
    | Interprete... |
    | A Hologram... |
    | The Circle... |
    | The Amazin... |
    | Just Kids...  |
    | A Heartbre... |
    | Coraline...   |
    | What We Ta... |
    | Where I'm ... |
    | White Nois... |
    | Cannery Ro... |
    | Oblivion: ... |
    | Consider t... |
    +---------------+
    16 rows in set (0.00 sec)

******************************************************

### REPLACE

-------------------------------------------------------------------------

    mysql> select replace('Hello World', 'Hell', '%$#@');
    +----------------------------------------+
    | replace('Hello World', 'Hell', '%$#@') |
    +----------------------------------------+
    | %$#@o World                            |
    +----------------------------------------+
    1 row in set (0.00 sec)

    mysql> select replace('Hello World', 'l', '7');
    +----------------------------------+
    | replace('Hello World', 'l', '7') |
    +----------------------------------+
    | He77o Wor7d                      |
    +----------------------------------+
    1 row in set (0.00 sec)

    mysql> select replace('Hello World', 'o', '0');                                                                                            
    +----------------------------------+
    | replace('Hello World', 'o', '0') |
    +----------------------------------+
    | Hell0 W0rld                      |
    +----------------------------------+
    1 row in set (0.00 sec)

    mysql> select replace('Hell0 World', 'o', '*');                                                                                            
    +----------------------------------+
    | replace('Hell0 World', 'o', '*') |
    +----------------------------------+
    | Hell0 W*rld                      |
    +----------------------------------+
    1 row in set (0.00 sec)

***REPLACE is case sensitive***

    mysql> select replace('chesse bread coffee milk', ' ', ' and ');                                                                            
    +---------------------------------------------------+
    | replace('chesse bread coffee milk', ' ', ' and ') |
    +---------------------------------------------------+
    | chesse and bread and coffee and milk              |
    +---------------------------------------------------+
    1 row in set (0.00 sec)

    mysql> select replace(title, 'e', '3') from books;
    +-----------------------------------------------------+
    | replace(title, 'e', '3')                            |
    +-----------------------------------------------------+
    | Th3 Nam3sak3                                        |
    | Nors3 Mythology                                     |
    | Am3rican Gods                                       |
    | Int3rpr3t3r of Maladi3s                             |
    | A Hologram for th3 King: A Nov3l                    |
    | Th3 Circl3                                          |
    | Th3 Amazing Adv3ntur3s of Kavali3r & Clay           |
    | Just Kids                                           |
    | A H3artbr3aking Work of Stagg3ring G3nius           |
    | Coralin3                                            |
    | What W3 Talk About Wh3n W3 Talk About Lov3: Stori3s |
    | Wh3r3 I'm Calling From: S3l3ct3d Stori3s            |
    | Whit3 Nois3                                         |
    | Cann3ry Row                                         |
    | Oblivion: Stori3s                                   |
    | Consid3r th3 Lobst3r                                |
    +-----------------------------------------------------+
    16 rows in set (0.00 sec)

    mysql> source books_app/book_code.sql;
    +--------------+
    | weird string |
    +--------------+
    | Th3 Nam3sa   |
    | Nors3 Myth   |
    | Am3rican G   |
    | Int3rpr3t3   |
    | A Hologram   |
    | Th3 Circl3   |
    | Th3 Amazin   |
    | Just Kids    |
    | A H3artbr3   |
    | Coralin3     |
    | What W3 Ta   |
    | Wh3r3 I'm    |
    | Whit3 Nois   |
    | Cann3ry Ro   |
    | Oblivion:    |
    | Consid3r t   |
    +--------------+
    16 rows in set (0.00 sec)

********************************************************

### REVERSE

-------------------------------------------------------------------------

    mysql> select reverse('Hello World');
    +------------------------+
    | reverse('Hello World') |
    +------------------------+
    | dlroW olleH            |
    +------------------------+
    1 row in set (0.00 sec)

******************************************************

### CHAR_LENGTH

-------------------------------------------------------------------------

    mysql> select char_length('Hello World');
    +----------------------------+
    | char_length('Hello World') |
    +----------------------------+
    |                         11 |
    +----------------------------+
    1 row in set (0.00 sec)

    mysql> select author_lname, char_length(author_lname) as 'length' from books;                                                               
    +----------------+--------+
    | author_lname   | length |
    +----------------+--------+
    | Lahiri         |      6 |
    | Gaiman         |      6 |
    | Gaiman         |      6 |
    | Lahiri         |      6 |
    | Eggers         |      6 |
    | Eggers         |      6 |
    | Chabon         |      6 |
    | Smith          |      5 |
    | Eggers         |      6 |
    | Gaiman         |      6 |
    | Carver         |      6 |
    | Carver         |      6 |
    | DeLillo        |      7 |
    | Steinbeck      |      9 |
    | Foster Wallace |     14 |
    | Foster Wallace |     14 |
    +----------------+--------+
    16 rows in set (0.00 sec)

**********************************************

### UPPER() & LOWER()

-------------------------------------------------------------------------

    mysql> select upper(title) from books;
    +-----------------------------------------------------+
    | upper(title)                                        |
    +-----------------------------------------------------+
    | THE NAMESAKE                                        |
    | NORSE MYTHOLOGY                                     |
    | AMERICAN GODS                                       |
    | INTERPRETER OF MALADIES                             |
    | A HOLOGRAM FOR THE KING: A NOVEL                    |
    | THE CIRCLE                                          |
    | THE AMAZING ADVENTURES OF KAVALIER & CLAY           |
    | JUST KIDS                                           |
    | A HEARTBREAKING WORK OF STAGGERING GENIUS           |
    | CORALINE                                            |
    | WHAT WE TALK ABOUT WHEN WE TALK ABOUT LOVE: STORIES |
    | WHERE I'M CALLING FROM: SELECTED STORIES            |
    | WHITE NOISE                                         |
    | CANNERY ROW                                         |
    | OBLIVION: STORIES                                   |
    | CONSIDER THE LOBSTER                                |
    +-----------------------------------------------------+
    16 rows in set (0.00 sec)

    mysql> select lower(author_fname) from books;
    +---------------------+
    | lower(author_fname) |
    +---------------------+
    | jhumpa              |
    | neil                |
    | neil                |
    | jhumpa              |
    | dave                |
    | dave                |
    | michael             |
    | patti               |
    | dave                |
    | neil                |
    | raymond             |
    | raymond             |
    | don                 |
    | john                |
    | david               |
    | david               |
    +---------------------+
    16 rows in set (0.00 sec)

    mysql> select upper(concat(author_fname, ' ', author_lname)) as 'full name in caps' from books;
    +----------------------+
    | full name in caps    |
    +----------------------+
    | JHUMPA LAHIRI        |
    | NEIL GAIMAN          |
    | NEIL GAIMAN          |
    | JHUMPA LAHIRI        |
    | DAVE EGGERS          |
    | DAVE EGGERS          |
    | MICHAEL CHABON       |
    | PATTI SMITH          |
    | DAVE EGGERS          |
    | NEIL GAIMAN          |
    | RAYMOND CARVER       |
    | RAYMOND CARVER       |
    | DON DELILLO          |
    | JOHN STEINBECK       |
    | DAVID FOSTER WALLACE |
    | DAVID FOSTER WALLACE |
    +----------------------+
    16 rows in set (0.00 sec)

**********************************************************
#### EXERCISE
**********************************************************

    mysql> select reverse(upper('Why does my cat look at me with such hatred?'));
    +----------------------------------------------------------------+
    | reverse(upper('Why does my cat look at me with such hatred?')) |
    +----------------------------------------------------------------+
    | ?DERTAH HCUS HTIW EM TA KOOL TAC YM SEOD YHW                   |
    +----------------------------------------------------------------+
    1 row in set (0.00 sec)

    mysql> select replace(concat('I', ' ', 'like', ' ', 'cats'), ' ', '_');
    +----------------------------------------------------------+
    | replace(concat('I', ' ', 'like', ' ', 'cats'), ' ', '_') |
    +----------------------------------------------------------+
    | I_like_cats                                              |
    +----------------------------------------------------------+
    1 row in set (0.00 sec)

    mysql> select replace(title, ' ', '->') as 'title' from books;
    +--------------------------------------------------------------+
    | title                                                        |
    +--------------------------------------------------------------+
    | The->Namesake                                                |
    | Norse->Mythology                                             |
    | American->Gods                                               |
    | Interpreter->of->Maladies                                    |
    | A->Hologram->for->the->King:->A->Novel                       |
    | The->Circle                                                  |
    | The->Amazing->Adventures->of->Kavalier->&->Clay              |
    | Just->Kids                                                   |
    | A->Heartbreaking->Work->of->Staggering->Genius               |
    | Coraline                                                     |
    | What->We->Talk->About->When->We->Talk->About->Love:->Stories |
    | Where->I'm->Calling->From:->Selected->Stories                |
    | White->Noise                                                 |
    | Cannery->Row                                                 |
    | Oblivion:->Stories                                           |
    | Consider->the->Lobster                                       |
    +--------------------------------------------------------------+
    16 rows in set (0.00 sec)

    mysql> select author_lname as 'forwards', reverse(author_lname) as 'backwards' from books;
    +----------------+----------------+
    | forwards       | backwards      |
    +----------------+----------------+
    | Lahiri         | irihaL         |
    | Gaiman         | namiaG         |
    | Gaiman         | namiaG         |
    | Lahiri         | irihaL         |
    | Eggers         | sreggE         |
    | Eggers         | sreggE         |
    | Chabon         | nobahC         |
    | Smith          | htimS          |
    | Eggers         | sreggE         |
    | Gaiman         | namiaG         |
    | Carver         | revraC         |
    | Carver         | revraC         |
    | DeLillo        | olliLeD        |
    | Steinbeck      | kcebnietS      |
    | Foster Wallace | ecallaW retsoF |
    | Foster Wallace | ecallaW retsoF |
    +----------------+----------------+
    16 rows in set (0.00 sec)

    mysql> select upper(concat(author_fname, ' ', author_lname)) as 'full name in caps' from books;
    +----------------------+
    | full name in caps    |
    +----------------------+
    | JHUMPA LAHIRI        |
    | NEIL GAIMAN          |
    | NEIL GAIMAN          |
    | JHUMPA LAHIRI        |
    | DAVE EGGERS          |
    | DAVE EGGERS          |
    | MICHAEL CHABON       |
    | PATTI SMITH          |
    | DAVE EGGERS          |
    | NEIL GAIMAN          |
    | RAYMOND CARVER       |
    | RAYMOND CARVER       |
    | DON DELILLO          |
    | JOHN STEINBECK       |
    | DAVID FOSTER WALLACE |
    | DAVID FOSTER WALLACE |
    +----------------------+
    16 rows in set (0.00 sec)

    mysql> select * from books;
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    | book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    |       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
    |       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
    |       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
    |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
    |       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
    |       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
    |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
    |       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
    |       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
    |      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
    |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
    |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
    |      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
    |      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
    |      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
    |      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    16 rows in set (0.00 sec)

    mysql> select concat(title, ' was released in ', released_year) as 'blurb' from books;
    +--------------------------------------------------------------------------+
    | blurb                                                                    |
    +--------------------------------------------------------------------------+
    | The Namesake was released in 2003                                        |
    | Norse Mythology was released in 2016                                     |
    | American Gods was released in 2001                                       |
    | Interpreter of Maladies was released in 1996                             |
    | A Hologram for the King: A Novel was released in 2012                    |
    | The Circle was released in 2013                                          |
    | The Amazing Adventures of Kavalier & Clay was released in 2000           |
    | Just Kids was released in 2010                                           |
    | A Heartbreaking Work of Staggering Genius was released in 2001           |
    | Coraline was released in 2003                                            |
    | What We Talk About When We Talk About Love: Stories was released in 1981 |
    | Where I'm Calling From: Selected Stories was released in 1989            |
    | White Noise was released in 1985                                         |
    | Cannery Row was released in 1945                                         |
    | Oblivion: Stories was released in 2004                                   |
    | Consider the Lobster was released in 2005                                |
    +--------------------------------------------------------------------------+
    16 rows in set (0.00 sec)

    mysql> select title as 'title', char_length(title) as 'character count' from books;
    +-----------------------------------------------------+-----------------+
    | title                                               | character count |
    +-----------------------------------------------------+-----------------+
    | The Namesake                                        |              12 |
    | Norse Mythology                                     |              15 |
    | American Gods                                       |              13 |
    | Interpreter of Maladies                             |              23 |
    | A Hologram for the King: A Novel                    |              32 |
    | The Circle                                          |              10 |
    | The Amazing Adventures of Kavalier & Clay           |              41 |
    | Just Kids                                           |               9 |
    | A Heartbreaking Work of Staggering Genius           |              41 |
    | Coraline                                            |               8 |
    | What We Talk About When We Talk About Love: Stories |              51 |
    | Where I'm Calling From: Selected Stories            |              40 |
    | White Noise                                         |              11 |
    | Cannery Row                                         |              11 |
    | Oblivion: Stories                                   |              17 |
    | Consider the Lobster                                |              20 |
    +-----------------------------------------------------+-----------------+
    16 rows in set (0.01 sec)

    mysql> select concat(substring(title, 1, 10), '...') as 'short title', concat(author_lname, ',', author_fname) as author, concat(stock_quantity, ' in stock') as 'quantity' from books; 
    +---------------+----------------------+--------------+
    | short title   | author               | quantity     |
    +---------------+----------------------+--------------+
    | The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
    | Norse Myth... | Gaiman,Neil          | 43 in stock  |
    | American G... | Gaiman,Neil          | 12 in stock  |
    | Interprete... | Lahiri,Jhumpa        | 97 in stock  |
    | A Hologram... | Eggers,Dave          | 154 in stock |
    | The Circle... | Eggers,Dave          | 26 in stock  |
    | The Amazin... | Chabon,Michael       | 68 in stock  |
    | Just Kids...  | Smith,Patti          | 55 in stock  |
    | A Heartbre... | Eggers,Dave          | 104 in stock |
    | Coraline...   | Gaiman,Neil          | 100 in stock |
    | What We Ta... | Carver,Raymond       | 23 in stock  |
    | Where I'm ... | Carver,Raymond       | 12 in stock  |
    | White Nois... | DeLillo,Don          | 49 in stock  |
    | Cannery Ro... | Steinbeck,John       | 95 in stock  |
    | Oblivion: ... | Foster Wallace,David | 172 in stock |
    | Consider t... | Foster Wallace,David | 92 in stock  |
    +---------------+----------------------+--------------+
    16 rows in set (0.00 sec)

*****************************************************************

## REFINING SELECTIONS

---------------------------------------------------------------

    mysql> source books_app/insert_books.sql
    ERROR 2006 (HY000): MySQL server has gone away
    No connection. Trying to reconnect...
    Connection id:    58
    Current database: books_app

    Query OK, 3 rows affected (0.02 sec)
    Records: 3  Duplicates: 0  Warnings: 0

*******************************************************************

### DISTINCT

------------------------------------------------------------

    mysql> select distinct author_lname from books;
    +----------------+
    | author_lname   |
    +----------------+
    | Lahiri         |
    | Gaiman         |
    | Eggers         |
    | Chabon         |
    | Smith          |
    | Carver         |
    | DeLillo        |
    | Steinbeck      |
    | Foster Wallace |
    | Harris         |
    | Saunders       |
    +----------------+
    11 rows in set (0.00 sec)

    mysql> select distinct author_fname, author_lname from books;
    +--------------+----------------+
    | author_fname | author_lname   |
    +--------------+----------------+
    | Jhumpa       | Lahiri         |
    | Neil         | Gaiman         |
    | Dave         | Eggers         |
    | Michael      | Chabon         |
    | Patti        | Smith          |
    | Raymond      | Carver         |
    | Don          | DeLillo        |
    | John         | Steinbeck      |
    | David        | Foster Wallace |
    | Dan          | Harris         |
    | Freida       | Harris         |
    | George       | Saunders       |
    +--------------+----------------+
    12 rows in set (0.00 sec)

    mysql> select distinct released_year from books;
    +---------------+
    | released_year |
    +---------------+
    |          2003 |
    |          2016 |
    |          2001 |
    |          1996 |
    |          2012 |
    |          2013 |
    |          2000 |
    |          2010 |
    |          1981 |
    |          1989 |
    |          1985 |
    |          1945 |
    |          2004 |
    |          2005 |
    |          2014 |
    |          2017 |
    +---------------+
    16 rows in set (0.00 sec)

    mysql> select distinct concat(author_fname, ' ', author_lname) as 'full name' from books;
    +----------------------+
    | full name            |
    +----------------------+
    | Jhumpa Lahiri        |
    | Neil Gaiman          |
    | Dave Eggers          |
    | Michael Chabon       |
    | Patti Smith          |
    | Raymond Carver       |
    | Don DeLillo          |
    | John Steinbeck       |
    | David Foster Wallace |
    | Dan Harris           |
    | Freida Harris        |
    | George Saunders      |
    +----------------------+
    12 rows in set (0.00 sec)

***************************************

### ORDER BY

- [ORDER BY Optimimzation](https://dev.mysql.com/doc/refman/8.0/en/order-by-optimization.html)
- How to sort results

---------------------------------------

    mysql> select author_lname from books order by author_lname;
    +----------------+
    | author_lname   |
    +----------------+
    | Carver         |
    | Carver         |
    | Chabon         |
    | DeLillo        |
    | Eggers         |
    | Eggers         |
    | Eggers         |
    | Foster Wallace |
    | Foster Wallace |
    | Gaiman         |
    | Gaiman         |
    | Gaiman         |
    | Harris         |
    | Harris         |
    | Lahiri         |
    | Lahiri         |
    | Saunders       |
    | Smith          |
    | Steinbeck      |
    +----------------+
    19 rows in set (0.00 sec)

    mysql> select distinct author_lname from books order by author_lname;                                                                       
    +----------------+
    | author_lname   |
    +----------------+
    | Carver         |
    | Chabon         |
    | DeLillo        |
    | Eggers         |
    | Foster Wallace |
    | Gaiman         |
    | Harris         |
    | Lahiri         |
    | Saunders       |
    | Smith          |
    | Steinbeck      |
    +----------------+
    11 rows in set (0.01 sec)

    mysql> select distinct concat(author_fname, ' ', author_lname) from books order by author_lname;                                            
    +-----------------------------------------+
    | concat(author_fname, ' ', author_lname) |
    +-----------------------------------------+
    | Raymond Carver                          |
    | Michael Chabon                          |
    | Don DeLillo                             |
    | Dave Eggers                             |
    | David Foster Wallace                    |
    | Neil Gaiman                             |
    | Dan Harris                              |
    | Freida Harris                           |
    | Jhumpa Lahiri                           |
    | George Saunders                         |
    | Patti Smith                             |
    | John Steinbeck                          |
    +-----------------------------------------+
    12 rows in set (0.01 sec)

    mysql> select title from books;
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
    | Lincoln In The Bardo                                |
    +-----------------------------------------------------+
    19 rows in set (0.00 sec)

    mysql> select title from books order by title;
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
    | 10% Happier                                         |
    | A Heartbreaking Work of Staggering Genius           |
    | A Hologram for the King: A Novel                    |
    | American Gods                                       |
    | Cannery Row                                         |
    | Consider the Lobster                                |
    | Coraline                                            |
    | fake_book                                           |
    | Interpreter of Maladies                             |
    | Just Kids                                           |
    | Lincoln In The Bardo                                |
    | Norse Mythology                                     |
    | Oblivion: Stories                                   |
    | The Amazing Adventures of Kavalier & Clay           |
    | The Circle                                          |
    | The Namesake                                        |
    | What We Talk About When We Talk About Love: Stories |
    | Where I'm Calling From: Selected Stories            |
    | White Noise                                         |
    +-----------------------------------------------------+
    19 rows in set (0.00 sec)

    mysql> select title from books order by title desc;
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
    | White Noise                                         |
    | Where I'm Calling From: Selected Stories            |
    | What We Talk About When We Talk About Love: Stories |
    | The Namesake                                        |
    | The Circle                                          |
    | The Amazing Adventures of Kavalier & Clay           |
    | Oblivion: Stories                                   |
    | Norse Mythology                                     |
    | Lincoln In The Bardo                                |
    | Just Kids                                           |
    | Interpreter of Maladies                             |
    | fake_book                                           |
    | Coraline                                            |
    | Consider the Lobster                                |
    | Cannery Row                                         |
    | American Gods                                       |
    | A Hologram for the King: A Novel                    |
    | A Heartbreaking Work of Staggering Genius           |
    | 10% Happier                                         |
    +-----------------------------------------------------+
    19 rows in set (0.00 sec)

    mysql> select distinct concat(author_fname, ' ', author_lname) from books order by author_lname desc;                                       
    +-----------------------------------------+
    | concat(author_fname, ' ', author_lname) |
    +-----------------------------------------+
    | John Steinbeck                          |
    | Patti Smith                             |
    | George Saunders                         |
    | Jhumpa Lahiri                           |
    | Dan Harris                              |
    | Freida Harris                           |
    | Neil Gaiman                             |
    | David Foster Wallace                    |
    | Dave Eggers                             |
    | Don DeLillo                             |
    | Michael Chabon                          |
    | Raymond Carver                          |
    +-----------------------------------------+
    12 rows in set (0.00 sec)

    mysql> select released_year from books;
    +---------------+
    | released_year |
    +---------------+
    |          2003 |
    |          2016 |
    |          2001 |
    |          1996 |
    |          2012 |
    |          2013 |
    |          2000 |
    |          2010 |
    |          2001 |
    |          2003 |
    |          1981 |
    |          1989 |
    |          1985 |
    |          1945 |
    |          2004 |
    |          2005 |
    |          2014 |
    |          2001 |
    |          2017 |
    +---------------+
    19 rows in set (0.00 sec)

    mysql> select released_year from books order by released_year;
    +---------------+
    | released_year |
    +---------------+
    |          1945 |
    |          1981 |
    |          1985 |
    |          1989 |
    |          1996 |
    |          2000 |
    |          2001 |
    |          2001 |
    |          2001 |
    |          2003 |
    |          2003 |
    |          2004 |
    |          2005 |
    |          2010 |
    |          2012 |
    |          2013 |
    |          2014 |
    |          2016 |
    |          2017 |
    +---------------+
    19 rows in set (0.00 sec)

    mysql> select released_year from books order by released_year desc;
    +---------------+
    | released_year |
    +---------------+
    |          2017 |
    |          2016 |
    |          2014 |
    |          2013 |
    |          2012 |
    |          2010 |
    |          2005 |
    |          2004 |
    |          2003 |
    |          2003 |
    |          2001 |
    |          2001 |
    |          2001 |
    |          2000 |
    |          1996 |
    |          1989 |
    |          1985 |
    |          1981 |
    |          1945 |
    +---------------+
    19 rows in set (0.00 sec)

    mysql> select released_year from books order by released_year asc;
    +---------------+
    | released_year |
    +---------------+
    |          1945 |
    |          1981 |
    |          1985 |
    |          1989 |
    |          1996 |
    |          2000 |
    |          2001 |
    |          2001 |
    |          2001 |
    |          2003 |
    |          2003 |
    |          2004 |
    |          2005 |
    |          2010 |
    |          2012 |
    |          2013 |
    |          2014 |
    |          2016 |
    |          2017 |
    +---------------+
    19 rows in set (0.00 sec)

    mysql> select title, released_year, pages from books order by released_year;
    +-----------------------------------------------------+---------------+-------+
    | title                                               | released_year | pages |
    +-----------------------------------------------------+---------------+-------+
    | Cannery Row                                         |          1945 |   181 |
    | What We Talk About When We Talk About Love: Stories |          1981 |   176 |
    | White Noise                                         |          1985 |   320 |
    | Where I'm Calling From: Selected Stories            |          1989 |   526 |
    | Interpreter of Maladies                             |          1996 |   198 |
    | The Amazing Adventures of Kavalier & Clay           |          2000 |   634 |
    | American Gods                                       |          2001 |   465 |
    | fake_book                                           |          2001 |   428 |
    | A Heartbreaking Work of Staggering Genius           |          2001 |   437 |
    | The Namesake                                        |          2003 |   291 |
    | Coraline                                            |          2003 |   208 |
    | Oblivion: Stories                                   |          2004 |   329 |
    | Consider the Lobster                                |          2005 |   343 |
    | Just Kids                                           |          2010 |   304 |
    | A Hologram for the King: A Novel                    |          2012 |   352 |
    | The Circle                                          |          2013 |   504 |
    | 10% Happier                                         |          2014 |   256 |
    | Norse Mythology                                     |          2016 |   304 |
    | Lincoln In The Bardo                                |          2017 |   367 |
    +-----------------------------------------------------+---------------+-------+
    19 rows in set (0.00 sec)

    mysql> select title, author_fname, author_lname from books order by 2;
    +-----------------------------------------------------+--------------+----------------+
    | title                                               | author_fname | author_lname   |
    +-----------------------------------------------------+--------------+----------------+
    | 10% Happier                                         | Dan          | Harris         |
    | A Hologram for the King: A Novel                    | Dave         | Eggers         |
    | The Circle                                          | Dave         | Eggers         |
    | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |
    | Consider the Lobster                                | David        | Foster Wallace |
    | Oblivion: Stories                                   | David        | Foster Wallace |
    | White Noise                                         | Don          | DeLillo        |
    | fake_book                                           | Freida       | Harris         |
    | Lincoln In The Bardo                                | George       | Saunders       |
    | The Namesake                                        | Jhumpa       | Lahiri         |
    | Interpreter of Maladies                             | Jhumpa       | Lahiri         |
    | Cannery Row                                         | John         | Steinbeck      |
    | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
    | American Gods                                       | Neil         | Gaiman         |
    | Norse Mythology                                     | Neil         | Gaiman         |
    | Coraline                                            | Neil         | Gaiman         |
    | Just Kids                                           | Patti        | Smith          |
    | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
    | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |
    +-----------------------------------------------------+--------------+----------------+
    19 rows in set (0.01 sec)

    mysql> select title, author_fname, author_lname from books order by 3;
    +-----------------------------------------------------+--------------+----------------+
    | title                                               | author_fname | author_lname   |
    +-----------------------------------------------------+--------------+----------------+
    | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |
    | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
    | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
    | White Noise                                         | Don          | DeLillo        |
    | A Hologram for the King: A Novel                    | Dave         | Eggers         |
    | The Circle                                          | Dave         | Eggers         |
    | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |
    | Oblivion: Stories                                   | David        | Foster Wallace |
    | Consider the Lobster                                | David        | Foster Wallace |
    | Coraline                                            | Neil         | Gaiman         |
    | American Gods                                       | Neil         | Gaiman         |
    | Norse Mythology                                     | Neil         | Gaiman         |
    | fake_book                                           | Freida       | Harris         |
    | 10% Happier                                         | Dan          | Harris         |
    | The Namesake                                        | Jhumpa       | Lahiri         |
    | Interpreter of Maladies                             | Jhumpa       | Lahiri         |
    | Lincoln In The Bardo                                | George       | Saunders       |
    | Just Kids                                           | Patti        | Smith          |
    | Cannery Row                                         | John         | Steinbeck      |
    +-----------------------------------------------------+--------------+----------------+
    19 rows in set (0.00 sec)

    mysql> select title, author_fname, author_lname from books order by 1 desc;
    +-----------------------------------------------------+--------------+----------------+
    | title                                               | author_fname | author_lname   |
    +-----------------------------------------------------+--------------+----------------+
    | White Noise                                         | Don          | DeLillo        |
    | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |
    | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
    | The Namesake                                        | Jhumpa       | Lahiri         |
    | The Circle                                          | Dave         | Eggers         |
    | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
    | Oblivion: Stories                                   | David        | Foster Wallace |
    | Norse Mythology                                     | Neil         | Gaiman         |
    | Lincoln In The Bardo                                | George       | Saunders       |
    | Just Kids                                           | Patti        | Smith          |
    | Interpreter of Maladies                             | Jhumpa       | Lahiri         |
    | fake_book                                           | Freida       | Harris         |
    | Coraline                                            | Neil         | Gaiman         |
    | Consider the Lobster                                | David        | Foster Wallace |
    | Cannery Row                                         | John         | Steinbeck      |
    | American Gods                                       | Neil         | Gaiman         |
    | A Hologram for the King: A Novel                    | Dave         | Eggers         |
    | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |
    | 10% Happier                                         | Dan          | Harris         |
    +-----------------------------------------------------+--------------+----------------+
    19 rows in set (0.00 sec)

    mysql> select author_fname, author_lname from books order by author_lname;
    +--------------+----------------+
    | author_fname | author_lname   |
    +--------------+----------------+
    | Raymond      | Carver         |
    | Raymond      | Carver         |
    | Michael      | Chabon         |
    | Don          | DeLillo        |
    | Dave         | Eggers         |
    | Dave         | Eggers         |
    | Dave         | Eggers         |
    | David        | Foster Wallace |
    | David        | Foster Wallace |
    | Neil         | Gaiman         |
    | Neil         | Gaiman         |
    | Neil         | Gaiman         |
    | Freida       | Harris         |
    | Dan          | Harris         |
    | Jhumpa       | Lahiri         |
    | Jhumpa       | Lahiri         |
    | George       | Saunders       |
    | Patti        | Smith          |
    | John         | Steinbeck      |
    +--------------+----------------+
    19 rows in set (0.00 sec)

    mysql> select author_fname, author_lname from books order by author_lname, author_fname;
    +--------------+----------------+
    | author_fname | author_lname   |
    +--------------+----------------+
    | Raymond      | Carver         |
    | Raymond      | Carver         |
    | Michael      | Chabon         |
    | Don          | DeLillo        |
    | Dave         | Eggers         |
    | Dave         | Eggers         |
    | Dave         | Eggers         |
    | David        | Foster Wallace |
    | David        | Foster Wallace |
    | Neil         | Gaiman         |
    | Neil         | Gaiman         |
    | Neil         | Gaiman         |
    | Dan          | Harris         |
    | Freida       | Harris         |
    | Jhumpa       | Lahiri         |
    | Jhumpa       | Lahiri         |
    | George       | Saunders       |
    | Patti        | Smith          |
    | John         | Steinbeck      |
    +--------------+----------------+
    19 rows in set (0.00 sec)

**********************************************************

### [LIMIT](https://dev.mysql.com/doc/refman/8.0/en/limit-optimization.html)


- Specific number for selections

---------------------------------------

    mysql> select title from books;
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
    | Lincoln In The Bardo                                |
    +-----------------------------------------------------+
    19 rows in set (0.00 sec)

    mysql> select title from books limit 3;
    +-----------------+
    | title           |
    +-----------------+
    | The Namesake    |
    | Norse Mythology |
    | American Gods   |
    +-----------------+
    3 rows in set (0.00 sec)

***Not as useful on it's own***

    mysql> select title, released_year from books order by 2;
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

    mysql> select title, released_year from books order by 2 desc;
    +-----------------------------------------------------+---------------+
    | title                                               | released_year |
    +-----------------------------------------------------+---------------+
    | Lincoln In The Bardo                                |          2017 |
    | Norse Mythology                                     |          2016 |
    | 10% Happier                                         |          2014 |
    | The Circle                                          |          2013 |
    | A Hologram for the King: A Novel                    |          2012 |
    | Just Kids                                           |          2010 |
    | Consider the Lobster                                |          2005 |
    | Oblivion: Stories                                   |          2004 |
    | Coraline                                            |          2003 |
    | The Namesake                                        |          2003 |
    | fake_book                                           |          2001 |
    | American Gods                                       |          2001 |
    | A Heartbreaking Work of Staggering Genius           |          2001 |
    | The Amazing Adventures of Kavalier & Clay           |          2000 |
    | Interpreter of Maladies                             |          1996 |
    | Where I'm Calling From: Selected Stories            |          1989 |
    | White Noise                                         |          1985 |
    | What We Talk About When We Talk About Love: Stories |          1981 |
    | Cannery Row                                         |          1945 |
    +-----------------------------------------------------+---------------+
    19 rows in set (0.00 sec)

    mysql> select title, released_year from books order by 2 desc limit 5;
    +----------------------------------+---------------+
    | title                            | released_year |
    +----------------------------------+---------------+
    | Lincoln In The Bardo             |          2017 |
    | Norse Mythology                  |          2016 |
    | 10% Happier                      |          2014 |
    | The Circle                       |          2013 |
    | A Hologram for the King: A Novel |          2012 |
    +----------------------------------+---------------+
    5 rows in set (0.01 sec)

    mysql> select title, released_year from books order by 2 desc limit 0, 5; *****"limit <0>, 5" Allows you to indicate where the limit is starting
    +----------------------------------+---------------+
    | title                            | released_year |
    +----------------------------------+---------------+
    | Lincoln In The Bardo             |          2017 |
    | Norse Mythology                  |          2016 |
    | 10% Happier                      |          2014 |
    | The Circle                       |          2013 |
    | A Hologram for the King: A Novel |          2012 |
    +----------------------------------+---------------+
    5 rows in set (0.00 sec)

***Example of use: used in pagination of content on the front-end***
***If wanting to retreive all rows from a certain offset to the end use a random large number greater than the amount of items in the table***


    "select * from <tbl> limit 95, 18446744073709551615;""

---------------------------------------------------------------------

    mysql> select title from books limit 5;
    +----------------------------------+
    | title                            |
    +----------------------------------+
    | The Namesake                     |
    | Norse Mythology                  |
    | American Gods                    |
    | Interpreter of Maladies          |
    | A Hologram for the King: A Novel |
    +----------------------------------+
    5 rows in set (0.00 sec)

    mysql> select title from books limit 5, 1473874;
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
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
    | Lincoln In The Bardo                                |
    +-----------------------------------------------------+
    14 rows in set (0.00 sec)

    mysql> select title from books limit 5, 50;
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
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
    | Lincoln In The Bardo                                |
    +-----------------------------------------------------+
    14 rows in set (0.00 sec)

******************************************************************

### [LIKE](https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html)

- Allows for better searching of data

---------------------------------------------

    mysql> select author_fname from books where author_fname like '%da%';
    +--------------+
    | author_fname |
    +--------------+
    | Dave         |
    | Dave         |
    | Dave         |
    | David        |
    | David        |
    | Dan          |
    | Freida       |
    +--------------+
    7 rows in set (0.00 sec)

    mysql> select * from books where author_fname like '%da%';                                                                                  
    +---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
    | book_id | title                                     | author_fname | author_lname   | released_year | stock_quantity | pages |
    +---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
    |       5 | A Hologram for the King: A Novel          | Dave         | Eggers         |          2012 |            154 |   352 |
    |       6 | The Circle                                | Dave         | Eggers         |          2013 |             26 |   504 |
    |       9 | A Heartbreaking Work of Staggering Genius | Dave         | Eggers         |          2001 |            104 |   437 |
    |      15 | Oblivion: Stories                         | David        | Foster Wallace |          2004 |            172 |   329 |
    |      16 | Consider the Lobster                      | David        | Foster Wallace |          2005 |             92 |   343 |
    |      17 | 10% Happier                               | Dan          | Harris         |          2014 |             29 |   256 |
    |      18 | fake_book                                 | Freida       | Harris         |          2001 |            287 |   428 |
    +---------+-------------------------------------------+--------------+----------------+---------------+----------------+-------+
    7 rows in set (0.00 sec)

    mysql> select title from books where title like '%the%';
    +-------------------------------------------+
    | title                                     |
    +-------------------------------------------+
    | The Namesake                              |
    | A Hologram for the King: A Novel          |
    | The Circle                                |
    | The Amazing Adventures of Kavalier & Clay |
    | Consider the Lobster                      |
    | Lincoln In The Bardo                      |
    +-------------------------------------------+
    6 rows in set (0.00 sec)

******************************************************************

### LIKE PART 2

- The '_' wildcard

-------------------------------------------

    mysql> select title, stock_quantity from books; 
    +-----------------------------------------------------+----------------+
    | title                                               | stock_quantity |
    +-----------------------------------------------------+----------------+
    | The Namesake                                        |             32 |
    | Norse Mythology                                     |             43 |
    | American Gods                                       |             12 |
    | Interpreter of Maladies                             |             97 |
    | A Hologram for the King: A Novel                    |            154 |
    | The Circle                                          |             26 |
    | The Amazing Adventures of Kavalier & Clay           |             68 |
    | Just Kids                                           |             55 |
    | A Heartbreaking Work of Staggering Genius           |            104 |
    | Coraline                                            |            100 |
    | What We Talk About When We Talk About Love: Stories |             23 |
    | Where I'm Calling From: Selected Stories            |             12 |
    | White Noise                                         |             49 |
    | Cannery Row                                         |             95 |
    | Oblivion: Stories                                   |            172 |
    | Consider the Lobster                                |             92 |
    | 10% Happier                                         |             29 |
    | fake_book                                           |            287 |
    | Lincoln In The Bardo                                |           1000 |
    +-----------------------------------------------------+----------------+
    19 rows in set (0.00 sec)

    mysql> select title, stock_quantity from books where stock_quantity like '____';                                                            
    +----------------------+----------------+
    | title                | stock_quantity |
    +----------------------+----------------+
    | Lincoln In The Bardo |           1000 |
    +----------------------+----------------+
    1 row in set (0.00 sec)

    mysql> select title, stock_quantity from books where stock_quantity like '__'; 
    +-----------------------------------------------------+----------------+
    | title                                               | stock_quantity |
    +-----------------------------------------------------+----------------+
    | The Namesake                                        |             32 |
    | Norse Mythology                                     |             43 |
    | American Gods                                       |             12 |
    | Interpreter of Maladies                             |             97 |
    | The Circle                                          |             26 |
    | The Amazing Adventures of Kavalier & Clay           |             68 |
    | Just Kids                                           |             55 |
    | What We Talk About When We Talk About Love: Stories |             23 |
    | Where I'm Calling From: Selected Stories            |             12 |
    | White Noise                                         |             49 |
    | Cannery Row                                         |             95 |
    | Consider the Lobster                                |             92 |
    | 10% Happier                                         |             29 |
    +-----------------------------------------------------+----------------+
    13 rows in set (0.01 sec)

***'%' means anything, '__' means length of characters***
***How to select an item if % or _ are used as a character?***

    mysql> select title from books where title like "%\%%";
    +-------------+
    | title       |
    +-------------+
    | 10% Happier |
    +-------------+
    1 row in set (0.00 sec)

    mysql> select title from books where title like "%\_%";
    +-----------+
    | title     |
    +-----------+
    | fake_book |
    +-----------+
    1 row in set (0.00 sec)

***********************************************************
#### EXERCISES
***********************************************************

    mysql> select title from books where title like '%Stories%';
    +-----------------------------------------------------+
    | title                                               |
    +-----------------------------------------------------+
    | What We Talk About When We Talk About Love: Stories |
    | Where I'm Calling From: Selected Stories            |
    | Oblivion: Stories                                   |
    +-----------------------------------------------------+
    3 rows in set (0.00 sec)

    mysql> select title, pages from books order by pages desc limit 1;
    +-------------------------------------------+-------+
    | title                                     | pages |
    +-------------------------------------------+-------+
    | The Amazing Adventures of Kavalier & Clay |   634 |
    +-------------------------------------------+-------+
    1 row in set (0.00 sec)

    mysql> select concat(title, ' - ', released_year) as 'summary' from books order by released_year desc limit 3;                              
    +-----------------------------+
    | summary                     |
    +-----------------------------+
    | Lincoln In The Bardo - 2017 |
    | Norse Mythology - 2016      |
    | 10% Happier - 2014          |
    +-----------------------------+
    3 rows in set (0.00 sec)

    mysql> select title, author_lname from books where author_lname like '% %';
    +----------------------+----------------+
    | title                | author_lname   |
    +----------------------+----------------+
    | Oblivion: Stories    | Foster Wallace |
    | Consider the Lobster | Foster Wallace |
    +----------------------+----------------+
    2 rows in set (0.00 sec)

    mysql> select title, released_year, stock_quantity from books order by 3 limit 3;
    +-----------------------------------------------------+---------------+----------------+
    | title                                               | released_year | stock_quantity |
    +-----------------------------------------------------+---------------+----------------+
    | American Gods                                       |          2001 |             12 |
    | Where I'm Calling From: Selected Stories            |          1989 |             12 |
    | What We Talk About When We Talk About Love: Stories |          1981 |             23 |
    +-----------------------------------------------------+---------------+----------------+
    3 rows in set (0.00 sec)

    mysql> select title, author_lname from books order by author_lname, title;
    +-----------------------------------------------------+----------------+
    | title                                               | author_lname   |
    +-----------------------------------------------------+----------------+
    | What We Talk About When We Talk About Love: Stories | Carver         |
    | Where I'm Calling From: Selected Stories            | Carver         |
    | The Amazing Adventures of Kavalier & Clay           | Chabon         |
    | White Noise                                         | DeLillo        |
    | A Heartbreaking Work of Staggering Genius           | Eggers         |
    | A Hologram for the King: A Novel                    | Eggers         |
    | The Circle                                          | Eggers         |
    | Consider the Lobster                                | Foster Wallace |
    | Oblivion: Stories                                   | Foster Wallace |
    | American Gods                                       | Gaiman         |
    | Coraline                                            | Gaiman         |
    | Norse Mythology                                     | Gaiman         |
    | 10% Happier                                         | Harris         |
    | fake_book                                           | Harris         |
    | Interpreter of Maladies                             | Lahiri         |
    | The Namesake                                        | Lahiri         |
    | Lincoln In The Bardo                                | Saunders       |
    | Just Kids                                           | Smith          |
    | Cannery Row                                         | Steinbeck      |
    +-----------------------------------------------------+----------------+
    19 rows in set (0.00 sec)

    mysql> select upper(concat('my favorit author is ', author_fname, ' ', author_lname, '!')) as 'yell' from books;                            
    +--------------------------------------------+
    | yell                                       |
    +--------------------------------------------+
    | MY FAVORIT AUTHOR IS JHUMPA LAHIRI!        |
    | MY FAVORIT AUTHOR IS NEIL GAIMAN!          |
    | MY FAVORIT AUTHOR IS NEIL GAIMAN!          |
    | MY FAVORIT AUTHOR IS JHUMPA LAHIRI!        |
    | MY FAVORIT AUTHOR IS DAVE EGGERS!          |
    | MY FAVORIT AUTHOR IS DAVE EGGERS!          |
    | MY FAVORIT AUTHOR IS MICHAEL CHABON!       |
    | MY FAVORIT AUTHOR IS PATTI SMITH!          |
    | MY FAVORIT AUTHOR IS DAVE EGGERS!          |
    | MY FAVORIT AUTHOR IS NEIL GAIMAN!          |
    | MY FAVORIT AUTHOR IS RAYMOND CARVER!       |
    | MY FAVORIT AUTHOR IS RAYMOND CARVER!       |
    | MY FAVORIT AUTHOR IS DON DELILLO!          |
    | MY FAVORIT AUTHOR IS JOHN STEINBECK!       |
    | MY FAVORIT AUTHOR IS DAVID FOSTER WALLACE! |
    | MY FAVORIT AUTHOR IS DAVID FOSTER WALLACE! |
    | MY FAVORIT AUTHOR IS DAN HARRIS!           |
    | MY FAVORIT AUTHOR IS FREIDA HARRIS!        |
    | MY FAVORIT AUTHOR IS GEORGE SAUNDERS!      |
    +--------------------------------------------+
    19 rows in set (0.00 sec)

*************************************************************

### [COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html)

-------------------------

    mysql> select * from books;
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    | book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    |       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
    |       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
    |       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
    |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
    |       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
    |       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
    |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
    |       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
    |       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
    |      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
    |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
    |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
    |      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
    |      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
    |      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
    |      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
    |      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
    |      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
    |      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    19 rows in set (0.00 sec)

    mysql> select count(*) from books;
    +----------+
    | count(*) |
    +----------+
    |       19 |
    +----------+
    1 row in set (0.00 sec)

    mysql> select author_fname from books;
    +--------------+
    | author_fname |
    +--------------+
    | Jhumpa       |
    | Neil         |
    | Neil         |
    | Jhumpa       |
    | Dave         |
    | Dave         |
    | Michael      |
    | Patti        |
    | Dave         |
    | Neil         |
    | Raymond      |
    | Raymond      |
    | Don          |
    | John         |
    | David        |
    | David        |
    | Dan          |
    | Freida       |
    | George       |
    +--------------+
    19 rows in set (0.00 sec)

    mysql> select count(author_fname) from books;                                                                                                 
    +---------------------+
    | count(author_fname) |
    +---------------------+
    |                  19 |
    +---------------------+
    1 row in set (0.00 sec)

    mysql> select count(distinct author_fname) from books;
    +------------------------------+
    | count(distinct author_fname) |
    +------------------------------+
    |                           12 |
    +------------------------------+
    1 row in set (0.00 sec)

    mysql> select count(author_lname) from books;
    +---------------------+
    | count(author_lname) |
    +---------------------+
    |                  19 |
    +---------------------+
    1 row in set (0.00 sec)

    mysql> select author_lname from books;
    +----------------+
    | author_lname   |
    +----------------+
    | Lahiri         |
    | Gaiman         |
    | Gaiman         |
    | Lahiri         |
    | Eggers         |
    | Eggers         |
    | Chabon         |
    | Smith          |
    | Eggers         |
    | Gaiman         |
    | Carver         |
    | Carver         |
    | DeLillo        |
    | Steinbeck      |
    | Foster Wallace |
    | Foster Wallace |
    | Harris         |
    | Harris         |
    | Saunders       |
    +----------------+
    19 rows in set (0.00 sec)

    mysql> select count(distinct author_lname) from books;                                                                                        
    +------------------------------+
    | count(distinct author_lname) |
    +------------------------------+
    |                           11 |
    +------------------------------+
    1 row in set (0.00 sec)

    mysql> select author_fname, author_lname from books;
    +--------------+----------------+
    | author_fname | author_lname   |
    +--------------+----------------+
    | Jhumpa       | Lahiri         |
    | Neil         | Gaiman         |
    | Neil         | Gaiman         |
    | Jhumpa       | Lahiri         |
    | Dave         | Eggers         |
    | Dave         | Eggers         |
    | Michael      | Chabon         |
    | Patti        | Smith          |
    | Dave         | Eggers         |
    | Neil         | Gaiman         |
    | Raymond      | Carver         |
    | Raymond      | Carver         |
    | Don          | DeLillo        |
    | John         | Steinbeck      |
    | David        | Foster Wallace |
    | David        | Foster Wallace |
    | Dan          | Harris         |
    | Freida       | Harris         |
    | George       | Saunders       |
    +--------------+----------------+
    19 rows in set (0.00 sec)

***Shows the combo of both distinct fname & distinct lname***

    mysql> select count(distinct author_lname, author_fname) from books; 
    +--------------------------------------------+
    | count(distinct author_lname, author_fname) |
    +--------------------------------------------+
    |                                         12 |
    +--------------------------------------------+
    1 row in set (0.00 sec)

    mysql> select title from books where title like '%the%';
    +-------------------------------------------+
    | title                                     |
    +-------------------------------------------+
    | The Namesake                              |
    | A Hologram for the King: A Novel          |
    | The Circle                                |
    | The Amazing Adventures of Kavalier & Clay |
    | Consider the Lobster                      |
    | Lincoln In The Bardo                      |
    +-------------------------------------------+
    6 rows in set (0.01 sec)

    mysql> select count(title) from books where title like '%the%';                                                                               
    +--------------+
    | count(title) |
    +--------------+
    |            6 |
    +--------------+
    1 row in set (0.00 sec)

***Better way***

    mysql> select count(*) from books where title like '%the%';                                                                                   
    +----------+
    | count(*) |
    +----------+
    |        6 |
    +----------+
    1 row in set (0.00 sec)

***********************************************************

### [GROUP BY](https://dev.mysql.com/doc/refman/8.0/en/group-by-optimization.html)

----------------------------

    mysql> select title, author_lname from books;
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

***This will create a 'super row' with all of the authors books in one row***

    mysql> select title, author_lname from books group by author_lname;                                                                           
    +-----------------------------------------------------+----------------+
    | title                                               | author_lname   |
    +-----------------------------------------------------+----------------+
    | What We Talk About When We Talk About Love: Stories | Carver         |
    | The Amazing Adventures of Kavalier & Clay           | Chabon         |
    | White Noise                                         | DeLillo        |
    | A Hologram for the King: A Novel                    | Eggers         |
    | Oblivion: Stories                                   | Foster Wallace |
    | Norse Mythology                                     | Gaiman         |
    | 10% Happier                                         | Harris         |
    | The Namesake                                        | Lahiri         |
    | Lincoln In The Bardo                                | Saunders       |
    | Just Kids                                           | Smith          |
    | Cannery Row                                         | Steinbeck      |
    +-----------------------------------------------------+----------------+
    11 rows in set (0.00 sec)

    mysql> select author_lname, count(*) from books group by author_lname;
    +----------------+----------+
    | author_lname   | count(*) |
    +----------------+----------+
    | Carver         |        2 |
    | Chabon         |        1 |
    | DeLillo        |        1 |
    | Eggers         |        3 |
    | Foster Wallace |        2 |
    | Gaiman         |        3 |
    | Harris         |        2 |
    | Lahiri         |        2 |
    | Saunders       |        1 |
    | Smith          |        1 |
    | Steinbeck      |        1 |
    +----------------+----------+
    11 rows in set (0.00 sec)

    mysql> select title, author_fname, author_lname from books;
    +-----------------------------------------------------+--------------+----------------+
    | title                                               | author_fname | author_lname   |
    +-----------------------------------------------------+--------------+----------------+
    | The Namesake                                        | Jhumpa       | Lahiri         |
    | Norse Mythology                                     | Neil         | Gaiman         |
    | American Gods                                       | Neil         | Gaiman         |
    | Interpreter of Maladies                             | Jhumpa       | Lahiri         |
    | A Hologram for the King: A Novel                    | Dave         | Eggers         |
    | The Circle                                          | Dave         | Eggers         |
    | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
    | Just Kids                                           | Patti        | Smith          |
    | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |
    | Coraline                                            | Neil         | Gaiman         |
    | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
    | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |
    | White Noise                                         | Don          | DeLillo        |
    | Cannery Row                                         | John         | Steinbeck      |
    | Oblivion: Stories                                   | David        | Foster Wallace |
    | Consider the Lobster                                | David        | Foster Wallace |
    | 10% Happier                                         | Dan          | Harris         |
    | fake_book                                           | Freida       | Harris         |
    | Lincoln In The Bardo                                | George       | Saunders       |
    +-----------------------------------------------------+--------------+----------------+
    19 rows in set (0.00 sec)

***This following is not really useful, as it does not distinguish if there are more than one author with the same last name***

    mysql> select title, author_fname, author_lname from books group by author_lname;
    +-----------------------------------------------------+--------------+----------------+
    | title                                               | author_fname | author_lname   |
    +-----------------------------------------------------+--------------+----------------+
    | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |
    | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |
    | White Noise                                         | Don          | DeLillo        |
    | A Hologram for the King: A Novel                    | Dave         | Eggers         |
    | Oblivion: Stories                                   | David        | Foster Wallace |
    | Norse Mythology                                     | Neil         | Gaiman         |
    | 10% Happier                                         | Dan          | Harris         |
    | The Namesake                                        | Jhumpa       | Lahiri         |
    | Lincoln In The Bardo                                | George       | Saunders       |
    | Just Kids                                           | Patti        | Smith          |
    | Cannery Row                                         | John         | Steinbeck      |
    +-----------------------------------------------------+--------------+----------------+
    11 rows in set (0.00 sec)

***Still has problem with last name, if there are multiple***

    mysql> select author_fname, author_lname, count(*) from books group by author_lname;                                                  
    +--------------+----------------+----------+
    | author_fname | author_lname   | count(*) |
    +--------------+----------------+----------+
    | Raymond      | Carver         |        2 |
    | Michael      | Chabon         |        1 |
    | Don          | DeLillo        |        1 |
    | Dave         | Eggers         |        3 |
    | David        | Foster Wallace |        2 |
    | Neil         | Gaiman         |        3 |
    | Dan          | Harris         |        2 |
    | Jhumpa       | Lahiri         |        2 |
    | George       | Saunders       |        1 |
    | Patti        | Smith          |        1 |
    | John         | Steinbeck      |        1 |
    +--------------+----------------+----------+
    11 rows in set (0.01 sec)

    mysql> select author_fname, author_lname, count(*) from books group by author_lname, author_fname;
    +--------------+----------------+----------+
    | author_fname | author_lname   | count(*) |
    +--------------+----------------+----------+
    | Raymond      | Carver         |        2 |
    | Michael      | Chabon         |        1 |
    | Don          | DeLillo        |        1 |
    | Dave         | Eggers         |        3 |
    | David        | Foster Wallace |        2 |
    | Neil         | Gaiman         |        3 |
    | Dan          | Harris         |        1 |
    | Freida       | Harris         |        1 |
    | Jhumpa       | Lahiri         |        2 |
    | George       | Saunders       |        1 |
    | Patti        | Smith          |        1 |
    | John         | Steinbeck      |        1 |
    +--------------+----------------+----------+
    12 rows in set (0.00 sec)

    mysql> select released_year from books;
    +---------------+
    | released_year |
    +---------------+
    |          2003 |
    |          2016 |
    |          2001 |
    |          1996 |
    |          2012 |
    |          2013 |
    |          2000 |
    |          2010 |
    |          2001 |
    |          2003 |
    |          1981 |
    |          1989 |
    |          1985 |
    |          1945 |
    |          2004 |
    |          2005 |
    |          2014 |
    |          2001 |
    |          2017 |
    +---------------+
    19 rows in set (0.00 sec)

    mysql> select released_year, count(*) from books;
    +---------------+----------+
    | released_year | count(*) |
    +---------------+----------+
    |          2003 |       19 |
    +---------------+----------+
    1 row in set (0.00 sec)

    mysql> select released_year, count(*) from books group by released_year;                                                                      
    +---------------+----------+
    | released_year | count(*) |
    +---------------+----------+
    |          1945 |        1 |
    |          1981 |        1 |
    |          1985 |        1 |
    |          1989 |        1 |
    |          1996 |        1 |
    |          2000 |        1 |
    |          2001 |        3 |
    |          2003 |        2 |
    |          2004 |        1 |
    |          2005 |        1 |
    |          2010 |        1 |
    |          2012 |        1 |
    |          2013 |        1 |
    |          2014 |        1 |
    |          2016 |        1 |
    |          2017 |        1 |
    +---------------+----------+
    16 rows in set (0.00 sec)

    mysql> select concat('In the ', released_year, ' ', count(*), ' book(s) released') AS year from books group by released_year;                 
    +--------------------------------+
    | year                           |
    +--------------------------------+
    | In the 1945 1 book(s) released |
    | In the 1981 1 book(s) released |
    | In the 1985 1 book(s) released |
    | In the 1989 1 book(s) released |
    | In the 1996 1 book(s) released |
    | In the 2000 1 book(s) released |
    | In the 2001 3 book(s) released |
    | In the 2003 2 book(s) released |
    | In the 2004 1 book(s) released |
    | In the 2005 1 book(s) released |
    | In the 2010 1 book(s) released |
    | In the 2012 1 book(s) released |
    | In the 2013 1 book(s) released |
    | In the 2014 1 book(s) released |
    | In the 2016 1 book(s) released |
    | In the 2017 1 book(s) released |
    +--------------------------------+
    16 rows in set (0.00 sec)

***********************************************************

### [MIN](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_min) and [MAX](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_max) BASICS

--------------------------------------

    mysql> select min(released_year) from books;
    +--------------------+
    | min(released_year) |
    +--------------------+
    |               1945 |
    +--------------------+
    1 row in set (0.00 sec)

    mysql> select min(pages) from books;
    +------------+
    | min(pages) |
    +------------+
    |        176 |
    +------------+
    1 row in set (0.00 sec)

    mysql> select max(released_year) from books;                                                                                                  
    +--------------------+
    | max(released_year) |
    +--------------------+
    |               2017 |
    +--------------------+
    1 row in set (0.00 sec)

    mysql> SELECT Max(pages) FROM books;
    +------------+
    | Max(pages) |
    +------------+
    |        634 |
    +------------+
    1 row in set (0.00 sec)

***This provides the max pages, and the first book title in the DB, which doesn't match***

    mysql> SELECT Max(pages), title FROM books;
    +------------+--------------+
    | Max(pages) | title        |
    +------------+--------------+
    |        634 | The Namesake |
    +------------+--------------+
    1 row in set (0.00 sec)

    mysql> SELECT title, pages FROM books;
    +-----------------------------------------------------+-------+
    | title                                               | pages |
    +-----------------------------------------------------+-------+
    | The Namesake                                        |   291 |
    | Norse Mythology                                     |   304 |
    | American Gods                                       |   465 |
    | Interpreter of Maladies                             |   198 |
    | A Hologram for the King: A Novel                    |   352 |
    | The Circle                                          |   504 |
    | The Amazing Adventures of Kavalier & Clay           |   634 |
    | Just Kids                                           |   304 |
    | A Heartbreaking Work of Staggering Genius           |   437 |
    | Coraline                                            |   208 |
    | What We Talk About When We Talk About Love: Stories |   176 |
    | Where I'm Calling From: Selected Stories            |   526 |
    | White Noise                                         |   320 |
    | Cannery Row                                         |   181 |
    | Oblivion: Stories                                   |   329 |
    | Consider the Lobster                                |   343 |
    | 10% Happier                                         |   256 |
    | fake_book                                           |   428 |
    | Lincoln In The Bardo                                |   367 |
    +-----------------------------------------------------+-------+
    19 rows in set (0.00 sec)

**********************************************************

### [SUBQUERIES](https://dev.mysql.com/doc/refman/8.0/en/subqueries.html)

- When using subqueries, the subquery runs first -->
- So "(SELECT Min(pages) FROM books" runs first -->
- Then SELECT * FROM books -->
- mysql> SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books);

---------------------------------------------

    +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
    | book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
    +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
    |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
    +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
    1 row in set (0.00 sec)

    mysql> SELECT title, pages FROM books WHERE pages=(SELECT Max(pages) FROM books);
    +-------------------------------------------+-------+
    | title                                     | pages |
    +-------------------------------------------+-------+
    | The Amazing Adventures of Kavalier & Clay |   634 |
    +-------------------------------------------+-------+
    1 row in set (0.00 sec)

***As the previous method is actually running two queries, a faster/better way is as follows***


    mysql> SELECT * FROM books ORDER BY pages ASC LIMIT 1;                                                                                        
    +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
    | book_id | title                                               | author_fname | author_lname | released_year | stock_quantity | pages |
    +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
    |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver       |          1981 |             23 |   176 |
    +---------+-----------------------------------------------------+--------------+--------------+---------------+----------------+-------+
    1 row in set (0.00 sec)

    mysql> SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;
    +-----------------------------------------------------+-------+
    | title                                               | pages |
    +-----------------------------------------------------+-------+
    | What We Talk About When We Talk About Love: Stories |   176 |
    +-----------------------------------------------------+-------+
    1 row in set (0.00 sec)

    mysql> SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;                                                                         
    +-------------------------------------------+-------+
    | title                                     | pages |
    +-------------------------------------------+-------+
    | The Amazing Adventures of Kavalier & Clay |   634 |
    +-------------------------------------------+-------+
    1 row in set (0.00 sec)

********************************************************

### [USING Min & MAX WITH GROUP BY](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html)

SELECT  author_lname,
    author_fname,
    Min(released_year)
FROM    books
GROUP   BY author_lname,
        author_fname;

---------------------------------------

    mysql> SELECT author_fname, author_lname, Min(released_year)
        -> FROM books
        -> GROUP BY author_lname, author_fname;
    +--------------+----------------+--------------------+
    | author_fname | author_lname   | Min(released_year) |
    +--------------+----------------+--------------------+
    | Raymond      | Carver         |               1981 |
    | Michael      | Chabon         |               2000 |
    | Don          | DeLillo        |               1985 |
    | Dave         | Eggers         |               2001 |
    | David        | Foster Wallace |               2004 |
    | Neil         | Gaiman         |               2001 |
    | Dan          | Harris         |               2014 |
    | Freida       | Harris         |               2001 |
    | Jhumpa       | Lahiri         |               1996 |
    | George       | Saunders       |               2017 |
    | Patti        | Smith          |               2010 |
    | John         | Steinbeck      |               1945 |
    +--------------+----------------+--------------------+
    12 rows in set (0.01 sec)

***If you leave off 'author_fname', then it will bunch up authors with the same last name***

    mysql> SELECT Max(pages)
        -> FROM books
        -> GROUP BY author_lname, author_fname;
    +------------+
    | Max(pages) |
    +------------+
    |        526 |
    |        634 |
    |        320 |
    |        504 |
    |        343 |
    |        465 |
    |        256 |
    |        428 |
    |        291 |
    |        367 |
    |        304 |
    |        181 |
    +------------+
    12 rows in set (0.00 sec)

    mysql> SELECT author_fname, author_lname, Max(pages)
        -> FROM books
        -> GROUP BY author_lname, author_fname;
    +--------------+----------------+------------+
    | author_fname | author_lname   | Max(pages) |
    +--------------+----------------+------------+
    | Raymond      | Carver         |        526 |
    | Michael      | Chabon         |        634 |
    | Don          | DeLillo        |        320 |
    | Dave         | Eggers         |        504 |
    | David        | Foster Wallace |        343 |
    | Neil         | Gaiman         |        465 |
    | Dan          | Harris         |        256 |
    | Freida       | Harris         |        428 |
    | Jhumpa       | Lahiri         |        291 |
    | George       | Saunders       |        367 |
    | Patti        | Smith          |        304 |
    | John         | Steinbeck      |        181 |
    +--------------+----------------+------------+
    12 rows in set (0.00 sec)

    mysql> SELECT CONCAT(author_fname, ' ', author_lname) AS author, Max(pages) AS 'longest book'
        -> FROM books
        -> GROUP BY author_lname, author_fname;
    +----------------------+--------------+
    | author               | longest book |
    +----------------------+--------------+
    | Raymond Carver       |          526 |
    | Michael Chabon       |          634 |
    | Don DeLillo          |          320 |
    | Dave Eggers          |          504 |
    | David Foster Wallace |          343 |
    | Neil Gaiman          |          465 |
    | Dan Harris           |          256 |
    | Freida Harris        |          428 |
    | Jhumpa Lahiri        |          291 |
    | George Saunders      |          367 |
    | Patti Smith          |          304 |
    | John Steinbeck       |          181 |
    +----------------------+--------------+
    12 rows in set (0.00 sec)

******************************************************

### [SUM](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_sum)

-----------------------

    mysql> SELECT SUM(pages) FROM books;
    +------------+
    | SUM(pages) |
    +------------+
    |       6623 |
    +------------+
    1 row in set (0.00 sec)

    mysql> SELECT Sum(released_year) FROM books;
    +--------------------+
    | Sum(released_year) |
    +--------------------+
    |              37996 |
    +--------------------+
    1 row in set (0.00 sec)

    mysql> SELECT author_fname, author_lname, Sum(pages)
        -> FROM books
        -> GROUP BY author_lname, author_fname;
    +--------------+----------------+------------+
    | author_fname | author_lname   | Sum(pages) |
    +--------------+----------------+------------+
    | Raymond      | Carver         |        702 |
    | Michael      | Chabon         |        634 |
    | Don          | DeLillo        |        320 |
    | Dave         | Eggers         |       1293 |
    | David        | Foster Wallace |        672 |
    | Neil         | Gaiman         |        977 |
    | Dan          | Harris         |        256 |
    | Freida       | Harris         |        428 |
    | Jhumpa       | Lahiri         |        489 |
    | George       | Saunders       |        367 |
    | Patti        | Smith          |        304 |
    | John         | Steinbeck      |        181 |
    +--------------+----------------+------------+
    12 rows in set (0.00 sec)

    mysql> SELECT author_fname, author_lname, Sum(released_year) FROM books GROUP BY author_lname, author_fname;                                  
    +--------------+----------------+--------------------+
    | author_fname | author_lname   | Sum(released_year) |
    +--------------+----------------+--------------------+
    | Raymond      | Carver         |               3970 |
    | Michael      | Chabon         |               2000 |
    | Don          | DeLillo        |               1985 |
    | Dave         | Eggers         |               6026 |
    | David        | Foster Wallace |               4009 |
    | Neil         | Gaiman         |               6020 |
    | Dan          | Harris         |               2014 |
    | Freida       | Harris         |               2001 |
    | Jhumpa       | Lahiri         |               3999 |
    | George       | Saunders       |               2017 |
    | Patti        | Smith          |               2010 |
    | John         | Steinbeck      |               1945 |
    +--------------+----------------+--------------------+
    12 rows in set (0.00 sec)

************************************************************

### [AVG](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_avg)

-------------------------

    mysql> SELECT AVG(released_year) FROM books;
    +--------------------+
    | AVG(released_year) |
    +--------------------+
    |          1999.7895 |
    +--------------------+
    1 row in set (0.00 sec)

    mysql> SELECT AVG(pages) FROM books;
    +------------+
    | AVG(pages) |
    +------------+
    |   348.5789 |
    +------------+
    1 row in set (0.01 sec)

    mysql> SELECT AVG(stock_quantity) FROM books GROUP BY released_year;
    +---------------------+
    | AVG(stock_quantity) |
    +---------------------+
    |             95.0000 |
    |             23.0000 |
    |             49.0000 |
    |             12.0000 |
    |             97.0000 |
    |             68.0000 |
    |            134.3333 |
    |             66.0000 |
    |            172.0000 |
    |             92.0000 |
    |             55.0000 |
    |            154.0000 |
    |             26.0000 |
    |             29.0000 |
    |             43.0000 |
    |           1000.0000 |
    +---------------------+
    16 rows in set (0.00 sec)

    mysql> SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
    +---------------+---------------------+
    | released_year | AVG(stock_quantity) |
    +---------------+---------------------+
    |          1945 |             95.0000 |
    |          1981 |             23.0000 |
    |          1985 |             49.0000 |
    |          1989 |             12.0000 |
    |          1996 |             97.0000 |
    |          2000 |             68.0000 |
    |          2001 |            134.3333 |
    |          2003 |             66.0000 |
    |          2004 |            172.0000 |
    |          2005 |             92.0000 |
    |          2010 |             55.0000 |
    |          2012 |            154.0000 |
    |          2013 |             26.0000 |
    |          2014 |             29.0000 |
    |          2016 |             43.0000 |
    |          2017 |           1000.0000 |
    +---------------+---------------------+
    16 rows in set (0.00 sec)

    mysql> SELECT released_year AS 'year', AVG(stock_quantity) as 'average quantity' FROM books GROUP BY released_year;                           
    +------+------------------+
    | year | average quantity |
    +------+------------------+
    | 1945 |          95.0000 |
    | 1981 |          23.0000 |
    | 1985 |          49.0000 |
    | 1989 |          12.0000 |
    | 1996 |          97.0000 |
    | 2000 |          68.0000 |
    | 2001 |         134.3333 |
    | 2003 |          66.0000 |
    | 2004 |         172.0000 |
    | 2005 |          92.0000 |
    | 2010 |          55.0000 |
    | 2012 |         154.0000 |
    | 2013 |          26.0000 |
    | 2014 |          29.0000 |
    | 2016 |          43.0000 |
    | 2017 |        1000.0000 |
    +------+------------------+
    16 rows in set (0.00 sec)

    mysql> SELECT author_fname AS 'first name', author_lname as 'last name', AVG(pages) AS 'average written pages' FROM books
        -> GROUP BY author_lname, author_fname;
    +------------+----------------+-----------------------+
    | first name | last name      | average written pages |
    +------------+----------------+-----------------------+
    | Raymond    | Carver         |              351.0000 |
    | Michael    | Chabon         |              634.0000 |
    | Don        | DeLillo        |              320.0000 |
    | Dave       | Eggers         |              431.0000 |
    | David      | Foster Wallace |              336.0000 |
    | Neil       | Gaiman         |              325.6667 |
    | Dan        | Harris         |              256.0000 |
    | Freida     | Harris         |              428.0000 |
    | Jhumpa     | Lahiri         |              244.5000 |
    | George     | Saunders       |              367.0000 |
    | Patti      | Smith          |              304.0000 |
    | John       | Steinbeck      |              181.0000 |
    +------------+----------------+-----------------------+
    12 rows in set (0.00 sec)

***Due to DATA TYPE, automatically includes 4 decimals, regardless if a complete number***

****************************************************************************
#### EXERCISES
****************************************************************************

    mysql> SELECT * FROM books;
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    | book_id | title                                               | author_fname | author_lname   | released_year | stock_quantity | pages |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    |       1 | The Namesake                                        | Jhumpa       | Lahiri         |          2003 |             32 |   291 |
    |       2 | Norse Mythology                                     | Neil         | Gaiman         |          2016 |             43 |   304 |
    |       3 | American Gods                                       | Neil         | Gaiman         |          2001 |             12 |   465 |
    |       4 | Interpreter of Maladies                             | Jhumpa       | Lahiri         |          1996 |             97 |   198 |
    |       5 | A Hologram for the King: A Novel                    | Dave         | Eggers         |          2012 |            154 |   352 |
    |       6 | The Circle                                          | Dave         | Eggers         |          2013 |             26 |   504 |
    |       7 | The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |          2000 |             68 |   634 |
    |       8 | Just Kids                                           | Patti        | Smith          |          2010 |             55 |   304 |
    |       9 | A Heartbreaking Work of Staggering Genius           | Dave         | Eggers         |          2001 |            104 |   437 |
    |      10 | Coraline                                            | Neil         | Gaiman         |          2003 |            100 |   208 |
    |      11 | What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |          1981 |             23 |   176 |
    |      12 | Where I'm Calling From: Selected Stories            | Raymond      | Carver         |          1989 |             12 |   526 |
    |      13 | White Noise                                         | Don          | DeLillo        |          1985 |             49 |   320 |
    |      14 | Cannery Row                                         | John         | Steinbeck      |          1945 |             95 |   181 |
    |      15 | Oblivion: Stories                                   | David        | Foster Wallace |          2004 |            172 |   329 |
    |      16 | Consider the Lobster                                | David        | Foster Wallace |          2005 |             92 |   343 |
    |      17 | 10% Happier                                         | Dan          | Harris         |          2014 |             29 |   256 |
    |      18 | fake_book                                           | Freida       | Harris         |          2001 |            287 |   428 |
    |      19 | Lincoln In The Bardo                                | George       | Saunders       |          2017 |           1000 |   367 |
    +---------+-----------------------------------------------------+--------------+----------------+---------------+----------------+-------+
    19 rows in set (0.00 sec)

--------------------------------------------------------------------

- Print the number of books in the database

--------------------------------------------------------------------

    mysql> SELECT COUNT(*) FROM books;
    +----------+
    | COUNT(*) |
    +----------+
    |       19 |
    +----------+
    1 row in set (0.00 sec)

---------------------------------------------------------------------

- Print out how many books were released in each year

---------------------------------------------------------------------

    mysql> SELECT released_year AS 'Year Released', COUNT(*) AS 'Books Released' FROM books GROUP BY released_year;                               +---------------+----------------+
    | Year Released | Books Released |
    +---------------+----------------+
    |          1945 |              1 |
    |          1981 |              1 |
    |          1985 |              1 |
    |          1989 |              1 |
    |          1996 |              1 |
    |          2000 |              1 |
    |          2001 |              3 |
    |          2003 |              2 |
    |          2004 |              1 |
    |          2005 |              1 |
    |          2010 |              1 |
    |          2012 |              1 |
    |          2013 |              1 |
    |          2014 |              1 |
    |          2016 |              1 |
    |          2017 |              1 |
    +---------------+----------------+
    16 rows in set (0.00 sec)

-----------------------------------------------------------

- Print number in stock for each released year

-----------------------------------------------------------

    mysql> SELECT released_year AS 'Year Released', Sum(stock_quantity) AS 'Books Released' FROM books WHERE released_year LIKE '%' GROUP BY released_year;
    +---------------+----------------+
    | Year Released | Books Released |
    +---------------+----------------+
    |          1945 |             95 |
    |          1981 |             23 |
    |          1985 |             49 |
    |          1989 |             12 |
    |          1996 |             97 |
    |          2000 |             68 |
    |          2001 |            403 |
    |          2003 |            132 |
    |          2004 |            172 |
    |          2005 |             92 |
    |          2010 |             55 |
    |          2012 |            154 |
    |          2013 |             26 |
    |          2014 |             29 |
    |          2016 |             43 |
    |          2017 |           1000 |
    +---------------+----------------+
    16 rows in set (0.00 sec)

-------------------------------------------------------------

- Print out the total number of books in stock

-------------------------------------------------------------

    mysql> SELECT Sum(stock_quantity) AS 'In Stock' FROM books;
    +----------+
    | In Stock |
    +----------+
    |     2450 |
    +----------+
    1 row in set (0.00 sec)
--------------------------------------------------------------

- Find average released_year for each author

---------------------------------------------------------------

    mysql> SELECT CONCAT(author_fname, ' ', author_lname) AS Author, AVG(released_year) AS 'Average Release Year' FROM books GROUP BY author_lname, author_fname;
    +----------------------+----------------------+
    | Author               | Average Release Year |
    +----------------------+----------------------+
    | Raymond Carver       |            1985.0000 |
    | Michael Chabon       |            2000.0000 |
    | Don DeLillo          |            1985.0000 |
    | Dave Eggers          |            2008.6667 |
    | David Foster Wallace |            2004.5000 |
    | Neil Gaiman          |            2006.6667 |
    | Dan Harris           |            2014.0000 |
    | Freida Harris        |            2001.0000 |
    | Jhumpa Lahiri        |            1999.5000 |
    | George Saunders      |            2017.0000 |
    | Patti Smith          |            2010.0000 |
    | John Steinbeck       |            1945.0000 |
    +----------------------+----------------------+
    12 rows in set (0.01 sec)

----------------------------------------------------------

- Find the full name of the author who wrote the longest book

-----------------------------------------------------------

    mysql> SELECT CONCAT(author_fname, ' ', author_lname) AS Author, pages AS Pages FROM books ORDER BY pages DESC LIMIT 1;                      
    +----------------+-------+
    | Author         | Pages |
    +----------------+-------+
    | Michael Chabon |   634 |
    +----------------+-------+
    1 row in set (0.00 sec)

    mysql> SELECT released_year AS Year, COUNT(title) AS '# Books', AVG(pages) as 'Avg Pages' FROM books GROUP BY released_year;
    +------+---------+-----------+
    | Year | # Books | Avg Pages |
    +------+---------+-----------+
    | 1945 |       1 |  181.0000 |
    | 1981 |       1 |  176.0000 |
    | 1985 |       1 |  320.0000 |
    | 1989 |       1 |  526.0000 |
    | 1996 |       1 |  198.0000 |
    | 2000 |       1 |  634.0000 |
    | 2001 |       3 |  443.3333 |
    | 2003 |       2 |  249.5000 |
    | 2004 |       1 |  329.0000 |
    | 2005 |       1 |  343.0000 |
    | 2010 |       1 |  304.0000 |
    | 2012 |       1 |  352.0000 |
    | 2013 |       1 |  504.0000 |
    | 2014 |       1 |  256.0000 |
    | 2016 |       1 |  304.0000 |
    | 2017 |       1 |  367.0000 |
    +------+---------+-----------+
    16 rows in set (0.00 sec)

***************************************************************

## REVISITNG DATA TYPES

- [How Data is Stored](https://dev.mysql.com/doc/refman/8.0/en/storage-requirements.html)

******************************************************************

### [CHAR & VARCHAR](https://dev.mysql.com/doc/refman/8.0/en/char.html)

- Difference between CHAR & VARCHAR is that CHAR is fixed
- It is set to a specific number, so there cannot be more characters than what it is fixed to, and it will auto-fill the blank space.


    #### Explanatory Text
    The length of a CHAR column is fixed to the length that
    you DECLARE WHEN you CREATE the TABLE. The length can be
    ANY VALUE FROM 0 TO 255. WHEN CHAR VALUES ARE STORED, they
    ARE RIGHT-padded WITH spaces TO the specified length. WHEN
    CHAR VALUES ARE retreived, trailing spaces ARE removed
    unless the PAD_CHAR_TO_FULL_LENGTH SQL MODE IS enabled.
    
- Benefit: CHAR is faster for fixed length text
    
  "State Abbreviations: CA, NY"
  "Yes/No Flags: Y/N"
  "SEX: M/F"


    VALUE   | CHAR(4)   | STORAGE   | VARCHAR(4)    | STORAGE
    ---------------------------------------------------------
    ' '     | '____'    | 4 bytes   | ' '           | 1 byte
    'ab'    | "ab__"    | 4 bytes   | 'ab'          | 3 bytes
    'abcd'  | 'abcd'    | 4 bytes   | 'abcd'        | 5 bytes
    'abcdef'| 'abcd'    | 4 bytes   | 'abcdef'      | 5 bytes

****************************************************************

### [DECIMAL](https://dev.mysql.com/doc/refman/8.0/en/fixed-point-types.html)

- DECIMAL(5,2) > 5 is the max number of total digits, 2 is how many come after decimal
- DEMICAL(M,D)
- "M" has a range of 1 to 65
- "D" has a range of 0 to 30

-----------------------------------

    mysql> use dog_app;

    mysql> CREATE TABLE items (price DECIMAL(5,2));
    Query OK, 0 rows affected (0.01 sec)

***The table inserts the value as the highest possible decimal***

    mysql> INSERT INTO items(price) VALUES(7987654);
    Query OK, 1 row affected, 1 warning (0.01 sec)

    mysql> INSERT INTO items(price) VALUES(34.88);
    Query OK, 1 row affected (0.01 sec)
    
***The table rounds the decimal up to the next whole number***

    mysql> INSERT INTO items(price) VALUES(298.9999);
    Query OK, 1 row affected, 1 warning (0.01 sec)

    mysql> INSERT INTO items(price) VALUES(1.9999);
    Query OK, 1 row affected, 1 warning (0.02 sec)

    mysql> INSERT INTO items(price) VALUES(7);
    Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM items;
    +--------+
    | price  |
    +--------+
    | 999.99 |
    |  34.88 |
    | 299.00 |
    |   2.00 |
    |   7.00 |
    +--------+
    5 rows in set (0.00 sec)

******************************************************

### [FLOAT](https://dev.mysql.com/doc/refman/8.0/en/floating-point-types.html) and [DOUBLE](https://dev.mysql.com/doc/refman/8.0/en/floating-point-types.html)

- DECIMAL data type is a fixed point type, exact
- FLOAT & DOUBLE are floating-point data types, but approximate
- FLOAT & DOUBLE are able to store larger numbers, using less space
- But, it comes at the cost of percision

-------------------------------------------------------------------------------

    Data Type   | Memory Needed | Percision Issues
    ----------------------------------------------
    FLOAT       | 4 bytes       | ~7 digits
    DOUBLE      | 8 bytes       | ~15 digits

***Meaning, with FLOAT: if 1000001 is stored, the last 1 might not always be 1 when we retrieve it***

    Double is more percise

***Which is best to use: Always use DECIMAL, unless percision doesn' matter***

    mysql> CREATE TABLE thingies (price FLOAT);
    Query OK, 0 rows affected (0.02 sec)

    mysql> INSERT INTO thingies(price) VALUES (88.45);
    Query OK, 1 row affected (0.00 sec)

    mysql> SELECT * FROM thingies;
    +-------+
    | price |
    +-------+
    | 88.45 |
    +-------+
    1 row in set (0.00 sec)

    mysql> INSERT INTO thingies(price) VALUES (8877.45);
    Query OK, 1 row affected (0.02 sec)

    mysql> SELECT * FROM thingies;
    +---------+
    | price   |
    +---------+
    |   88.45 |
    | 8877.45 |
    +---------+
    2 rows in set (0.00 sec)

    mysql> INSERT INTO thingies(price) VALUES (8877665544.45);
    Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM thingies;
    +------------+
    | price      |
    +------------+
    |      88.45 |
    |    8877.45 |
    | 8877670000 |
    +------------+
    3 rows in set (0.00 sec)

************************************************************

## [DATE, TIME, and DATETIME](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-types.html)

- DATE: values with a Date but no Time: 'YYYY-MM-DD' Format
- TIME: values with a Time but no Date: 'HH:MM:SS' Format
- DATETIME: values with a Date and Time: 'YYYY-MM-DD HH:MM:SS' Format

*********************************************************
    
### Creating OUR DATE data

------------------------------------------

    mysql> CREATE DATABASE date_time_app;
    Query OK, 1 row affected (0.00 sec)

    mysql> USE date_time_app;
    Database changed
    mysql> CREATE TABLE people( name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME );                             
    Query OK, 0 rows affected (0.02 sec)

    mysql> INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
    Query OK, 1 row affected (0.01 sec)

    mysql> INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
    Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM people;
    +-------+------------+-----------+---------------------+
    | name  | birthdate  | birthtime | birthdt             |
    +-------+------------+-----------+---------------------+
    | Padma | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
    | Larry | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
    +-------+------------+-----------+---------------------+
    2 rows in set (0.00 sec)

    mysql> INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Toaster', '2017-04-21', '19:12:43', '2017-04-21 19:12:43');
    Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM people;
    +---------+------------+-----------+---------------------+
    | name    | birthdate  | birthtime | birthdt             |
    +---------+------------+-----------+---------------------+
    | Padma   | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
    | Larry   | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
    | Toaster | 2017-04-21 | 19:12:43  | 2017-04-21 19:12:43 |
    +---------+------------+-----------+---------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT CURDATE(); *** gives_current_date ***
    +------------+
    | CURDATE()  |
    +------------+
    | 2019-04-11 |
    +------------+
    1 row in set (0.00 sec)

    mysql> SELECT CURTIME(); *** gives_current_time ***
    +-----------+
    | CURTIME() |
    +-----------+
    | 20:44:10  |
    +-----------+
    1 row in set (0.00 sec)

    mysql> SELECT NOW(); *** gives_current_datetime ***
    +---------------------+
    | NOW()               |
    +---------------------+
    | 2019-04-11 20:44:28 |
    +---------------------+
    1 row in set (0.00 sec)

    mysql> INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Microwave', CURDATE(), CURTIME(), NOW());Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM people;
    +-----------+------------+-----------+---------------------+
    | name      | birthdate  | birthtime | birthdt             |
    +-----------+------------+-----------+---------------------+
    | Padma     | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
    | Larry     | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
    | Toaster   | 2017-04-21 | 19:12:43  | 2017-04-21 19:12:43 |
    | Microwave | 2019-04-11 | 20:48:53  | 2019-04-11 20:48:53 |
    +-----------+------------+-----------+---------------------+
    4 rows in set (0.01 sec)

    mysql> DELETE FROM people WHERE name = 'Microwave';
    Query OK, 1 row affected (0.01 sec)

*************************************************************

### [FORMATTING DATES](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-format)

----------------------------------

    mysql> SELECT name, birthdate FROM people;
    +---------+------------+
    | name    | birthdate  |
    +---------+------------+
    | Padma   | 1983-11-11 |
    | Larry   | 1943-12-25 |
    | Toaster | 2017-04-21 |
    +---------+------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthdate, DAY(birthdate) FROM people;                                                                                    
    +---------+------------+----------------+
    | name    | birthdate  | DAY(birthdate) |
    +---------+------------+----------------+
    | Padma   | 1983-11-11 |             11 |
    | Larry   | 1943-12-25 |             25 |
    | Toaster | 2017-04-21 |             21 |
    +---------+------------+----------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthdate, DAYNAME(birthdate) FROM people;                                                                                
    +---------+------------+--------------------+
    | name    | birthdate  | DAYNAME(birthdate) |
    +---------+------------+--------------------+
    | Padma   | 1983-11-11 | Friday             |
    | Larry   | 1943-12-25 | Saturday           |
    | Toaster | 2017-04-21 | Friday             |
    +---------+------------+--------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;                                                                              
    +---------+------------+----------------------+
    | name    | birthdate  | DAYOFWEEK(birthdate) |
    +---------+------------+----------------------+
    | Padma   | 1983-11-11 |                    6 |
    | Larry   | 1943-12-25 |                    7 |
    | Toaster | 2017-04-21 |                    6 |
    +---------+------------+----------------------+
    3 rows in set (0.01 sec)

    mysql> SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;                                                                              
    +---------+------------+----------------------+
    | name    | birthdate  | DAYOFYEAR(birthdate) |
    +---------+------------+----------------------+
    | Padma   | 1983-11-11 |                  315 |
    | Larry   | 1943-12-25 |                  359 |
    | Toaster | 2017-04-21 |                  111 |
    +---------+------------+----------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;                                                                              
    +---------+-----------+----------------------+
    | name    | birthtime | DAYOFYEAR(birthtime) |
    +---------+-----------+----------------------+
    | Padma   | 10:07:35  |                 NULL |
    | Larry   | 04:10:42  |                 NULL |
    | Toaster | 19:12:43  |                 NULL |
    +---------+-----------+----------------------+
    3 rows in set, 3 warnings (0.00 sec)

    mysql> SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;                                                                                  
    +---------+---------------------+--------------------+
    | name    | birthdt             | DAYOFYEAR(birthdt) |
    +---------+---------------------+--------------------+
    | Padma   | 1983-11-11 10:07:35 |                315 |
    | Larry   | 1943-12-25 04:10:42 |                359 |
    | Toaster | 2017-04-21 19:12:43 |                111 |
    +---------+---------------------+--------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthdt, MONTH(birthdt) FROM people;                                                                                      
    +---------+---------------------+----------------+
    | name    | birthdt             | MONTH(birthdt) |
    +---------+---------------------+----------------+
    | Padma   | 1983-11-11 10:07:35 |             11 |
    | Larry   | 1943-12-25 04:10:42 |             12 |
    | Toaster | 2017-04-21 19:12:43 |              4 |
    +---------+---------------------+----------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthdt, MONTHNAME(birthdt) FROM people;                                                                                  
    +---------+---------------------+--------------------+
    | name    | birthdt             | MONTHNAME(birthdt) |
    +---------+---------------------+--------------------+
    | Padma   | 1983-11-11 10:07:35 | November           |
    | Larry   | 1943-12-25 04:10:42 | December           |
    | Toaster | 2017-04-21 19:12:43 | April              |
    +---------+---------------------+--------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthtime, HOUR(birthtime) FROM people;                                                                                   
    +---------+-----------+-----------------+
    | name    | birthtime | HOUR(birthtime) |
    +---------+-----------+-----------------+
    | Padma   | 10:07:35  |              10 |
    | Larry   | 04:10:42  |               4 |
    | Toaster | 19:12:43  |              19 |
    +---------+-----------+-----------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthtime, MINUTE(birthtime) FROM people;                                                                                 
    +---------+-----------+-------------------+
    | name    | birthtime | MINUTE(birthtime) |
    +---------+-----------+-------------------+
    | Padma   | 10:07:35  |                 7 |
    | Larry   | 04:10:42  |                10 |
    | Toaster | 19:12:43  |                12 |
    +---------+-----------+-------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT CONCAT(MONTHNAME(birthdt), ' ',  DAY(birthdt), ' ',  YEAR(birthdt)) FROM people;                                                
    +---------------------------------------------------------------------+
    | CONCAT(MONTHNAME(birthdt), ' ',  DAY(birthdt), ' ',  YEAR(birthdt)) |
    +---------------------------------------------------------------------+
    | November 11 1983                                                    |
    | December 25 1943                                                    |
    | April 21 2017                                                       |
    +---------------------------------------------------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT DATE_FORMAT('1982-08-29', '%M %D, %Y');
    +----------------------------------------+
    | DATE_FORMAT('1982-08-29', '%M %D, %Y') |
    +----------------------------------------+
    | August 29th, 1982                      |
    +----------------------------------------+
    1 row in set (0.00 sec)

    mysql> SELECT DATE_FORMAT('1982-08-29 23:47:18', 'On %M %D, %Y at %I:%ipm');
    +---------------------------------------------------------------+
    | DATE_FORMAT('1982-08-29 23:47:18', 'On %M %D, %Y at %I:%ipm') |
    +---------------------------------------------------------------+
    | On August 29th, 1982 at 11:47pm                               |
    +---------------------------------------------------------------+
    1 row in set (0.00 sec)

    mysql> SELECT DATE_FORMAT(birthdt, '%W') FROM people;                                                                                         
    +----------------------------+
    | DATE_FORMAT(birthdt, '%W') |
    +----------------------------+
    | Friday                     |
    | Saturday                   |
    | Friday                     |
    +----------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;                                                                           
    +------------------------------------------+
    | DATE_FORMAT(birthdt, 'Was born on a %W') |
    +------------------------------------------+
    | Was born on a Friday                     |
    | Was born on a Saturday                   |
    | Was born on a Friday                     |
    +------------------------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name AS Name, DATE_FORMAT(birthdt, '%m/%d/%Y') AS "Born On" FROM people;
    +---------+------------+
    | Name    | Born On    |
    +---------+------------+
    | Padma   | 11/11/1983 |
    | Larry   | 12/25/1943 |
    | Toaster | 04/21/2017 |
    +---------+------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name AS Name, DATE_FORMAT(birthdt, '%m/%d/%Y') AS "Born On" FROM people ORDER BY birthdt;
    +---------+------------+
    | Name    | Born On    |
    +---------+------------+
    | Larry   | 12/25/1943 |
    | Padma   | 11/11/1983 |
    | Toaster | 04/21/2017 |
    +---------+------------+
    3 rows in set (0.00 sec)

***************************************************

### DATE MATH

- [DATEDIFF()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_datediff)
- [DATE_ADD()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-add)
- [DATE_SUB()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-sub) - works on the same concept as DATE_ADD

-----------------------

    mysql> SELECT * FROM people;
    +---------+------------+-----------+---------------------+
    | name    | birthdate  | birthtime | birthdt             |
    +---------+------------+-----------+---------------------+
    | Padma   | 1983-11-11 | 10:07:35  | 1983-11-11 10:07:35 |
    | Larry   | 1943-12-25 | 04:10:42  | 1943-12-25 04:10:42 |
    | Toaster | 2017-04-21 | 19:12:43  | 2017-04-21 19:12:43 |
    +---------+------------+-----------+---------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT DATEDIFF(NOW(), birthdate) FROM people;
    +----------------------------+
    | DATEDIFF(NOW(), birthdate) |
    +----------------------------+
    |                      12935 |
    |                      27501 |
    |                        720 |
    +----------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT name, birthdate,DATEDIFF(NOW(), birthdate) FROM people;                                                                         
    +---------+------------+----------------------------+
    | name    | birthdate  | DATEDIFF(NOW(), birthdate) |
    +---------+------------+----------------------------+
    | Padma   | 1983-11-11 |                      12935 |
    | Larry   | 1943-12-25 |                      27501 |
    | Toaster | 2017-04-21 |                        720 |
    +---------+------------+----------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt FROM people;
    +---------------------+
    | birthdt             |
    +---------------------+
    | 1983-11-11 10:07:35 |
    | 1943-12-25 04:10:42 |
    | 2017-04-21 19:12:43 |
    +---------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
    +---------------------+-------------------------------------+
    | birthdt             | DATE_ADD(birthdt, INTERVAL 1 MONTH) |
    +---------------------+-------------------------------------+
    | 1983-11-11 10:07:35 | 1983-12-11 10:07:35                 |
    | 1943-12-25 04:10:42 | 1944-01-25 04:10:42                 |
    | 2017-04-21 19:12:43 | 2017-05-21 19:12:43                 |
    +---------------------+-------------------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
    +---------------------+---------------------------------------+
    | birthdt             | DATE_ADD(birthdt, INTERVAL 10 SECOND) |
    +---------------------+---------------------------------------+
    | 1983-11-11 10:07:35 | 1983-11-11 10:07:45                   |
    | 1943-12-25 04:10:42 | 1943-12-25 04:10:52                   |
    | 2017-04-21 19:12:43 | 2017-04-21 19:12:53                   |
    +---------------------+---------------------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;                                                                     
    +---------------------+---------------------------------------+
    | birthdt             | DATE_ADD(birthdt, INTERVAL 3 QUARTER) |
    +---------------------+---------------------------------------+
    | 1983-11-11 10:07:35 | 1984-08-11 10:07:35                   |
    | 1943-12-25 04:10:42 | 1944-09-25 04:10:42                   |
    | 2017-04-21 19:12:43 | 2018-01-21 19:12:43                   |
    +---------------------+---------------------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
    +---------------------+----------------------------+
    | birthdt             | birthdt + INTERVAL 1 MONTH |
    +---------------------+----------------------------+
    | 1983-11-11 10:07:35 | 1983-12-11 10:07:35        |
    | 1943-12-25 04:10:42 | 1944-01-25 04:10:42        |
    | 2017-04-21 19:12:43 | 2017-05-21 19:12:43        |
    +---------------------+----------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;                                                                                
    +---------------------+----------------------------+
    | birthdt             | birthdt - INTERVAL 5 MONTH |
    +---------------------+----------------------------+
    | 1983-11-11 10:07:35 | 1983-06-11 10:07:35        |
    | 1943-12-25 04:10:42 | 1943-07-25 04:10:42        |
    | 2017-04-21 19:12:43 | 2016-11-21 19:12:43        |
    +---------------------+----------------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;                                                            
    +---------------------+------------------------------------------------+
    | birthdt             | birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR |
    +---------------------+------------------------------------------------+
    | 1983-11-11 10:07:35 | 1985-02-11 20:07:35                            |
    | 1943-12-25 04:10:42 | 1945-03-25 14:10:42                            |
    | 2017-04-21 19:12:43 | 2018-07-22 05:12:43                            |
    +---------------------+------------------------------------------------+
    3 rows in set (0.00 sec)

**********************************************************


### [TIMESTAMPS](https://dev.mysql.com/doc/refman/5.5/en/datetime.html)

- TIMESTAMP has a range of '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC.
- Not ideal for saving birthdates, as it is limited
- Best used when saving once something was created or modified
- TIMESTAMPS use up less space

------------------------------------------------------------

    mysql> CREATE TABLE comments(
        ->  content VARCHAR(100),
        ->  created_at TIMESTAMP DEFAULT NOW()
        -> );
    Query OK, 0 rows affected (0.02 sec)

    mysql> INSERT INTO comments(content) VALUES ("LOL, I'm starting to get delirious from all this code");                                        
    Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM comments ORDER BY created_at;
    +-------------------------------------------------------+---------------------+
    | content                                               | created_at          |
    +-------------------------------------------------------+---------------------+
    | LOL, I'm starting to get delirious from all this code | 2019-04-11 21:38:46 |
    | OH PLEASE GOD, IS IT OVER YET?!?!?!                   | 2019-04-11 21:43:30 |
    +-------------------------------------------------------+---------------------+
    2 rows in set (0.01 sec)

    mysql> SELECT * FROM comments ORDER BY created_at DESC;
    +-------------------------------------------------------+---------------------+
    | content                                               | created_at          |
    +-------------------------------------------------------+---------------------+
    | OH PLEASE GOD, IS IT OVER YET?!?!?!                   | 2019-04-11 21:43:30 |
    | LOL, I'm starting to get delirious from all this code | 2019-04-11 21:38:46 |
    +-------------------------------------------------------+---------------------+
    2 rows in set (0.00 sec)

    mysql> CREATE TABLE comments2(
        ->  content VARCHAR(100),
        ->  changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
        -> );
    Query OK, 0 rows affected (0.01 sec)

    mysql> INSERT INTO comments2 (content) VALUES ('dammit Sadie');
    Query OK, 1 row affected (0.01 sec)

    mysql> INSERT INTO comments2 (content) VALUES ('Soooooo damn tired');
    Query OK, 1 row affected (0.02 sec)

    mysql> SELECT * FROM comments2;
    +--------------------+---------------------+
    | content            | changed_at          |
    +--------------------+---------------------+
    | dammit Sadie       | 2019-04-11 21:46:19 |
    | Soooooo damn tired | 2019-04-11 21:46:38 |
    +--------------------+---------------------+
    2 rows in set (0.00 sec)

    mysql> INSERT INTO comments2 (content) VALUES ('Aaaaaarrrrrgh');
    Query OK, 1 row affected (0.01 sec)

    mysql> SELECT * FROM comments2;
    +--------------------+---------------------+
    | content            | changed_at          |
    +--------------------+---------------------+
    | dammit Sadie       | 2019-04-11 21:46:19 |
    | Soooooo damn tired | 2019-04-11 21:46:38 |
    | Aaaaaarrrrrgh      | 2019-04-11 21:47:18 |
    +--------------------+---------------------+
    3 rows in set (0.00 sec)

    mysql> UPDATE comments2 SET content='GODDAMMIT SADIE!!!' WHERE content='dammit Sadie';
    Query OK, 1 row affected (0.01 sec)
    Rows matched: 1  Changed: 1  Warnings: 0

    mysql> SELECT * FROM comments2;
    +--------------------+---------------------+
    | content            | changed_at          |
    +--------------------+---------------------+
    | GODDAMMIT SADIE!!! | 2019-04-11 21:48:29 |
    | Soooooo damn tired | 2019-04-11 21:46:38 |
    | Aaaaaarrrrrgh      | 2019-04-11 21:47:18 |
    +--------------------+---------------------+
    3 rows in set (0.00 sec)

    mysql> SELECT * FROM comments2 ORDER BY changed_at;
    +--------------------+---------------------+
    | content            | changed_at          |
    +--------------------+---------------------+
    | Soooooo damn tired | 2019-04-11 21:46:38 |
    | Aaaaaarrrrrgh      | 2019-04-11 21:47:18 |
    | GODDAMMIT SADIE!!! | 2019-04-11 21:48:29 |
    +--------------------+---------------------+
    3 rows in set (0.01 sec)

************************************************
#### EXERCISES
************************************************

- What is a good use case for CHAR?

-----------------------------------------

    - For situations where you know the text will have a fixed length

----------------------------------------------------------
- CREATE TABLE inventory(item_name _________, price __________, quantity _______);

-----------------------------------------------------------

    mysql> CREATE TABLE inventory(
        item_name VARCHAR(100),
        price DECIMAL(8,2),
        quantity INT
    );

-----------------------------------------------
- Dfference between DATETIME and TIMESTAMP?

-----------------------------------------------

    - DATETIME does not have a specific range, it is best for logging things like birthdate
    - TIMESTAMP is limited in it's range, and best used for documenting creation & modification of content

------------------------------------
- Print out just the current time

----------------------------------

    mysql> SELECT CURTIME();
    +-----------+
    | CURTIME() |
    +-----------+
    | 22:04:14  |
    +-----------+
    1 row in set (0.00 sec)

---------------------------------------
- Print out just the current date

---------------------------------------------------

    mysql> SELECT CURDATE();
    +------------+
    | CURDATE()  |
    +------------+
    | 2019-04-11 |
    +------------+
    1 row in set (0.00 sec)

-------------------------------------------
- Print out the current # day of the week

-------------------------------------------

    SELECT DATE_FORMAT('2019-04-11', '%w');
    +---------------------------------+
    | DATE_FORMAT('2019-04-11', '%w') |
    +---------------------------------+
    | 4                               |
    +---------------------------------+
    1 row in set (0.00 sec)

----------------------------------------------
- Print out the current name day of the week

--------------------------------------------------

    mysql> SELECT DATE_FORMAT('2019-04-11', '%W');
    +---------------------------------+
    | DATE_FORMAT('2019-04-11', '%W') |
    +---------------------------------+
    | Thursday                        |
    +---------------------------------+
    1 row in set (0.00 sec)

----------------------------------------------
- Print out the current day & time using mm/dd/yyyy

------------------------------------------------

    mysql> SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');                                                                                            
    +------------------------------------+
    | DATE_FORMAT(CURDATE(), '%m/%d/%Y') |
    +------------------------------------+
    | 04/11/2019                         |
    +------------------------------------+
    1 row in set (0.01 sec)

----------------------------------------------
- Print out the current day & time using format: January 2nd at 3:15, April 1st at 10:18

-------------------------------------------------

    mysql> SELECT DATE_FORMAT(CURDATE(), '%M %D at %I:%i');
    +------------------------------------------+
    | DATE_FORMAT(CURDATE(), '%M %D at %I:%i') |
    +------------------------------------------+
    | April 11th at 10:10                      |
    +------------------------------------------+
    1 row in set (0.00 sec)

----------------------------------------------
- Create a tweets table that stores:
    - The tweet content
    - A Username
    - Time it was created

-------------------------------------------------

    CREATE TABLE tweets(
        content VARCHAR(280),
        username VARCHAR(20),
        created_at TIMESTAMP DEFAULT NOW()
    );
    
***************************************************************************

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

****************************************************

## Node.js

****************************************************

### [MySQL & Other Languages](http://webdev.slides.com/coltsteele/mysql-105#/)

***MySQL works with the following***
    - [PHP](https://www.php.net)
    - [Node](https://nodejs.org/en/)
    - [Ruby](https://www.ruby-lang.org/en/)
    - [C#](https://docs.microsoft.com/en-us/dotnet/csharp/)
    - [C++](http://www.cplusplus.com)
    - [Java](https://www.java.com/en/)
    - [Python](https://www.python.org)

***How does Node talk with MySQL***
    - When navigating to a website
    - A request is made through NodeJS, PHP, etc
    - The code then communicates with the MySQL DB
    - A result then comes back to the programming language
    - The programming language then complies the information in the form of a website and sends back to the client

****************************************************

### What about PHP

***Why using NodeJS instead of PHP***
    - [StackOverflow Developer Survey](https://insights.stackoverflow.com/survey/2019)

****************************************************

### Introduction to JOIN US app

- Startup Mailing List Application

****************************************************

### Setting up AWS Node environment

- Opened Cloud9 console in AWS
- Created new environment
- Install [Node into AWS](https://medium.com/@nishankjaintdk/setting-up-a-node-js-app-on-a-linux-ami-on-an-aws-ec2-instance-with-nginx-59cbc1bcc68c)
- Install [MySQL into AWS](https://support.rackspace.com/how-to/installing-mysql-server-on-ubuntu/)

--------------------------------------------

    ubuntu:~/environment (master) $ npm init
    This utility will walk you through creating a package.json file.
    It only covers the most common items, and tries to guess sensible defaults.

    See `npm help json` for definitive documentation on these fields
    and exactly what they do.

    Use `npm install <pkg>` afterwards to install a package and
    save it as a dependency in the package.json file.

    Press ^C at any time to quit.
    package name: (environment) 
    version: (1.0.0) 
    description: NodeJS & MySQL
    entry point: (app.js) 
    test command: 
    git repository: 
    keywords: 
    author: Kristofer Fonagy
    license: (ISC) 
    About to write to /home/ubuntu/environment/package.json:

    {
      "name": "environment",
      "version": "1.0.0",
      "description": "NodeJS & MySQL",
      "main": "app.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "Kristofer Fonagy",
      "license": "ISC"
    }


    Is this OK? (yes) 

    ubuntu:~/environment (master) $ node --version
    v12.0.0

    ubuntu:~/environment (master) $ nvm install node
    Downloading https://nodejs.org/dist/v12.0.0/node-v12.0.0-linux-x64.tar.xz...
    ################################################################################################################################################################## 100.0%
    Now using node v12.0.0 (npm v6.9.0)

    ubuntu:~/environment (master) $ sudo apt-get update
    Hit:1 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic InRelease
    Get:2 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]   
    Get:3 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB] 
    Get:4 https://download.docker.com/linux/ubuntu bionic InRelease [64.4 kB]                                           
    Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]                                         
    Get:6 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [592 kB]
    Get:7 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/main Translation-en [218 kB]            
    Get:8 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [863 kB]                       
    Get:9 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [262 kB]             
    Get:10 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [325 kB]                                  
    Get:11 http://security.ubuntu.com/ubuntu bionic-security/main Translation-en [117 kB]
    Get:12 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [241 kB]
    Get:13 http://security.ubuntu.com/ubuntu bionic-security/universe Translation-en [138 kB]
    Fetched 3072 kB in 2s (1922 kB/s)       
    Reading package lists... Done

    ubuntu:~/environment (master) $ sudo apt-get install mysql-server
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    mysql-server is already the newest version (5.7.25-0ubuntu0.18.04.2).
    The following packages were automatically installed and are no longer required:
      gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libuv1-dev node-abbrev node-ansi
      node-ansi-color-table node-archy node-async node-balanced-match node-block-stream node-brace-expansion node-builtin-modules node-combined-stream node-concat-map
      node-cookie-jar node-delayed-stream node-forever-agent node-form-data node-fs.realpath node-fstream node-fstream-ignore node-github-url-from-git node-glob
      node-graceful-fs node-hosted-git-info node-inflight node-inherits node-ini node-is-builtin-module node-isexe node-json-stringify-safe node-lockfile node-lru-cache
      node-mime node-minimatch node-mkdirp node-mute-stream node-node-uuid node-nopt node-normalize-package-data node-npmlog node-once node-osenv node-path-is-absolute
      node-pseudomap node-qs node-read node-read-package-json node-request node-retry node-rimraf node-semver node-sha node-slide node-spdx-correct
      node-spdx-expression-parse node-spdx-license-ids node-tar node-tunnel-agent node-underscore node-validate-npm-package-license node-which node-wrappy node-yallist
      nodejs nodejs-doc
    Use 'sudo apt autoremove' to remove them.
    0 upgraded, 0 newly installed, 0 to remove and 27 not upgraded.

    ubuntu:~/environment (master) $ mysql --version
    mysql  Ver 14.14 Distrib 5.7.25, for Linux (x86_64) using  EditLine wrapper

***************************************************

### Faker Install

- Steps to install [Faker](https://github.com/marak/Faker.js/) npm


-------------------------------------

    ubuntu:~/environment (master) $ npm install faker
    npm notice created a lockfile as package-lock.json. You should commit this file.
    npm WARN environment@1.0.0 No repository field.

    + faker@4.1.0
    added 1 package from 1 contributor and audited 1 package in 0.972s
    found 0 vulnerabilities

*******************************************

### MySQL Package

- [MySQL Node Package Github Repo](https://github.com/mysqljs/mysql)

-----------------------------------------

    ubuntu:~/environment (master) $ npm install mysql
    npm WARN environment@1.0.0 No repository field.

    + mysql@2.17.1
    added 9 packages from 14 contributors and audited 136 packages in 6.088s
    found 0 vulnerabilities

    ubuntu:~/environment (master) $ npm install mysqljs/mysql
    npm WARN environment@1.0.0 No repository field.

    + mysql@2.17.1
    updated 1 package and audited 136 packages in 2.714s
    found 0 vulnerabilities

    ubuntu:~/environment (master) $ sudo systemctl start mysql
    ubuntu:~/environment (master) $ sudo systemctl enable mysql
    Synchronizing state of mysql.service with SysV service script with /lib/systemd/systemd-sysv-install.
    Executing: /lib/systemd/systemd-sysv-install enable mysql
    ubuntu:~/environment (master) $ sudo /usr/bin/mysql -u root -p
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    Server version: 5.7.25-0ubuntu0.18.04.2 (Ubuntu)

    Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> 

********************************************

### Connecting Node to MySQL

-----------------------------------------





























