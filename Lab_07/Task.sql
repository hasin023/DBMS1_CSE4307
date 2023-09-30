-- Table for Branches
CREATE TABLE BRANCHES (
    BRANCHID NUMBER PRIMARY KEY,
    LOCATION VARCHAR2(255) NOT NULL,
    YEARESTABLISHED NUMBER
);

-- Table for Employees
CREATE TABLE EMPLOYEES (
    EMPLOYEEID NUMBER PRIMARY KEY,
    NATIONALID VARCHAR2(20) UNIQUE NOT NULL,
    NAME VARCHAR2(255) NOT NULL,
    BLOODGROUP VARCHAR2(5),
    BIRTHDATE DATE,
    EMPLOYEETYPE VARCHAR2(20) CHECK (EMPLOYEETYPE IN ('Admin', 'Librarian', 'Maintenance')) NOT NULL,
    BASESALARY NUMBER(10, 2) NOT NULL,
    HOUSINGALLOWANCE NUMBER(10, 2),
    BRANCHID NUMBER,
    FOREIGN KEY (BRANCHID) REFERENCES BRANCHES(BRANCHID)
);

-- Table for Shifts
CREATE TABLE SHIFTS (
    SHIFTID NUMBER PRIMARY KEY,
    STARTTIME TIMESTAMP,
    DAYOFWEEK VARCHAR2(10) CHECK (DAYOFWEEK IN ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')) NOT NULL,
    DURATIONINMINUTES NUMBER NOT NULL,
    BRANCHID NUMBER,
    FOREIGN KEY (BRANCHID) REFERENCES BRANCHES(BRANCHID)
);

-- Table for Books
CREATE TABLE BOOKS (
    ISBN CHAR(13) PRIMARY KEY,
    TITLE VARCHAR2(255) NOT NULL,
    AUTHOR VARCHAR2(255),
    GENRE VARCHAR2(50),
    PRICE NUMBER(10, 2) NOT NULL
);

-- Table for BookCopies (to track the number of copies in each branch)
CREATE TABLE BOOKCOPIES (
    COPYID NUMBER PRIMARY KEY,
    BRANCHID NUMBER NOT NULL,
    ISBN CHAR(13) NOT NULL,
    FOREIGN KEY (BRANCHID) REFERENCES BRANCHES(BRANCHID),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN),
    UNIQUE (BRANCHID, ISBN)
);

-- Table for Publishers
CREATE TABLE PUBLISHERS (
    PUBLISHERID NUMBER PRIMARY KEY,
    NAME VARCHAR2(255) UNIQUE NOT NULL,
    CITY VARCHAR2(255) NOT NULL,
    YEARESTABLISHED NUMBER
);

-- Table for Users
CREATE TABLE USERS (
    USERID NUMBER PRIMARY KEY,
    USERNAME VARCHAR2(50) UNIQUE NOT NULL,
    NAME VARCHAR2(255) NOT NULL,
    DATEOFBIRTH DATE,
    HOMETOWN VARCHAR2(255),
    OCCUPATION VARCHAR2(100)
);

-- Table for BookIssues (to track book issues by users)
CREATE TABLE BOOKISSUES (
    ISSUEID NUMBER PRIMARY KEY,
    ISSUEDATE DATE NOT NULL,
    DUEDATE DATE NOT NULL,
    USERID NUMBER NOT NULL,
    COPYID NUMBER NOT NULL,
    EMPLOYEEID NUMBER NOT NULL,
    FOREIGN KEY (USERID) REFERENCES USERS(USERID),
    FOREIGN KEY (COPYID) REFERENCES BOOKCOPIES(COPYID),
    FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEES(EMPLOYEEID)
);