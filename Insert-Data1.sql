USE SkyTrackAirlineSystemDB;

INSERT INTO Airport (name, city, country, IATAcode) VALUES
('Heathrow Airport', 'London', 'United Kingdom', 'LHR'),
('Dubai International Airport', 'Dubai', 'UAE', 'DXB'),
('Muscat International Airport', 'Muscat', 'Oman', 'MCT'),
('JFK International Airport', 'New York', 'USA', 'JFK'),
('Charles de Gaulle Airport', 'Paris', 'France', 'CDG');

INSERT INTO Aircraft (model, year, manufacturer, totalSeatingCapacity, RegNO) VALUES
('Boeing 737', 2018, 'Boeing', 180, 'A1001'),
('Airbus A320', 2020, 'Airbus', 170, 'A1002'),
('Boeing 777', 2019, 'Boeing', 350, 'A1003'),
('Airbus A380', 2021, 'Airbus', 500, 'A1004'),
('Boeing 787 Dreamliner', 2022, 'Boeing', 290, 'A1005');

INSERT INTO Passenger (FullName, email, DOB, nationality, NatioID) VALUES
('Ahmed Ali', 'ahmed@gmail.com', '1995-03-12', 'Omani', 'OM100001'),
('Sara Khan', 'sara@gmail.com', '1998-06-20', 'Pakistani', 'PK100002'),
('John Smith', 'john@gmail.com', '1992-11-10', 'American', 'US100003'),
('Fatima Noor', 'fatima@gmail.com', '1997-02-15', 'Emirati', 'AE100004'),
('Ali Hassan', 'ali@gmail.com', '1990-09-01', 'Egyptian', 'EG100005'),
('Mona Salem', 'mona@gmail.com', '1994-04-17', 'Jordanian', 'JO100006'),
('David Lee', 'david@gmail.com', '1996-12-05', 'Canadian', 'CA100007'),
('Sophia Brown', 'sophia@gmail.com', '1993-08-22', 'British', 'UK100008');

INSERT INTO Pass_Phone (PID, phone) VALUES
(1, '96890000001'),
(2, '96890000002'),
(3, '96890000003'),
(4, '96890000004'),
(5, '96890000005'),
(6, '96890000006'),
(7, '96890000007'),
(8, '96890000008');

INSERT INTO CrewMember (licenseNo, fullName, role) VALUES
('LIC1001', 'Captain James', 'Pilot'),
('LIC1002', 'Michael Scott', 'Co-Pilot'),
('LIC1003', 'Emily Rose', 'Flight Attendant'),
('LIC1004', 'Daniel White', 'Engineer'),
('LIC1005', 'Olivia Green', 'Pilot'),
('LIC1006', 'Sophia Adams', 'Flight Attendant');


INSERT INTO Flight (departure, arrival, status, AircraftID, departsCode, arrivesAtCode, flightNO) VALUES
('2026-06-01 08:00:00', '2026-06-01 12:00:00', 'Scheduled', 1, 1, 2, 'SK101'),
('2026-06-02 09:00:00', '2026-06-02 13:30:00', 'Delayed', 2, 2, 3, 'SK102'),
('2026-06-03 06:00:00', '2026-06-03 14:00:00', 'Completed', 3, 3, 4, 'SK103'),
('2026-06-04 10:00:00', '2026-06-04 16:00:00', 'Cancelled', 4, 4, 5, 'SK104'),
('2026-06-05 07:00:00', '2026-06-05 11:00:00', 'Scheduled', 5, 5, 1, 'SK105'),
('2026-06-06 12:00:00', '2026-06-06 18:00:00', 'Delayed', 1, 1, 3, 'SK106'),
('2026-06-07 15:00:00', '2026-06-07 22:00:00', 'Completed', 2, 2, 4, 'SK107'),
('2026-06-08 05:00:00', '2026-06-08 09:00:00', 'Scheduled', 3, 3, 5, 'SK108');


INSERT INTO Booking (class, pricePaid, bookingDate, seatNo, flightID, PID) VALUES
('Economy', 150.00, '2026-05-01', '12A', 1, 1),
('Business', 450.00, '2026-05-02', '2B', 2, 2),
('First', 900.00, '2026-05-03', '1A', 3, 3),
('Economy', 200.00, '2026-05-04', '15C', 4, 4),
('Business', 500.00, '2026-05-05', '3D', 5, 5),
('First', 1000.00, '2026-05-06', '1B', 6, 6),
('Economy', 180.00, '2026-05-07', '18E', 7, 7),
('Business', 600.00, '2026-05-08', '4A', 8, 8),
('Economy', 170.00, '2026-05-09', '20F', 1, 2),
('First', 1200.00, '2026-05-10', '1C', 2, 1);

INSERT INTO flightMember (crewID, flightID)VALUES
(1,1),
(3,1),
(1,2),
(6,2),
(5,3),
(3,3),
(5,4),
(6,4),
(1,5),
(3,5),
(5,6),
(6,6),
(1,7),
(3,7),
(5,8),
(6,8);