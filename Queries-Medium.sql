USE SkyTrackAirlineSystemDB;

--1. For each flight, show the flight number, the name of the origin airport, and the name of the destinationairport.
SELECT  F.flightNO,A1.name AS OriginAirport,  A2.name AS DestinationAirport
FROM Flight F JOIN Airport A1 ON F.departsCode = A1.AIRID JOIN Airport A2
ON F.arrivesAtCode = A2.AIRID;

--2. Show each booking along with the full name of the passenger who made it and the flight number itbelongs to.
SELECT
    B.BookingID,
    P.FullName,
    F.flightNO,
    B.class,
    B.pricePaid
FROM Booking B JOIN Passenger P ON B.PID = P.PID
JOIN Flight F ON B.flightID = F.flightID;

--3. List all crew members assigned to flight 'SK101', showing their full name and role.
SELECT
    C.fullName,
    C.role
FROM CrewMember C JOIN flightMember FM ON C.crewID = FM.crewID 
JOIN Flight F ON FM.flightID = F.flightID
WHERE F.flightNO = 'SK101';

--4. Show all completed flights along with the aircraft model used on each flight.
SELECT
    F.flightNO,
    A.model
FROM Flight F
JOIN Aircraft A ON F.AircraftID = A.AircraftID
WHERE F.status = 'Completed';

--5. For each passenger, show their full name and the total number of bookings they have made. Orderby booking count from highest to lowest.
SELECT
    P.FullName,
    COUNT(B.BookingID) AS TotalBookings
FROM Passenger P LEFT JOIN Booking B ON P.PID = B.PID
GROUP BY P.FullName
ORDER BY TotalBookings DESC;

--6. Show the total revenue collected from each booking class.
SELECT
    class,
    SUM(pricePaid) AS TotalRevenue
FROM Booking
GROUP BY class;
--7. Count how many flights each aircraft has been assigned to.
SELECT
    A.model,
    COUNT(F.flightID) AS TotalFlights
FROM Aircraft A
LEFT JOIN Flight F
ON A.AircraftID = F.AircraftID
GROUP BY A.model;

--8. List all flights that have more than one booking.
SELECT
    F.flightNO,
    COUNT(B.BookingID) AS BookingCount
FROM Flight F
JOIN Booking B
ON F.flightID = B.flightID
GROUP BY F.flightNO
HAVING COUNT(B.BookingID) > 1;

--9. Show the full details of all bookings — passenger name, flight number, origin airport, destinationairport, class, and price paid

SELECT
    P.FullName,
    F.flightNO,
    A1.name AS OriginAirport,
    A2.name AS DestinationAirport,
    B.class,
    B.pricePaid
FROM Booking B
JOIN Passenger P
ON B.PID = P.PID
JOIN Flight F
ON B.flightID = F.flightID
JOIN Airport A1
ON F.departsCode = A1.AIRID
JOIN Airport A2
ON F.arrivesAtCode = A2.AIRID;