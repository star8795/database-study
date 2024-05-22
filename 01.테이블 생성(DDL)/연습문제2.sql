CREATE DATABASE IF NOT EXISTS test2_db;
use test2_db;

-- 문제 1: Books 테이블 생성
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    PublishedYear INT CHECK (PublishedYear >= 1500),
    Genre VARCHAR(100) NOT NULL
);
DESCRIBE Books;

-- 문제 2: Members 테이블 생성
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    MembershipDate DATE DEFAULT (DATE_FORMAT(NOW(), '%Y-%m-%d'))
);
DESCRIBE Members;

-- 문제 3: BorrowRecords 테이블 생성
CREATE TABLE BorrowRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
DESCRIBE BorrowRecords;
