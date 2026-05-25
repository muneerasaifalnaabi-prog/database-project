USE SkyTrackAirlineSystemDB;

--1. Update one flight status from 'Scheduled' to 'Completed'.
SELECT * FROM Flight WHERE flightID = 1;
UPDATE Flight SET status = 'Completed' WHERE flightID = 1;

--2. Change one flight status from 'Delayed' to 'Cancelled'.
SELECT * FROM Flight WHERE flightID = 2;
UPDATE Flight SET status = 'Cancelled' WHERE flightID = 2;

--3. Increase all Economy class booking prices by 10%.
UPDATE Booking SET pricePaid =pricePaid* 1.10 WHERE class ='Economy'

--4. Update one passenger's phone number.
UPDATE Pass_Phone SET phone = '96895555555' WHERE PID = 1;

--5. Move one crew member to a different role.
SELECT * FROM CrewMember WHERE crewID = 2;
UPDATE CrewMember SET role = 'Engineer' WHERE crewID = 2;

--==============================================================

--1. Delete one cancelled flight.
SELECT *FROM Flight WHERE status = 'Cancelled';
DELETE FROM Flight WHERE flightID = 2;

--2. Delete one booking linked to a cancelled flight.
SELECT * FROM Booking B JOIN Flight F ON B.flightID = F.flightID WHERE F.status = 'Cancelled';
DELETE FROM Booking WHERE BookingID = 4;

--3. Try to delete a passenger who has existing bookings.
SELECT * FROM Passenger WHERE PID = 1;
SELECT * FROM Booking WHERE PID = 1;
DELETE FROM Passenger WHERE PID = 1;

--EXPLAINTION :first it show the passenger with all booking ,
--but when i delete that passenger it delete all their bookings without showing any error becouse i use CASCADE

