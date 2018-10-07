CREATE DATABASE db_LibraryMS_1;

Use db_LibraryMS_1;


/**Create Schema**/

Create Table tbl_Library_Branch (
	LB_BranchID Int Primary Key Not Null Identity (1,1),
	LB_BranchName Varchar(50) Not Null,
	LB_Address Varchar(50) Not Null
);


Create Table tbl_Publisher (
	Pub_PublisherName Varchar(50) Primary Key Not Null,
	Pub_Address Varchar(50) Not Null,
	Pub_Phone Varchar(50) Not Null
);


Create Table tbl_Books (
	Books_BooksID Varchar(50) Primary Key Not Null,
	Books_Title Varchar(50) Not Null,
	Books_PublisherName Varchar(50) Not Null
);


Create Table tbl_Book_Authors (
	BA_BookID Varchar(50) Primary Key Not Null,
	BA_AuthorName Varchar(50)
);


Create Table tbl_Borrower (
	Bor_CardNo Int Primary Key Not Null Identity (1100,15),
	Bor_Name VarChar(50) Not Null,
	Bor_Address VarChar(50) Not Null,
	Bor_Phone VarChar(50) Not Null
);



Create Table tbl_Book_Copies (
	BC_BookID Varchar(50) Not Null Constraint fk_Books_BookID Foreign Key References tbl_Books(Books_BooksID) On Update Cascade On Delete Cascade,
	BC_BranchID Int Not Null Constraint fk_LB_BranchID Foreign Key References tbl_Library_Branch(LB_BranchID) On Update Cascade On Delete Cascade,
	BC_Number_of_Copies Int Not Null	
);



Create Table tbl_Book_Loans (
	BL_BookID Varchar(50) Not Null Constraint fk_Books_BooksID Foreign Key References tbl_Books(Books_BooksID) On Update Cascade On Delete Cascade,
	BL_BranchID INT Not Null Constraint fk_BC_BranchID Foreign Key References tbl_Library_Branch(LB_BranchID),
	BL_CardNo INT Not Null Constraint fk_Bor_CardNo Foreign Key References tbl_Borrower(Bor_CardNo) On Update Cascade On Delete Cascade,
	BL_DateOut Date Not Null ,
	BL_DateDue Date Not Null
);




/**Insert Data into Library**/
/**Table Library Branch**/

Insert Into tbl_Library_Branch 
	(LB_BranchName, LB_Address)
	Values
	('Sharpstown', '123 Ft Harrison'),
	('Central', '1 Main St'),
	('Westside', '49283 Tigard'),
	('Beach', '30 Seaside'),
	('LakeO', '19820 Hilltop Rd'),
	('Oak Grove', '13579 Mclouhlign');
	

/**table Publisher**/

Insert Into tbl_Publisher
	(Pub_PublisherName, Pub_Address, Pub_Phone)
	Values
	('Penguin Random House', '6750 SW franklin St', '503-968-6777'),
	('HarperCollins', '6665 W Hampton St #100', '503-639-3113'),
	('Macmillan', '2 Main St', '541-654-4184'),
	('Simon & Schuster', '3200 Salem St', '541-445-6879'),
	('Notes', '16406 NE 35th St', '800-607-6195');


/**Table Books**/

