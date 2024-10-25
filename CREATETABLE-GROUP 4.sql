CREATE DATABASE AOLFUNIMAZION_BA19

CREATE TABLE MsCity(
CityID CHAR(5) PRIMARY KEY
	CHECK (CityID LIKE 'CI[0-9][0-9][0-9]'), 
CityName VARCHAR(100) NOT NULL
)


CREATE TABLE MsStaff( 
StaffID CHAR(5) PRIMARY KEY 
	CHECK (StaffID LIKE 'SF[0-9][0-9][0-9]'),
StaffName VARCHAR(100) NOT NULL,
StaffGender VARCHAR(10) CHECK (StaffGender IN ('Male', 'Female')) NOT NULL,
StaffEmail VARCHAR(100) NOT NULL, 
StaffPassword VARCHAR(25) NOT NULL, 
STaffDOB DATE check (YEAR(StaffDOB) < 2000) NOT NULL,
CityID CHAR(5) FOREIGN KEY REFERENCES MsCity(CityID)
)


CREATE TABLE MsStudio (
StudioID CHAR(5) PRIMARY KEY
	CHECK (StudioID LIKE 'SD[0-9][0-9][0-9]'),
StudioName VARCHAR (100) NOT NULL,
CityID CHAR (5) FOREIGN KEY  REFERENCES MsCity(CityID)
) 

CREATE TABLE MsGenre(
GenreID CHAR (5) PRIMARY KEY 
	CHECK (GenreID LIKE 'GE[0-9][0-9][0-9]'),
GenreName VARCHAR(100) NOT NULL
)


Create Table MsAnime (
AnimeID CHAR(5) PRIMARY KEY CHECK (AnimeID LIKE 'AN[0-9][0-9][0-9]'),
GenreID CHAR(5) FOREIGN KEY REFERENCES MsGenre(GenreID) ,
AnimeName VARCHAR (100) NOT NULL,
AnimePrice INT NOT NULL,
AnimeDescription VARCHAR(100) NOT NULL,
AnimeAge INT NOT NULL 
	CHECK (AnimeAge BETWEEN 0 AND 25),
)



CREATE TABLE MsCustomer (
CustomerID CHAR(5) PRIMARY KEY 
	CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
CustomerName VARCHAR(100) NOT NULL,
CityID CHAR (5) FOREIGN KEY  REFERENCES MsCity(CityID), 
CustomerGender VARCHAR(10) NOT NULL 
	CHECK (CustomerGender IN ('Male', 'Female')),
CustomerEmail VARCHAR(100) NOT NULL 
	CHECK (CustomerEmail LIKE '%@gmail.com'),
CustomerPassword VARCHAR(100) NOT NULL CHECK (LEN(CustomerPassword) >= 8),
CustomerDOB DATE NOT NULL
)


CREATE TABLE PurchaseHeader (
PurchaseID CHAR(5) PRIMARY KEY
	CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),  
StaffID  CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID),
StudioID  CHAR(5) FOREIGN KEY REFERENCES MsStudio(StudioID),
PurchaseDate DATE NOT NULL 
) 

CREATE TABLE PurchaseDetail ( 
PurchaseId CHAR(5)FOREIGN KEY REFERENCES PurchaseHeader(PurchaseID),
AnimeId  CHAR(5) FOREIGN KEY REFERENCES MsAnime(AnimeID) ,
PRIMARY KEY(PurchaseID, AnimeID)
) 



CREATE TABLE SalesMethod(
SalesMethodID CHAR(5) PRIMARY KEY CHECK(SalesMethodID LIKE 'SM[0-9][0-9][0-9]'),
SalesMethodName VARCHAR(10) NOT NULL 
)

CREATE TABLE SalesHeader( 
SalesID CHAR (5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
SalesDate DATE NOT NULL,
SalesMethodID CHAR(5) FOREIGN KEY REFERENCES SalesMethod(SalesMethodID),
CustomerID CHAR (5) FOREIGN KEY REFERENCES MsCustomer(CustomerID)
) 

CREATE TABLE SalesDetail (
SalesID CHAR (5) FOREIGN KEY REFERENCES SalesHeader(SalesID), 
AnimeID CHAR(5) FOREIGN KEY REFERENCES MsAnime(AnimeID),
DurationDay INT NOT NULL, 
PRIMARY KEY(SalesId, AnimeID)  
) 
