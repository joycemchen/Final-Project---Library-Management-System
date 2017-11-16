CREATE DATABASE Library_Management_System;
USE Library_Management_System;

		--PUBLISHER TABLE--

CREATE TABLE tbl_PUBLISHERS (
	PublisherId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL, 
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
); 
INSERT INTO tbl_PUBLISHERS
		(Name, [Address], Phone)
		VALUES 
		('Chronicle Books, LLC', 'SF, CA', '415-001-0000'),
		('City Lights Publishing','SF, CA','415-002-0000'),
		('Drunken Boat','SF, CA','415-003-0000'),
		('Fair Oaks Press','SF, CA','415-004-0000'),
		('Baker Street Books','SF, CA','415-005-0000'),
		('Arcadia Publishing','SF, CA','415-006-0000'),
		('Citizen Assembly Press','SF, CA','415-007-0000'),
		('CRJ Publishing, LLC','SF, CA','415-008-0000'),
		('Harpercollins Publishers LLC','SF, CA','415-009-0000'),
		('Macavelli Press','SF, CA','415-010-0000'),
		('Telegraph Hill Press','SF, CA','415-011-0000'),
		('Woodbury Press','SF, CA','415-012-0000'),
		('Must See Books','SF, CA','415-013-0000'),
		('Peachpit Press','SF, CA','415-014-0000'),
		('Resonance House Publishing','SF, CA','415-015-0000'),
		('Saber Publishing','SF, CA','415-016-0000'),
		('School Wise Press','SF, CA','415-017-0000'),
		('Survival Series Publishing Company','SF, CA','415-018-0000'),
		('Shadbolt Press','SF, CA','415-019-0000'),
		('Silverback Books Inc','SF, CA','415-020-0000')
;
Select * from tbl_PUBLISHERS;

		--END PUBLISHER TABLE

		--BOOK TABLE

CREATE TABLE tbl_BOOK (
	BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName INT NOT NULL CONSTRAINT fk_PublisherId FOREIGN KEY REFERENCES tbl_PUBLISHERS(PublisherId) ON UPDATE CASCADE ON DELETE CASCADE
);
INSERT INTO tbl_BOOK
		(Title, PublisherName)
		VALUES 
		('Harry Potter and the Sorcerers Stone',1),
		('The Cat in the Hat',2),
		('Harry Potter and the Prisoner of Azkaban',3),
		('Fahrenheit 451',4),
		('Animal Farm',5),
		('Enders Game',6),
		('The Giver',7),
		('The Hunger Games',8),
		('The Five People You Meet in Heaven',9),
		('The Perks of Being a Wallflower',10),
		('Night of the Living Dummy',11),
		('The Hobbit',12),
		('A Wrinkle in Time',13),
		('The Family Under the Bridge',14),
		('A Series of Unfortunate Events: The Hostile Hospital',15),
		('A Series of Unfortunate Events: The Carnivorous Carnival',16),
		('A Series of Unfortunate Events: The Slippery Slope',17),
		('A Series of Unfortunate Events: The Grim Grotto',18),
		('It: A Novel',19),
		('The Lost Tribe',20)
;
select * FROM tbl_BOOK;
		--END BOOKS TABLE

		--START AUTHORS