Insert Into tbl_Books
	(Books_BooksID, Books_Title, Books_PublisherName)
	Values
	('LOTR1980', 'The Lost Tribe', 'Penguin Random House'),
	('CA1985', 'Carrie', 'HarperCollins'),
	('SH1990', 'The Shinning', 'HarperCollins'),
	('BOSADA1995', 'Bob Saves the Day', 'Simon & Schuster'),
	('ONMO2000', 'One for the Money', 'Notes'),
	('DEWIWA2005', 'Dead Witch Walking', 'Notes'),
	('LOCA2010','Love of Calculus', 'Macmillan'),
	('PIPI2015','The Pie, 3.14, Piper', 'Macmillan'),
	('BAEA2020', 'BattleField Earth', 'Simon & Schuster'),
	('HUFIN2025', 'Huck Finn', 'Macmillan'),
	('FR1975', 'Frostburn', 'Notes'),
	('EX1970', 'Expats', 'Penguin Random House'),
	('LEUNSE1965', '20,000 Leagues Under the Sea', 'HarperCollins'),
	('IRKI1955', 'Iron King', 'HarperCollins'),
	('FILIDU1982','Five Little Duck', 'Simon & Schuster'),
	('IN2016', 'Inferno', 'Penguin Random House'),
	('AL1987', 'El Alquimista', 'Macmillan'),
	('LUAN1992','Luz de Los Angeles', 'Notes'),
	('HAPO1997', 'Harry Potter: Chamber of Secrets', 'Penguin Random House'),
	('SALE1977','Sacrlet Letter A', 'Macmillan'),
	('HUNY2018','Humans of New York', 'Notes'),
	('PR1973','Prince', 'HarperCollins');


/**Table Book Authors**/

Insert Into tbl_Book_Authors
	(BA_BookID, BA_AuthorName)
	Values
	('LOTR1980','Cast Aways'),
	('CA1985','Stephen King'),
	('SH1990','Stephen King'),
	('BOSADA1995','Rollie'),
	('ONMO2000','Janet Evonovitch'),
	('DEWIWA2005','Kim West'),
	('LOCA2010','Capernicous'),
	('PIPI2015','Capernicous'),
	('BEEA2020','LR Hubbard'),
	('HUFIN2025','Mark Twain'),
	('FR1975','Isabella Iona'),
	('EX1970','Tired of Government Group'),
	('LEUNSE1965','Crazyman'),
	('IRKI1955','Tre Fried'),
	('FILIDU1982','Oma Jennings'),
	('AL1987','Claudia Gonzales'),
	('IN2016','Swash Valquez'),
	('LUAN1992','Luis Cervantes'),
	('HAPO1997','JK Rowlings'),
	('SALE1977','Nathanial Hawthorne'),
	('HUNY2018','Brandon Staton'),
	('PR1973','Mayte Garcia');

/**Table Borrower**/

Insert Into tbl_Borrower
	(Bor_Name, Bor_Address, Bor_Phone)
	Values
	('Joe Blow', '18901 Hilltop Rd, LO', '541-586-9512'),
	('Jill Smithe', '4421 SE Topaz Dr, Troutdale', '971-582-4545'),
	('Aaron Ball', '1012 N 10th, Stayton', '503-456-7539'),
	('Jonathan Mazy', '234 SW Main, Portland', '971-344-5858'),
	('Ryan Allen', '18080 S Hill Rd, RiverDale', '971-344-4242'),
	('Christian Cervantes', '2546 NE 132nd, Portland', '503-544-4566'),
	('Andrew Taylor', '222 SE Stark, Portland', '971-456-8523'),
	('Jacob LaClaire', '222 SE Stark, Portland', '727-345-2579'),
	('Oma Awesome', '888 Chocolate Ave, Hillsboro', '541-951-7526'),
	('Cortana Belcher', '244 Megan Circle, HillAFB', '971-234-6789'),
	('Vincent Allen', '12068 NE 132nd, Portland', '503-867-5309');


