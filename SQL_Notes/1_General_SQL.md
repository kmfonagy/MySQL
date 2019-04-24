# SQL
### This Page Of Notes Covers The Following:
    - Introduction to SQL
    - Overview & Installation of MySQL
    - Creating Databases & Tables
    - Inserting of Data into Tables
    - CRUD Commands
    - CRUD Challenges

*********************************************************

## WHAT IS SQL
    - Structured Query Language
    - SQL is the language used to interact with data in a DB
    - SQL is a relational DB

##### QUICK PREVIEW

"Find all users who are 18 or older" => SELECT * FROM Users WHERE Age >= 18;


##### Working with MySWL is primarily Writing SQL

COMMON Relational DBMS > all using SQL
- MySQL
- SQLite
- PostgesSQL
- Oracle
- Many others

#### [MySQL](https://dev.mysql.com/doc/)

    "SELECT * FROM Users WHERE Age >= 18;"

and 
            
#### PostgesSQL

    "SELECT * FROM Users WHERE Age >= 18;"

• There are slight differences in syntax
• There is an SQL Standard
• Once you learn SQL it is easy to switch between DBMS

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

*******************************************************

## [TABLES](https://dev.mysql.com/doc/refman/8.0/en/tables-table.html)

- Heart of SQL
- A db is just a bunch of tables

-----------------------------------------------------

##### [Data Types](https://dev.mysql.com/doc/refman/8.0/en/data-type-overview.html)


    Numeric         String          Date
    ==========================================
    * INT <<<       * CHAR          * DATE
    * SMALLINT      * VARCHAR <<<   * DATETIME
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

    - A whole number
    - Nax value 2147483647

##### [VARCHAR](https://dev.mysql.com/doc/refman/8.0/en/char.html)

    - A variable-length string
    - Between 1 & 255

******************************************
#### EXERCISE
******************************************

USERNAME        TWEET           LIKES
----------------------------------------
VARCHAR(15)     VARCHAR(140)    INT

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

**********************
    
## CREATING [DB](https://dev.mysql.com/doc/refman/8.0/en/create-database.html) & [TABLE](https://dev.mysql.com/doc/refman/8.0/en/create-table.html)

    mysql> CREATE DATABASE dog_app;

    mysql> use dog_app;

    mysql> CREATE TABLE dogs (name VARCHAR(100), age INT);
    
***Now to check if tables/dbs were created***

    mysql> SHOW TABLES;

    mysql> SHOW COLUMNS FROM <tablename>;

***Or....***

    mysql> DESC <tablename>;   

***Though not identical***

**********************

### [Deleting Tables](https://dev.mysql.com/doc/refman/8.0/en/delete.html)

- To delete a table use "DROP TABLE <tablename>;"
- Create database <bakery_app>
- Use <bakery_app>
- Create the table <pasteries (name VARCHAR(50), quantity INT)>
- Desc <pasteries>
- DROP TABLE <pasteries>

------------------------------------------------

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