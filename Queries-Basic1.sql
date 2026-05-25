USE SkyTrackAirlineSystemDB;

--1. List all flights and their current status, ordered by departure datetime from earliest to latest.
SELECT * FROM Flight ORDER BY departure ;

--2. Show all passengers, ordered alphabetically by full name.
SELECT * FROM Passenger ORDER BY FullName ASC;

--3. List all aircraft and their seating capacity, ordered from largest to smallest.
SELECT * FROM Aircraft ORDER BY totalSeatingCapacity DESC;

--4. Show all bookings and their class. Display only distinct class values that exist in the system.
SELECT DISTINCT class FROM Booking;

--5. List all flights that have a status of 'Delayed' or 'Cancelled'.
SELECT * FROM Flight WHERE status IN ('Delayed', 'Cancelled');

--6. Show all passengers whose nationality is 'Omani'.
SELECT * FROM Passenger WHERE nationality = 'Omani';

INSERT INTO Passenger (FullName, email, DOB, nationality, NatioID)
VALUES('noora Al Balushi','salim@gmail.com','1999-05-15','Omani', 'OM100009')
,('Muneera Al Naabi','munee@gmail.com','2001-11-23','Omani','OM100010');

INSERT INTO Pass_Phone (PID, phone)VALUES
(9, '96892223344'),
(10, '96892223322');

--7. List all airports, ordered by country.
SELECT * FROM Airport ORDER BY country ;