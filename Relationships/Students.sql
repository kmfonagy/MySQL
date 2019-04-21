-- EXERCISE --

INSERT INTO students (first_name)
VALUES  ('Caleb'),
        ('Samantha'),
        ('Raj'),
        ('Carlos'),
        ('Lisa');

INSERT INTO papers (student_id, title, grade)
VALUES  (1, 'My First Book Report', 60),
        (1, 'My Second Book Report', 75),
        (2, 'Russian Lit Through The Ages', 94),
        (2, 'De Montaigne and The Art of the Essay', 98),
        (4, 'Borges and Magical Realism', 89);

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id)
        REFERENCES students(id)
        ON DELETE CASCADE
);

SELECT first_name AS Student, IFNULL(title, 'Missing') as Paper, IFNULL(grade, 0) as Grade FROM students
LEFT JOIN papers
    ON students.id=papers.student_id;

SELECT first_name AS Student, IFNULL(AVG(grade), 0) AS Grade,
    CASE
        WHEN AVG(grade) >= 75 THEN 'Passing'
        ELSE 'Failing'
    END AS 'Passing/Failing' FROM students
LEFT JOIN papers
    ON students.id=papers.student_id
GROUP BY students.id
ORDER BY Grade DESC;