/**Table Book Loans**/

Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	('LEUNSE1965', '1', '1100', '10/01/2018', '10/15/2018'),
	('HAPO1997', '1', '1100', '10/01/2018', '10/15/2018'),
	('FILIDU1982', '1', '1100', '10/01/2018', '10/15/2018'),
	('PR1973', '1', '1100', '10/01/2018', '10/15/2018'),
	('PIPI2015', '1', '1100', '10/01/2018', '10/15/2018'); /**5**/

Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values	
	('SALE1977', '1', '1115', '09/28/2018', '10/13/2018'),
	('AL1987', '1', '1115', '09/28/2018', '10/13/2018'),
	('BAEA2020', '1', '1115', '09/28/2018', '10/13/2018'),
	 ('CA1985', '1', '1115', '09/24/2018', '10/09/2018'); /**4**/


Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	 ('SH1990', '2', '1145', '09/20/2018', '10/05/2018'),
	 ('FR1975', '2', '1145', '09/20/2018', '10/05/2018'),
	 ('HUFIN2025', '2', '1145', '09/20/2018', '10/05/2018'),
	 ('IRKI1955', '2', '1145', '09/20/2018', '10/05/2018'),
	 ('LEUNSE1965', '2', '1145', '09/20/2018', '10/05/2018'); /**5**/


Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	 ('LOCA2010', '2', '1160', '10/6/2018', '10/21/2018'),
	 ('LOTR1980', '2', '1160', '10/6/2018', '10/21/2018'),
	 ('SALE1977', '2', '1160', '10/6/2018', '10/21/2018'),
	 ('AL1987', '3', '1160', '10/5/2018', '10/2/2018'),
	 ('BAEA2020', '3', '1160', '10/5/2018', '10/20/2018'),
	 ('IRKI1955', '2', '1160', '10/6/2018', '10/21/2018'); /**6**/


Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	 ('PR1973', '5', '1175', '09/01/2018', '09/16/2018'),
	 ('SALE1977', '5', '1175', '09/01/2018', '09/16/2018'), /**4**/
	 ('BAEA2020', '6', '1175', '09/05/2018', '09/30/2018'),
	 ('SH1990', '6', '1175', '09/05/2018', '09/30/2018');

Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	 ('SH1990', '5', '1205', '10/05/2018', '10/20/2018'),
	 ('BAEA2020', '5', '1205', '10/05/2018', '10/20/2018'),
	 ('BOSADA1995', '5', '1205', '10/05/2018', '10/20/2018'),
	 ('CA1985', '5', '1205', '10/05/2018', '10/20/2018'); /**4**/


Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	 ('HAPO1997', '6', '1220', '09/12/2018', '10/12/2018'),
	 ('EX1970', '5', '1220', '09/20/2018', '10/20/2018'),
	 ('FR1975', '6', '1220', '09/12/2018', '10/12/2018'),
	 ('IN2016', '6', '1220', '09/12/2018', '10/12/2018'),
	 ('IRKI1955', '5', '1220', '09/01/2018', '09/16/2018'); /**5**/

	 
Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	('BOSADA1995', '3', '1130', '09/12/2018', '10/12/2018'),
	('CA1985', '3', '1130', '09/12/2018', '10/12/2018'),
	('IN2016', '4', '1130', '09/12/2018', '10/12/2018'),
	('EX1970', '3', '1130', '09/12/2018', '10/12/2018'),
	('PR1973', '3', '1130', '09/12/2018', '10/12/2018'),
	('PIPI2015', '3', '1130', '09/12/2018', '10/12/2018'),	
	('FILIDU1982', '3', '1130', '09/12/2018', '10/12/2018'),
	('FR1975', '3', '1130', '09/12/2018', '10/12/2018'),
	('HAPO1997', '4', '1130', '09/10/2018', '10/10/2018'),
	('HUFIN2025', '4', '1130', '09/10/2018', '10/10/2018'),
	('HUNY2018', '4', '1130', '09/10/2018', '10/10/2018'); /**11**/


Insert Into tbl_Book_Loans 
	(BL_BookID, BL_BranchID, BL_CardNo, BL_DateOut, BL_DateDue)
	Values
	('IRKI1955', '4', '1190', '09/30/2018', '10/14/2018'),
	('LEUNSE1965', '4', '1190', '09/30/2018', '10/14/2018'),
	('LOTR1980', '4', '1190', '09/30/2018', '10/14/2018'),
	('LUAN1992', '4', '1190', '09/30/2018', '10/14/2018'),
	('ONMO2000', '4', '1190', '09/30/2018', '10/14/2018'),
	('PIPI2015', '4', '1190', '09/30/2018', '10/14/2018'),
	('AL1987', '5', '1190', '09/20/2018', '10/04/2018'),
	('CA1985', '2', '1190', '09/20/2018', '10/04/2018'),
	('IRKI1955', '5', '1190', '09/20/2018', '10/04/2018'),
	('HUNY2018', '6', '1190', '09/15/2018', '10/01/2018'),
	('PR1973', '6', '1190', '09/15/2018', '10/01/2018'),
	('SALE1977', '6', '1190', '09/15/2018', '10/01/2018'); /**12**56**/