CREATE TABLE tbl_BOOK_AUTHORS (
	BookId INT NOT NULL PRIMARY KEY CONSTRAINT fk_BookId FOREIGN KEY REFERENCES tbl_BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO tbl_BOOK_AUTHORS
		(BookId,AuthorName)
		VALUES 
		(1,'JK Rowling'),
		(2,'Dr Seuss'),
		(3,'JK Rowling'),
		(4,'Ray Brabury'),
		(5,'George Orwell'),
		(6,'Orson Scott Card'),
		(7,'Lois Lowry'),
		(8,'Suzanne Collins'),
		(9,'Mitch Albom'),
		(10,'Stephen Chbosky'),
		(11,'R.L. Stine'),
		(12,'J. R. R. Tolkien'),
		(13,'Madeleine LEngle'),
		(14,'Natalie Savage Carlson'),
		(15,'Lemony Snicket'),
		(16,'Lemony Snicket'),
		(17,'Lemony Snicket'),
		(18,'Lemony Snicket'),
		(19,'Stephen King'),
		(20,'Mark Lee')
;
select * from tbl_BOOK_AUTHORS;

		--END AUTHORS

		--START BRANCHES

CREATE TABLE tbl_LIBRARY_BRANCH (
	BranchId INT PRIMARY KEY NOT NULL,
	BranchName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL
);

INSERT INTO tbl_LIBRARY_BRANCH
		(BranchId, BranchName, [Address])
		VALUES
		(1,'Sharpstown','500 McKinney St. Houston TX 77002'),
		(2,'Central','330 Park Blvd. San Diego CA 92101'),
		(3,'Main','100 Larkin St. San Francisco CA 94102'),
		(4,'Lincoln Park','1150 W Fullerton Ave. Chicago IL 60614')
;

select * from tbl_LIBRARY_BRANCH;

		--END BRANCHES

		--START BORROWERS

CREATE TABLE tbl_BORROWERS (
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL, 
	Phone VARCHAR(50) NOT NULL
);
INSERT INTO tbl_BORROWERS
		(CardNo, Name, [Address], Phone)
		VALUES
		(1989,'Beyonce Knowles','Houston TX','281.000.0002'),
		(1990,'Patrick Swayze','Houston TX','281.000.0001'),
		(2001,'Nick Cannon','San Diego CA','858.000.0001'),
		(2002,'Kris Jenner','San Diego CA','858.000.0002'),
		(1995,'Robin Williams','San Francisco CA','415.000.0001'),
		(1996,'Bruce Lee','San Francisco CA','415.000.0002'),
		(2004,'Harrison Ford','Chicago IL','312.000.0001'),
		(2005,'Ben Savage','Chicago IL','312.000.0002')
;
select * from tbl_BORROWERS;

		--END BORROWERS


		--START COPIES


CREATE TABLE tbl_BOOK_COPIES (
	BookId INT NOT NULL CONSTRAINT fk_BookId_2 FOREIGN KEY REFERENCES tbl_BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_1 FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
	);

INSERT INTO tbl_BOOK_COPIES
		(BookId, BranchID, No_Of_Copies)
		VALUES
		(1,1,2),
		(2,1,2),
		(3,1,2),
		(4,1,2),
		(5,1,2),
		(6,1,2),
		(7,1,2),
		(8,1,2),
		(9,1,2),
		(10,1,2),
		(20,1,2),
		(1,2,2),
		(2,2,2),
		(3,2,2),
		(4,2,2),
		(5,2,2),
		(6,2,2),
		(7,2,2),
		(8,2,2),
		(9,2,2),
		(10,2,2),
		(20,2,2),
		(11,3,2),
		(12,3,2),
		(13,3,2),
		(14,3,2),
		(15,3,2),
		(16,3,2),
		(17,3,2),
		(18,3,2),
		(19,3,2),
		(20,3,2),
		(11,4,2),
		(12,4,2),
		(13,4,2),
		(14,4,2),
		(15,4,2),
		(16,4,2),
		(17,4,2),
		(18,4,2),
		(19,4,2),
		(10,3,2)
;
select * from tbl_BOOK_COPIES;

		--END BOOK_COPIES

		--START BOOK_LOANS
		

CREATE TABLE tbl_BOOK_LOANS (
	BookId INT NOT NULL CONSTRAINT fk_BookId_1 FOREIGN KEY REFERENCES tbl_BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchId_2 FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE, 
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_BORROWERS(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

INSERT INTO tbl_BOOK_LOANS
		(BookId, BranchID, CardNo, DateOut, DueDate)
		VALUES
		(1,1,1989,'11-01-2017','12-05-2017'),
		(2,1,1989,'11-01-2017','12-05-2017'),
		(3,1,1989,'11-01-2017','12-05-2017'),
		(4,1,1989,'11-01-2017',GETDATE()),
		(5,1,1989,'11-01-2017',GETDATE()),
		(6,1,1989,'11-01-2017','12-05-2017'),
		(7,1,1989,'11-01-2017','12-05-2017'),
		(8,1,1989,'11-01-2017','12-05-2017'),
		(9,1,1989,'11-01-2017','12-05-2017'),
		(10,1,1989,'11-01-2017','12-05-2017'),
		(20,1,1989,'11-01-2017','12-05-2017'),
		(1,1,1990,'11-01-2017','12-05-2017'),
		(2,1,1990,'11-01-2017','12-05-2017'),
		(3,1,1990,'11-01-2017','12-05-2017'),
		(4,1,1990,'11-01-2017',GETDATE()),
		(5,1,1990,'11-01-2017',GETDATE()),
		(6,1,1990,'11-01-2017','12-05-2017'),
		(7,1,1990,'11-01-2017','12-05-2017'),
		(8,1,1990,'11-01-2017','12-05-2017'),
		(9,1,1990,'11-01-2017','12-05-2017'),
		(10,1,1990,'11-01-2017','12-05-2017'),
		(20,1,1990,'11-01-2017','12-05-2017'),
		(1,2,2001,'11-01-2017','12-05-2017'),
		(2,2,2001,'11-01-2017','12-05-2017'),
		(3,2,2001,'11-01-2017','12-05-2017'),
		(4,2,2001,'11-01-2017',GETDATE()),
		(5,2,2001,'11-01-2017',GETDATE()),
		(6,2,2001,'11-01-2017','12-05-2017'),
		(5,2,2002,'11-01-2017','12-05-2017'),
		(6,2,2002,'11-01-2017','12-05-2017'),
		(7,2,2002,'11-01-2017','12-05-2017'),
		(8,2,2002,'11-01-2017',GETDATE()),
		(9,2,2002,'11-01-2017',GETDATE()),
		(10,2,2002,'11-01-2017','12-05-2017'),
		(11,3,1995,'11-01-2017','12-05-2017'),
		(12,3,1995,'11-01-2017','12-05-2017'),
		(13,3,1995,'11-01-2017','12-05-2017'),
		(14,3,1995,'11-01-2017','12-05-2017'),
		(15,3,1995,'11-01-2017','12-05-2017'),
		(16,3,1995,'11-01-2017','12-05-2017'),
		(17,3,1995,'11-01-2017','12-05-2017'),
		(18,3,1995,'11-01-2017','12-05-2017'),
		(11,4,1996,'11-01-2017','12-05-2017'),
		(12,4,1996,'11-01-2017','12-05-2017'),
		(13,4,1996,'11-01-2017','12-05-2017'),
		(14,4,1996,'11-01-2017','12-05-2017'),
		(15,4,1996,'11-01-2017','12-05-2017'),
		(16,4,1996,'11-01-2017','12-05-2017'),
		(17,4,2004,'11-01-2017','12-05-2017'),
		(18,4,2004,'11-01-2017','12-05-2017')
;
select * from tbl_BOOK_LOANS;

		--END BOOK_LOANS
		

		--1

CREATE PROCEDURE dbo.spTheLostTribe_in_Sharpstown
AS
SELECT tbl_BOOK.Title AS 'Title', tbl_LIBRARY_BRANCH.BranchName AS 'Branch', tbl_BOOK_COPIES.No_of_copies AS 'Number of copies'  
FROM tbl_BOOK_COPIES INNER JOIN tbl_LIBRARY_BRANCH 
ON tbl_LIBRARY_BRANCH.BranchId = tbl_BOOK_COPIES.BranchID
INNER JOIN tbl_BOOK
ON tbl_BOOK_COPIES.BookId = tbl_BOOK.BookId
WHERE tbl_BOOK.Title = 'The Lost Tribe'  and tbl_LIBRARY_BRANCH.BranchName = 'Sharpstown'


		--2

CREATE PROCEDURE dbo.spNoOfCopies_TheLostTribe
AS
SELECT tbl_BOOK.Title AS 'Title', tbl_LIBRARY_BRANCH.BranchName AS 'Branch', tbl_BOOK_COPIES.No_of_copies AS 'Number of copies'  
FROM tbl_BOOK_COPIES INNER JOIN tbl_LIBRARY_BRANCH 
ON tbl_BOOK_COPIES.BranchID = tbl_LIBRARY_BRANCH.BranchId
INNER JOIN tbl_BOOK
ON tbl_BOOK_COPIES.BookId = tbl_BOOK.BookId
WHERE tbl_BOOK.title = 'The Lost Tribe'  


		--3

CREATE PROCEDURE dbo.spBorrowers_with_no_books
AS
SELECT tbl_BORROWER.Name
FROM tbl_BORROWER 
WHERE NOT EXISTS ( SELECT *
FROM tbl_BOOK_LOANS 
WHERE tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo )

		--4

CREATE PROCEDURE dbo.spDueToday_at_Sharpstown
AS
DECLARE @today AS DATE
SET @today = GETDATE() 
SELECT tbl_BOOK.Title, tbl_BORROWER.Name, tbl_BORROWER.[Address]
FROM tbl_BOOK, tbl_BORROWER, tbl_BOOK_LOANS, tbl_LIBRARY_BRANCH
WHERE tbl_LIBRARY_BRANCH.BranchName = 'Sharpstown' AND tbl_LIBRARY_BRANCH.BranchId = tbl_BOOK_LOANS.BranchId AND
tbl_BOOK_LOANS.DueDate = @today AND tbl_BOOK_LOANS.CardNo=tbl_BORROWER.CardNo AND tbl_BOOK_LOANS.BookId=tbl_BOOK.BookId

		--5


CREATE PROCEDURE dbo.spTotal#ofbooksloaned
AS
SELECT tbl_LIBRARY_BRANCH.BranchName, COUNT(*) AS 'Total# of Books Loaned Out'
FROM tbl_BOOK_COPIES, tbl_LIBRARY_BRANCH 
WHERE tbl_BOOK_COPIES.BranchId = tbl_LIBRARY_BRANCH.BranchId
GROUP BY tbl_LIBRARY_BRANCH.BranchName

		--6

CREATE PROCEDURE dbo.spborrowers_morethan5books
AS
SELECT tbl_BORROWER.Name, tbl_BORROWER.[Address], COUNT(*) AS 'Total# of Books Checked Out'
FROM tbl_BORROWER, tbl_BOOK_LOANS
WHERE tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo
GROUP BY tbl_BORROWER.Name, tbl_BORROWER.[Address]
HAVING COUNT(*) > 5


		--7

CREATE PROCEDURE dbo.sp#ofStephenKingBook_in_Central
AS
SELECT tbl_BOOK.Title AS 'Title', tbl_LIBRARY_BRANCH.BranchName AS 'Branch', tbl_BOOK_COPIES.No_of_copies AS 'Number of copies'
FROM tbl_BOOK_COPIES INNER JOIN tbl_LIBRARY_BRANCH 
ON tbl_LIBRARY_BRANCH.BranchId = tbl_BOOK_COPIES.BranchID 
INNER JOIN tbl_BOOK
ON tbl_BOOK_COPIES.BookId = tbl_BOOK.BookId
INNER JOIN tbl_BOOK_AUTHORS
ON tbl_BOOK_AUTHORS.BookId=tbl_BOOK.BookId
WHERE tbl_LIBRARY_BRANCH.BranchName = 'Central' AND tbl_BOOK_AUTHORS.AuthorName = 'Stephen King'
