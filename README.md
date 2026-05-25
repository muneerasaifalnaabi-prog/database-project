# SkyTrack Airline System

A comprehensive relational database management system designed to simulate and manage airline operations using SQL Server.

## 📋 Project Overview

The SkyTrack Airline System is a relational database project that manages and organizes airline operations in a centralized database environment. The system simulates a real airline environment where flights, passengers, airports, aircraft, bookings, and crew members are interconnected, demonstrating how database concepts can be applied to solve real-world airline management problems efficiently and accurately.

### Key Features

- **Flight Management**: Schedule and track flight operations
- **Aircraft Tracking**: Monitor aircraft usage and assignments
- **Passenger Information**: Store and manage passenger details
- **Booking System**: Process and track flight reservations
- **Crew Assignment**: Manage crew member assignments to flights
- **Airport Management**: Maintain airport information and connections

## 🛠️ Technologies Used

- **Database Management System**: Microsoft SQL Server Management Studio 2022 (SSMS 2022)
- **Design Tool**: draw.io (for ERD and mapping diagrams)
- **Language**: SQL (Structured Query Language)

## 📊 Database Architecture

### Entity Relationship Diagram (ERD)

The SkyTrack Airline System consists of the following interconnected entities:

#### Core Entities

1. **Airport**
   - Airport name, city, country
   - IATA code

2. **Aircraft**
   - Aircraft models and manufacturers
   - Seating capacity
   - Registration numbers

3. **Flight**
   - Departure and arrival times
   - Flight status
   - Aircraft assignment
   - Airport information (departure and destination)

4. **Passenger**
   - Full name and nationality
   - Email and national ID
   - Date of birth

5. **Booking**
   - Booking class and seat number
   - Ticket price
   - Booking date

6. **CrewMember**
   - Employee information
   - Role and license number

7. **Pass_Phone**
   - Passenger phone numbers

8. **FlightMember** (Junction Table)
   - Links crew members to flights

### Entity Relationships

- **Aircraft → Flight**: One-to-Many (One aircraft can be assigned to multiple flights)
- **Passenger → Booking**: One-to-Many (One passenger can make multiple bookings)
- **Flight ↔ CrewMember**: Many-to-Many (Implemented through FlightMember junction table)
- **Airport → Flight**: One-to-Many (Airports serve as departure and arrival points)

## 🔑 Key Design Decisions

### Primary Keys
- **IDENTITY Properties**: Used for all main entities to simplify record management and ensure unique identifiers

### Data Integrity
- **UNIQUE Constraints**: Applied to critical fields including:
  - Flight numbers
  - Passenger emails
  - National IDs
  - Aircraft registration numbers
  - Crew license numbers

### Referential Integrity
- **Foreign Keys**: Carefully placed in child tables
  - `Flight` table contains `AircraftID`, `departsCode`, and `arrivesAtCode`
  - `Booking` table contains `PID` and `flightID`
  - `Pass_Phone` table contains `PID`
  - `FlightMember` table contains `crewID` and `flightID`

### Cascade Actions
- **ON DELETE CASCADE** and **ON UPDATE CASCADE**: Used for most relationships to maintain consistency
- **ON DELETE NO ACTION**: Applied to Flight-Airport relationship to prevent multiple cascade path conflicts

## 🚧 Implementation Challenges and Solutions

### 1. Data Insertion Order
**Problem**: Foreign key constraint errors when inserting child records before parent records existed.

**Solution**: Established proper insertion order:
1. Parent tables first (Airport, Aircraft, Passenger)
2. Dependent tables second (Flight, Booking)

### 2. Multiple Cascade Paths Error
**Problem**: SQL Server error when Flight table had two foreign keys to Airport table, both with ON DELETE CASCADE.

**Solution**: Changed one relationship to ON DELETE NO ACTION to eliminate conflicting cascade paths while maintaining database design integrity.

### 3. Orphan Records
**Problem**: Potential for orphan records after deletions.

**Solution**: Implemented ON DELETE CASCADE on appropriate relationships. For example, deleting a passenger automatically deletes all related bookings.

## 📝 SQL Concepts Demonstrated

### WHERE vs HAVING Clauses

| Clause | Purpose | Execution Stage | Common Use Case |
|--------|---------|----------------|-----------------|
| **WHERE** | Filters individual rows | Before grouping/aggregation | Retrieve specific records based on conditions (e.g., passengers with specific nationality) |
| **HAVING** | Filters grouped results | After GROUP BY operation | Filter aggregated data (e.g., flights with more than one booking) |

**Key Difference**: WHERE filters rows before grouping, while HAVING filters grouped results after aggregation.

## 🎯 Most Useful Query

The following query demonstrates the power of relational databases by combining data from multiple tables to display complete booking information:

```sql
SELECT 
    P.FullName, 
    F.flightNO, 
    A1.name AS OriginAirport, 
    A2.name AS DestinationAirport, 
    B.class, 
    B.pricePaid
FROM Booking B
JOIN Passenger P ON B.PID = P.PID
JOIN Flight F ON B.flightID = F.flightID
JOIN Airport A1 ON F.departsCode = A1.AIRID
JOIN Airport A2 ON F.arrivesAtCode = A2.AIRID;
```

### Why This Query Matters

This query is essential for airline operations because it:
- Provides complete reservation information in a single result
- Combines data from five related tables
- Reflects realistic airline reporting requirements
- Demonstrates advanced SQL JOIN operations
- Delivers actionable business intelligence for customer service and administrative staff

## 🗂️ Database Operations

The project demonstrates proficiency in:
- Table creation with constraints
- Data insertion, updates, and deletions
- Complex multi-table queries
- JOIN operations (INNER, LEFT, etc.)
- GROUP BY and aggregate functions
- Subqueries and nested queries
- Transaction management
- Index optimization

## 📚 Learning Outcomes

Through this project, the following database concepts were mastered:
- Relational database design principles
- Entity-Relationship modeling
- Normalization techniques
- Referential integrity enforcement
- Cascade actions and their implications
- Query optimization
- Real-world database problem-solving