/**Table Book Copies**/

Insert Into tbl_Book_Copies
	(BC_BookID, BC_BranchID, BC_Number_of_Copies)
	Values
	('LOTR1980', '1', '2'), ('LEUNSE1965', '1', '3'), ('HAPO1997', '1', '5'), ('FILIDU1982', '1', '3'), ('PR1973', '1', '2'),
	('PIPI2015', '1', '4'), ('SALE1977', '1', '2'), ('AL1987', '1', '2'), ('BAEA2020', '1', '5'), ('CA1985', '1', '2'),


	('CA1985', '2', '3'), ('SH1990', '2', '3'), ('BOSADA1995', '2', '4'), ('FR1975', '2', '3'), ('HUFIN2025', '2', '2'), 
	('IRKI1955', '2', '2'), ('LEUNSE1965', '2', '2'), ('LOCA2010', '2', '2'), ('LOTR1980', '2', '2'), ('SALE1977', '2', '2'),
	

	('AL1987', '3', '2'), ('BAEA2020', '3', '2'), ('BOSADA1995', '3', '4'), ('CA1985', '3', '2'), ('DEWIWA2005', '3', '4'),
	 ('EX1970', '3', '2'), 	('PR1973', '3', '4'), ('PIPI2015', '3', '4'), ('FILIDU1982', '3', '2'), ('FR1975', '3', '2'),


	 ('HAPO1997', '4', '3'), ('HUFIN2025', '4', '2'), ('HUNY2018', '4', '2'), ('IN2016', '4', '4'), ('IRKI1955', '4', '2'),
	 ('LEUNSE1965', '4', '2'), ('LOTR1980', '4', '3'), ('LUAN1992', '4', '2'), ('ONMO2000', '4', '5'), ('PIPI2015', '4', '3'),


	 ('PR1973', '5', '3'), ('SALE1977', '5', '3'), ('SH1990', '5', '3'), ('AL1987', '5', '3'), ('BAEA2020', '5', '4'),
	 ('BOSADA1995', '5', '3'), ('CA1985', '5', '2'), ('DEWIWA2005', '5', '3'), ('EX1970', '5', '5'), ('IRKI1955', '5', '2'),

	 ('FR1975', '6', '3'), ('HAPO1997', '6', '3'), ('HUNY2018','6', '3'), ('IN2016', '6', '2'), ('IRKI1955', '6', '3'),
	 ('ONMO2000', '6', '3'), ('PR1973', '6', '3'), ('SALE1977', '6', '4'), ('SH1990', '6', '2'), ('BAEA2020','6','4');

  
/**?1*Locate Title and Branch Name**/
Create Procedure BookBranchLocate @Books_Title Varchar(30), @BL_BranchName Varchar(30)
AS
	Select
	a1.BC_BookID, a2.Books_Title, a3.LB_BranchName, a1.BC_Number_of_Copies  
	FROM tbl_Book_Copies a1
	INNER JOIN tbl_Books a2 on a2.Books_BooksID = a1.BC_BookID
	INNER JOIN tbl_Library_Branch a3 on a3.LB_BranchID = a1.BC_BranchID
	WHERE Books_Title = @Books_Title and LB_BranchName = @BL_BranchName
;

/**?2*Locate Title and Number of Copies**/

