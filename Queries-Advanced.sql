USE SkyTrackAirlineSystemDB;


--1:
SELECT 
    F.flightNO,
    A1.name AS OriginAirport,
    A2.name AS DestinationAirport,
    AC.model AS AircraftModel,
    COUNT(B.BookingID) AS TotalPassengers
FROM Flight F
JOIN Airport A1 ON F.departsCode = A1.AIRID
JOIN Airport A2 ON F.arrivesAtCode = A2.AIRID
JOIN Aircraft AC ON F.AircraftID = AC.AircraftID
LEFT JOIN Booking B ON F.flightID = B.flightID
GROUP BY F.flightID, F.flightNO, A1.name, A2.name, AC.model
ORDER BY TotalPassengers ;

--2:
SELECT * FROM Passenger P LEFT JOIN Booking B ON P.PID=B.PID
WHERE B.BookingID IS NULL;

--3:
SELECT 
    F.flightNO,
    SUM(B.pricePaid) AS TotalRevenue,
    COUNT(B.BookingID) AS NumberOfBookings
FROM Flight F
 JOIN Booking B ON F.flightID = B.flightID
GROUP BY F.flightID, F.flightNO
HAVING SUM(B.pricePaid) > 500
ORDER BY TotalRevenue DESC;

--4:
SELECT 
    CM.fullName,
    COUNT(FM.flightID) AS TotalFlightsAssigned
FROM CrewMember CM
INNER JOIN flightMember FM ON CM.crewID = FM.crewID
GROUP BY CM.fullName
HAVING COUNT(FM.flightID) > 1
ORDER BY TotalFlightsAssigned;

--5:
SELECT 
F.flightID,
F.flightNO,
    AVG(B.pricePaid) AS AveragePrice,
    COUNT(B.BookingID) AS NumberOfBookings
FROM Flight F
INNER JOIN Booking B ON F.flightID = B.flightID
GROUP BY F.flightID, F.flightNO
HAVING AVG(B.pricePaid) > (SELECT AVG(pricePaid) FROM Booking)
ORDER BY AveragePrice ;

--6:
SELECT
    F.flightNO,
    A1.name AS OriginAirport,
    A1.city AS OriginCity,
    A2.name AS DestinationAirport,
    A2.city AS DestinationCity,
    COUNT(B.BookingID) AS TotalBookings
FROM Flight F
INNER JOIN Airport A1 ON F.departsCode = A1.AIRID
INNER JOIN Airport A2 ON F.arrivesAtCode = A2.AIRID
INNER JOIN Booking B ON F.flightID = B.flightID
GROUP BY F.flightID, F.flightNO, A1.name, A1.city, A2.name, A2.city
ORDER BY TotalBookings DESC;

--7:
SELECT 
    class,
    COUNT(*) AS NumberOfBookings,
    SUM(pricePaid) AS TotalRevenue,
    AVG(pricePaid) AS AveragePrice,
    MAX(pricePaid) AS HighestPrice,
    MIN(pricePaid) AS LowestPrice
FROM Booking
GROUP BY class
ORDER BY TotalRevenue DESC;

--8:
SELECT
    P.FullName ,
    F.flightNO,
    B.bookingDate
FROM Passenger P
INNER JOIN Booking B ON P.PID = B.PID
INNER JOIN Flight F ON B.flightID = F.flightID
WHERE F.status = 'Cancelled'
GROUP BY P.FullName,F.flightNO,B.bookingDate
ORDER BY FullName;

--9:
SELECT 
    f.flightNO,
    COUNT(fm.crewID) AS TotalCrewCount,
    f.departure
FROM Flight f
JOIN flightMember fm ON f.flightID = fm.flightID
JOIN CrewMember cm ON fm.crewID = cm.crewID
GROUP BY 
    f.flightNO,
    f.departure,
    f.flightID
HAVING 
    SUM(CASE WHEN cm.role = 'Pilot' THEN 1 ELSE 0 END) >= 1
    AND
    SUM(CASE WHEN cm.role = 'Flight Attendant' THEN 1 ELSE 0 END) >= 1;

--10:
SELECT 
    f.flightNO,

    ao.city AS OriginCity,
    ad.city AS DestinationCity,

    a.model,
    a.manufacturer,

    COUNT(DISTINCT b.PID) AS TotalPassengers,
    COUNT(DISTINCT fm.crewID) AS TotalCrew,

    SUM(b.pricePaid) AS TotalRevenue

FROM Flight f

JOIN Airport ao ON f.departsCode = ao.AIRID
JOIN Airport ad ON f.arrivesAtCode = ad.AIRID

JOIN Aircraft a ON f.AircraftID = a.AircraftID

LEFT JOIN Booking b ON f.flightID = b.flightID
LEFT JOIN flightMember fm ON f.flightID = fm.flightID

GROUP BY 
    f.flightNO,
    ao.city,
    ad.city,
    a.model,
    a.manufacturer,
    f.flightID

ORDER BY TotalRevenue DESC;
