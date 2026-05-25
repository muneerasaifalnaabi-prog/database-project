CREATE DATABASE SkyTrackAirlineSystemDB;
USE SkyTrackAirlineSystemDB;

CREATE TABLE Airport (
    AIRID INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    IATAcode VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE Aircraft (
    AircraftID INT IDENTITY(1,1) PRIMARY KEY,
    model VARCHAR(100) NOT NULL,
    year INT,
    manufacturer VARCHAR(100) NOT NULL,
    totalSeatingCapacity INT NOT NULL CHECK (totalSeatingCapacity > 0),
    RegNO VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Passenger (
    PID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    DOB DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    NatioID VARCHAR(8) NOT NULL UNIQUE
);

CREATE TABLE Pass_Phone (
    PID INT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (PID, phone),
    FOREIGN KEY (PID) REFERENCES Passenger(PID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE CrewMember (
    crewID INT IDENTITY(1,1) PRIMARY KEY,
    licenseNo VARCHAR(50) NOT NULL UNIQUE,
    fullName VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer'))
);

CREATE TABLE Flight (
    flightID INT IDENTITY(1,1) PRIMARY KEY,
    departure DATETIME NOT NULL,
    arrival DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL  DEFAULT 'Scheduled' CHECK (status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
    AircraftID INT NOT NULL,
    departsCode INT NOT NULL,
    arrivesAtCode INT NOT NULL,
    flightNO VARCHAR(20) NOT NULL UNIQUE,
    CHECK (arrival > departure),
    FOREIGN KEY (AircraftID) REFERENCES Aircraft(AircraftID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (departsCode) REFERENCES Airport(AIRID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (arrivesAtCode) REFERENCES Airport(AIRID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    class VARCHAR(20) NOT NULL CHECK (class IN ('Economy', 'Business', 'First')),
    pricePaid DECIMAL(10,2) NOT NULL CHECK (pricePaid > 0),
    bookingDate DATE NOT NULL DEFAULT GETDATE(),
    seatNo VARCHAR(10) NOT NULL,
    flightID INT NOT NULL,
    PID INT NOT NULL,
    FOREIGN KEY (flightID) REFERENCES Flight(flightID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (PID) REFERENCES Passenger(PID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE flightMember (
    crewID INT NOT NULL,
    flightID INT NOT NULL,
    PRIMARY KEY (crewID, flightID),
    FOREIGN KEY (crewID) REFERENCES CrewMember(crewID)
    ON DELETE CASCADE
    ON UPDATE CASCADE, 
    FOREIGN KEY (flightID) REFERENCES Flight(flightID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