Create Procedure BookStock @Books_Title Varchar(30)
AS
	Select
	a1.BC_BookID, a2.Books_Title, a3.LB_BranchName, a1.BC_Number_of_Copies  
	FROM tbl_Book_Copies a1
	INNER JOIN tbl_Books a2 on a2.Books_BooksID = a1.BC_BookID
	INNER JOIN tbl_Library_Branch a3 on a3.LB_BranchID = a1.BC_BranchID
	WHERE Books_Title = @Books_Title
;

/**?3*Borrows who do not have books out**/ 
Create Procedure BookBorrows
AS 
	Select * From tbl_Borrower 
	Where Bor_CardNo NOT IN
	(Select BL_CardNo From tbl_Book_Loans);



/**?4*DueDate**/ 

Create Procedure DueDateLocate @BL_DateDue DATE, @LB_BranchName Varchar(30)
AS
	Select
	a2.Books_Title, a4. Bor_Name, a4.Bor_Address  
	FROM tbl_Book_Loans a1
	INNER JOIN tbl_Books a2 on a2.Books_BooksID = a1.BL_BookID
	INNER JOIN tbl_Library_Branch a3 on a3.LB_BranchID = a1.BL_BranchID
	INNER JOIN tbl_Borrower a4 on a4.Bor_CardNo = a1.BL_CardNo
	WHERE BL_DateDue = @BL_DateDue AND LB_BranchName = @LB_BranchName
;


/**?5*Branch loaned out books**/

Create Procedure BooksOnLoan @Bl_CardNo INT
AS
	Select LB_BranchID, LB_BranchName, COUNT(BL_CardNo) AS TotalCount
	From tbl_Library_Branch a1
	INNER JOIN tbl_Book_Loans a2 ON a2.BL_BranchID = a1.LB_BranchID
	Group By LB_BranchID, LB_BranchName
	Having Count(BL_CardNo) >= @BL_CardNo; 



/**Drill 5**/

/**?6*Borrowers with more than 5 books**/

Create Procedure BooksOut @BL_CardNo Int
AS
	Select BL_CardNo, Bor_Name, Bor_Address, COUNT(BL_CardNo) AS TotalCount
	From tbl_Book_Loans a1
	INNER JOIN tbl_Borrower a2 ON a2.Bor_CardNo = a1.BL_CardNo
	Group By BL_CardNo, Bor_Name, Bor_Address
	Having Count(BL_CardNo) >= @BL_CardNo; 


/**?7*Stephen King**/

Create Procedure AuthorBranch @BA_AuthorName Varchar(30), @LB_BranchName Varchar(30)
AS
	Select
	a1.Books_title, a3.BC_Number_of_Copies, a4.LB_BranchName
	FROM tbl_Books a1
	INNER JOIN tbl_Book_Authors a2 on a2.BA_BookID = a1.Books_BooksID
	INNER JOIN tbl_Book_Copies a3 on a3.BC_BookID = a1.Books_BooksID
	INNER JOIN tbl_Library_Branch a4 on a4.LB_BranchID = a3.BC_BranchID
	WHERE BA_AuthorName = @BA_AuthorName and LB_BranchName = @LB_BranchName
;


/**Queries Calling Stored Procedures**/

/** Drill 1**/
EXECUTE [dbo].[BookBranchLocate] @Books_Title = 'The Lost Tribe', @BL_BranchName = 'Sharpstown';

/**Drill 2**/
EXECUTE [dbo].[BookStock] @Books_Title = 'The Lost Tribe';

/**Drill 3**/

EXECUTE [dbo].[BookBorrows];

/**Drill 4**/

EXECUTE [dbo].[DueDateLocate] @BL_DateDue = '10/15/2018', @LB_BranchName ='Sharpstown';

/**Drill 5**/

EXECUTE [dbo].[BooksOnLoan] @BL_CardNo = 1;

/**Drill 6**/

EXECUTE [dbo].[BooksOut] @BL_CardNo = 5;

/**Drill 7**/

EXECUTE [dbo].[AuthorBranch] @BA_AuthorName = 'Stephen King', @LB_BranchName = 'Central';
