# WHAT IS SQL
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

#### MySQL

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

## TABLES

- Heart of SQL
- A db is just a bunch of tables

***************************************************

##### Data Types


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

##### INT

    - A whole number
    - Nax value 2147483647

##### VARCHAR

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
**********************
    
## CREATING DB & TABLE

    mysql> CREATE DATABASE dog_app;
    
    mysql> use dog_app;
    
    mysql> CREATE TABLE dogs (name VARCHAR(100), age INT);
    
- Now to check if tables/dbs were created


    mysql> SHOW TABLES;
    
    mysql> SHOW COLUMNS FROM <tablename>;

- Or....


    mysql> DESC <tablename>;   

- Though not identical

**********************

### Deleting Tables

- To delete a table use "DROP TABLE <tablename>;"
- Create database <bakery_app>
- Use <bakery_app>
- Create the table <pasteries (name VARCHAR(50), quantity INT)>
- Desc <pasteries>
- DROP TABLE <pasteries>

*****************************************************

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

### INSERT command

- INSERT INTO dogs(name, age) VALUES ('Name', X);

******************************************

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
    
    mysql> desc dogs
        -> ;
    +-------+--------------+------+-----+---------+-------+
    | Field | Type         | Null | Key | Default | Extra |
    +-------+--------------+------+-----+---------+-------+
    | name  | varchar(100) | YES  |     | NULL    |       |
    | age   | int(11)      | YES  |     | NULL    |       |
    +-------+--------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)

*************************************

### How to check for data

    mysql> select * from dogs
        -> ;
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
    
- There is a lot more to do with SELECT command

*****************************************************

### MULTIPLE INSERT

    INSERT INTO dogs (name, age)
    VALUES ('name1',  5),
           ('name2', 3),
           ('name3', 7);
           
**********************************
      
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
    
    mysql> desc people
        -> ;
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
    
    mysql> select * from people
        -> ;
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
*********************************

## WARNINGS

- SHOW WARNINGS; - will allow you to check any warnings
- If a string is too long, it will get truncated. So the extra characters will be completely cut off
- If a string is enter in an INT field, you will receive a warning: Incorrect interger value. The INT will be saved as 0.

***********************************

## NULL and NOT_NULL

- Value is unknown
- NULL YES means it is ok that it doesn't have a value.
- The value will reflect in the table as NULL

************************************************

### HOW TO REQUIRE NOT_NULL

- CREATE TABLE dogs2 (name VARCHAR(100) NOT NULL, age INT NOT NULL);


    mysql> CREATE TABLE dogs2 (name VARCHAR(100) NOT NULL, age INT NOT NULL);
    Query OK, 0 rows affected (0.05 sec)
    
    mysql> desc dogs2
        -> ;
    +-------+--------------+------+-----+---------+-------+
    | Field | Type         | Null | Key | Default | Extra |
    +-------+--------------+------+-----+---------+-------+
    | name  | varchar(100) | NO   |     | NULL    |       |
    | age   | int(11)      | NO   |     | NULL    |       |
    +-------+--------------+------+-----+---------+-------+
    2 rows in set (0.00 sec)
    
    mysql> insert into dogs2 (name) values('Sadie');
    Query OK, 1 row affected, 1 warning (0.01 sec)
    
    mysql> show warnings
        -> ;
    +---------+------+------------------------------------------+
    | Level   | Code | Message                                  |
    +---------+------+------------------------------------------+
    | Warning | 1364 | Field 'age' doesn't have a default value |
    +---------+------+------------------------------------------+
    1 row in set (0.00 sec)
    
    mysql> select * from dogs2
        -> ;
    +-------+-----+
    | name  | age |
    +-------+-----+
    | Sadie |   0 |
    +-------+-----+
    1 row in set (0.00 sec)
    
    mysql> insert into dogs2 (age) values (3);
    Query OK, 1 row affected, 1 warning (0.01 sec)
    
    mysql> show warnings
        -> ;
    +---------+------+-------------------------------------------+
    | Level   | Code | Message                                   |
    +---------+------+-------------------------------------------+
    | Warning | 1364 | Field 'name' doesn't have a default value |
    +---------+------+-------------------------------------------+
    1 row in set (0.00 sec)
    
    mysql> desc dogs2
        -> ;
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

***********************************************

    mysql> CREATE TABLE dogs3 (name VARCHAR(50) DEFAULT 'unnamed', age INT DEFAULT 99);
    Query OK, 0 rows affected (0.02 sec)
    
    mysql> insert into dogs3 (age) values (12);
    Query OK, 1 row affected (0.01 sec)
    
    mysql> select * from dogs3
        -> ;
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

