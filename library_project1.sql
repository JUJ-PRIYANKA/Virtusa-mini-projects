DROP DATABASE IF EXISTS library1_db;
CREATE DATABASE library1_db;
USE library1_db;

CREATE TABLE Students_1(
    Studentid INT PRIMARY KEY,
    Name VARCHAR(100),
    JoinedDate DATE
);

CREATE TABLE Books_1(
    Bookid INT PRIMARY KEY,
    Title VARCHAR(100),
    Category VARCHAR(100)
);


CREATE TABLE BooksIssued(
    Issueid INT PRIMARY KEY,
    Studentid INT,
    Bookid INT,
    IssuedDate DATE,
    ReturnDate DATE,
    FOREIGN KEY(Studentid) REFERENCES Students_1(Studentid),
    FOREIGN KEY(Bookid) REFERENCES Books_1(Bookid)
);

INSERT INTO Books_1 VALUES
(1, 'JAVA', 'PROGRAMMING'),
(2,'PYTHON', 'PROGRAMMING'),
(3, 'SQL', 'DATABASE'),
(4,'ED','DRAWING');

INSERT INTO Students_1 VALUES
(101, 'Ravi', '2022-01-10'),
(102, 'Priya', '2021-06-15'),
(103, 'Kiran', '2020-03-20');

INSERT INTO BooksIssued VALUES
(1, 101, 1 , '2026-02-01', '2026-03-01'),
(2, 102, 2 , '2026-05-10', NULL),
(3, 103, 3 , '2026-04-20', NULL),
(4, 101, 1, '2026-04-01', NULL),
(5, 102, 1, '2026-04-05', NULL),
(6, 103, 2, '2026-04-07', NULL);

SELECT* FROM Books_1;
SELECT* FROM Students_1;
SELECT*FROM BooksIssued;

SELECT s.Name, b.Title, I.IssuedDate
FROM BooksIssued i
JOIN Students_1 s ON i.Studentid = s.Studentid
JOIN Books_1 b ON i.Bookid = b.Bookid
WHERE i.ReturnDate IS NULL
AND DATEDIFF(CURDATE(), i.IssuedDate) >14;

SELECT Category, COUNT(*) AS Totalborrowed
FROM Books_1 b
JOIN BooksIssued i ON b.Bookid = i.Bookid
GROUP BY Category
ORDER BY Totalborrowed DESC;
