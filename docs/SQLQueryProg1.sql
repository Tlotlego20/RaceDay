
-- CREATE DATABASE
CREATE DATABASE RaceDay;

--USE DATABASE
USE RaceDay;



-- ORGANISERS TABLE

CREATE TABLE Organisers
(
    OrganiserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),

    CONSTRAINT UQ_Organisers_Email UNIQUE (Email)
);



-- PARTICIPANTS TABLE

CREATE TABLE Participants
(
    ParticipantID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),

    CONSTRAINT UQ_Participants_Email UNIQUE (Email)
);



-- EVENTS TABLE


CREATE TABLE Events
(
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    OrganiserID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    EventDate DATETIME NOT NULL,
    Location VARCHAR(150) NOT NULL,
    Status VARCHAR(30) NOT NULL DEFAULT 'Upcoming',

    CONSTRAINT FK_Events_Organisers
        FOREIGN KEY (OrganiserID)
        REFERENCES Organisers(OrganiserID)
);



-- CATEGORIES TABLE


CREATE TABLE Categories
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    DistanceKm DECIMAL(6,2) NOT NULL,
    EntryFee DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Categories_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID)
);




--ENROLMENTS TABLE


CREATE TABLE Enrolments
(
    EnrolmentID INT IDENTITY(1,1) PRIMARY KEY,
    ParticipantID INT NOT NULL,
    EventID INT NOT NULL,
    CategoryID INT NOT NULL,
    EnrolmentDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status VARCHAR(30) NOT NULL DEFAULT 'Confirmed',

    CONSTRAINT FK_Enrolments_Participants
        FOREIGN KEY (ParticipantID)
        REFERENCES Participants(ParticipantID),

    CONSTRAINT FK_Enrolments_Events
        FOREIGN KEY (EventID)
        REFERENCES Events(EventID),

    CONSTRAINT FK_Enrolments_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


-- RESULTS TABLE


CREATE TABLE Results
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrolmentID INT NOT NULL,
    FinishTime TIME,
    Position INT,
    ResultStatus VARCHAR(30) NOT NULL DEFAULT 'Finished',

    CONSTRAINT FK_Results_Enrolments
        FOREIGN KEY (EnrolmentID)
        REFERENCES Enrolments(EnrolmentID),

    CONSTRAINT UQ_Results_Enrolment
        UNIQUE (EnrolmentID)
);




--INSERT into ORGANISERS


INSERT INTO Organisers
    (FirstName, LastName, Email, Phone)
VALUES
    ('Thabo', 'Mokoena', 'thabo@raceday.co.za', '0821234567'),
    ('Lerato', 'Dlamini', 'lerato@raceday.co.za', '0839876543');




-- INSERT into PARTICIPANTS


INSERT INTO Participants
    (FirstName, LastName, Email, Phone)
VALUES
    ('Kabelo', 'Nkosi', 'kabelo@gmail.com', '0712345678'),
    ('Naledi', 'Molefe', 'naledi@gmail.com', '0723456789');




-- INSERT into EVENTS


INSERT INTO Events
    (OrganiserID, Name, Description, EventDate, Location, Status)
VALUES
    (1, 'Johannesburg City Run',
     'Running event in Johannesburg',
     '2026-10-18 07:00:00',
     'Johannesburg',
     'Open'),

    (1, 'Soweto Marathon',
     'Marathon event in Soweto',
     '2026-11-08 06:30:00',
     'Soweto',
     'Open'),

    (2, 'Pretoria Cycle Challenge',
     'Cycling event in Pretoria',
     '2026-11-22 06:00:00',
     'Pretoria',
     'Upcoming');




--INSERT INTO CATEGORIES


INSERT INTO Categories
    (EventID, Name, DistanceKm, EntryFee)
VALUES
    -- Johannesburg City Run
    (1, '5 KM Run', 5.00, 80.00),
    (1, '10 KM Run', 10.00, 120.00),
    (1, '21 KM Run', 21.00, 200.00),

    -- Soweto Marathon
    (2, '10 KM Run', 10.00, 100.00),
    (2, '21 KM Run', 21.00, 180.00),
    (2, '42 KM Marathon', 42.00, 300.00),

    -- Pretoria Cycle Challenge
    (3, '20 KM Cycle', 20.00, 150.00),
    (3, '50 KM Cycle', 50.00, 250.00),
    (3, '80 KM Cycle', 80.00, 350.00);



--  INSERT INTO ENROLMENTS

INSERT INTO Enrolments
    (ParticipantID, EventID, CategoryID, Status)
VALUES
    (1, 1, 2, 'Confirmed'),
    (2, 1, 3, 'Confirmed'),
    (1, 2, 5, 'Confirmed'),
    (2, 2, 4, 'Confirmed'),
    (1, 3, 8, 'Confirmed');

--INSERT INTO RESULTS

INSERT INTO Results
    (EnrolmentID, FinishTime, Position, ResultStatus)
VALUES
    (1, '01:02:35', 12, 'Finished'),
    (2, '02:05:42', 8, 'Finished'),
    (3, '02:14:20', 15, 'Finished');

-- 15. CHECK THE TABLES

SELECT * FROM Organisers;
SELECT * FROM Participants;
SELECT * FROM Events;
SELECT * FROM Categories;
SELECT * FROM Enrolments;
SELECT * FROM Results;