- If NOT_NULL is not enter, any variable could be entered in as NULL.

*******************************

### PRIMARY KEYS

- Primary KEY is used to ensure data is uniquely identifiable
- To help keep things unique, add a Primary Key

***********************************************

    mysql> CREATE TABLE dogs5 (dog_id INT NOT NULL, name VARCHAR(50), age INT, PRIMARY KEY (dog_id));                                           
    Query OK, 0 rows affected (0.01 sec)
    
    mysql> DESC dogs5
        -> ;
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
    
    mysql> select * from dogs5
        -> ;
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
    
    mysql> desc dogs6
        -> ;
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
    
    mysql> select * from dogs6
        -> ;
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
    
    mysql> desc employees
        -> ;
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


- COULD ALSO SET UP TABLE LIKE SO:


    create table employees(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, last_name VARCHAR(20) NOT NULL, first_name VARCHAR(20) NOT NULL, middle_int VARCHAR(1), age INT NOT NULL, current_status VARCHAR(20) NOT NULL DEFAULT 'employed');

****************************************
****************************************

## CRUD

- Create (INSERT INTO)
- Read
- Update
- Delete/Destroy

******************************************************

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
-----------------------------------------

- SELECT * FROM cats;
- "*" means select all colums from the table 'cats'

*************************************************************

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

- SELECT Expression is how we select a specific column.


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
*******************************************************

## Intro to WHERE
------------------------------------------------------

- The WHERE clause allows you to select data specifically.

************************************************************

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

- By default, case insensitive

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
***********************************************************

## Intro to ALIASES
----------------------------------

- Easier to read results

*********************************************************

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
    
    mysql> desc cats
        -> ;
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

- UPDATING RULE OF THUMB:


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
    
    mysql> 

- "DELETE FROM cats;" will delete the content, but not the tables

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

**********************************************************************************

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
    
- CONCAT_WS


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

***************************************************************************

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

******************************************************

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

- REPLACE is case sensitive


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

********************************************************

    mysql> select reverse('Hello World');
    +------------------------+
    | reverse('Hello World') |
    +------------------------+
    | dlroW olleH            |
    +------------------------+
    1 row in set (0.00 sec)

******************************************************

### CHAR_LENGTH

*****************************************************

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

***********************************************

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
    
    mysql> mysql> select distinct released_year from books;
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

### LIMIT


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

- Not as useful on it's own


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

- Example of use: used in pagination of content on the front-end
- If wanting to retreive all rows from a certain offset to the end use a random large number 
  graeter than the amount of items in the table


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

### LIKE

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

- '%' means anything, '__' means length of characters
- How to select an item if % or _ are used as a character?


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
    
    mysql> select title, author_lname from books where author_lname like '% %'
        -> ;
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
*************************************************************

### COUNT
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

- Shows the combo of both distinct fname & distinct lname


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

- Better way


    mysql> select count(*) from books where title like '%the%';                                                                                   
    +----------+
    | count(*) |
    +----------+
    |        6 |
    +----------+
    1 row in set (0.00 sec)

***********************************************************

### GROUP BY
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

- This will create a 'super row' with all of the authors books in one row


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

- This following is not really useful, as it does not distinguish if there are more than one author with the same last name


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

- Still has problem with last name, if there are multiple


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

### MIN and MAX BASICS
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

- This provides the max pages, and the first book title in the DB, which doesn't match


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

### SUBQUERIES

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

- As the previous method is actually running two queries, a faster/better way is as follows


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

### USING Min & MAX WITH GROUP BY

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
    
- If you leave off 'author_fname', then it will bunch up authors with the same last name


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

### SUM 
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

### AVG
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
    
- due to DATA TYPE, automatically includes 4 decimals, regardless if a complete number

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


- Print the number of books in the database


    mysql> SELECT COUNT(*) FROM books;
    +----------+
    | COUNT(*) |
    +----------+
    |       19 |
    +----------+
    1 row in set (0.00 sec)

- Print out how many books were released in each year


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

- Print number in stock for each released year


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

- Print out the total number of books in stock


    mysql> SELECT Sum(stock_quantity) AS 'In Stock' FROM books;
    +----------+
    | In Stock |
    +----------+
    |     2450 |
    +----------+
    1 row in set (0.00 sec)

- Find average released_year for each author


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

- Find the full name of the author who wrote the longest book


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
***************************************************************

## REVISITNG DATA TYPES

******************************************************************

### CHAR & VARCHAR


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

### DECIMAL

- DECIMAL(5,2) > 5 is the max number of total digits, 2 is how many come after decimal
- DEMICAL(M,D)
- "M" has a range of 1 to 65
- "D" has a range of 0 to 30

-----------------------------------

    mysql> use dog_app;
    
    mysql> CREATE TABLE items (price DECIMAL(5,2));
    Query OK, 0 rows affected (0.01 sec)
    
- The table inserts the value as the highest possible decimal


    mysql> INSERT INTO items(price) VALUES(7987654);
    Query OK, 1 row affected, 1 warning (0.01 sec)
    
    mysql> INSERT INTO items(price) VALUES(34.88);
    Query OK, 1 row affected (0.01 sec)
    
- The table rounds the decimal up to the next whole number


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

### FLOAT and DOUBLE

- DECIMAL data type is a fixed point type, exact
- FLOAT & DOUBLE are floating-point data types, but approximate
- FLOAT & DOUBLE are able to store larger numbers, using less space
- But, it comes at the cost of percision

-------------------------------------------------------------------------------

    Data Type   | Memory Needed | Percision Issues
    ----------------------------------------------
    FLOAT       | 4 bytes       | ~7 digits
    DOUBLE      | 8 bytes       | ~15 digits
    
- Meaning, with FLOAT: if 1000001 is stored, the last 1 might not always be 1 when we retrieve it


    Double is more percise
    
- Which is best to use: Always use DECIMAL, unless percision doesn' matter


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

## DATE, TIME, and DATETIME

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

### FORMATTING DATES
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
    
- [DATE_FORMAT()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-format)


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

-----------------------

- [DATEDIFF()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_datediff)


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
    
- [DATE_ADD()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-add)


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
    
- [DATE_SUB()](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-sub) - works on the same concept as DATE_ADD


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


### TIMESTAMPS

[TIMESTAMPS](https://dev.mysql.com/doc/refman/5.5/en/datetime.html)

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


    - For situations where you know the text will have a fixed length
    
- CREATE TABLE inventory(item_name _________, price __________, quantity _______);


    mysql> CREATE TABLE inventory(
        item_name VARCHAR(100),
        price DECIMAL(8,2),
        quantity INT
    );
        
- Dfference between DATETIME and TIMESTAMP?


    - DATETIME does not have a specific range, it is best for logging things like birthdate
    - TIMESTAMP is limited in it's range, and best used for documenting creation & modification of content
    
- Print out just the current time


    mysql> SELECT CURTIME();
    +-----------+
    | CURTIME() |
    +-----------+
    | 22:04:14  |
    +-----------+
    1 row in set (0.00 sec)
        
- Print out just the current date


    mysql> SELECT CURDATE();
    +------------+
    | CURDATE()  |
    +------------+
    | 2019-04-11 |
    +------------+
    1 row in set (0.00 sec)
    
- Print out the current # day of the week


    SELECT DATE_FORMAT('2019-04-11', '%w');
    +---------------------------------+
    | DATE_FORMAT('2019-04-11', '%w') |
    +---------------------------------+
    | 4                               |
    +---------------------------------+
    1 row in set (0.00 sec)
    
- Print out the current name day of the week


    mysql> SELECT DATE_FORMAT('2019-04-11', '%W');
    +---------------------------------+
    | DATE_FORMAT('2019-04-11', '%W') |
    +---------------------------------+
    | Thursday                        |
    +---------------------------------+
    1 row in set (0.00 sec)
    
- Print out the current day & time using mm/dd/yyyy


    mysql> SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');                                                                                            
    +------------------------------------+
    | DATE_FORMAT(CURDATE(), '%m/%d/%Y') |
    +------------------------------------+
    | 04/11/2019                         |
    +------------------------------------+
    1 row in set (0.01 sec)

- Print out the current day & time using format: January 2nd at 3:15, April 1st at 10:18


    mysql> SELECT DATE_FORMAT(CURDATE(), '%M %D at %I:%i');
    +------------------------------------------+
    | DATE_FORMAT(CURDATE(), '%M %D at %I:%i') |
    +------------------------------------------+
    | April 11th at 10:10                      |
    +------------------------------------------+
    1 row in set (0.00 sec)
    
- Create a tweets table that stores:
    - The tweet content
    - A Username
    - Time it was created


    CREATE TABLE tweets(
        content VARCHAR(280),
        username VARCHAR(20),
        created_at TIMESTAMP DEFAULT NOW()
    );
    
***************************************************************************
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
    
    mysql>





