CREATE DATABASE TravelClassics;
GO


USE TravelClassics;
GO


-- Create Hotel Table
CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY,
    HotelName NVARCHAR(255),
    Country NVARCHAR(255),
    City NVARCHAR(255),
    Street NVARCHAR(255),
    LoggingInfo NVARCHAR(255)
);
GO
-- Insert Sample Records into Hotel Table
INSERT INTO Hotel (HotelID, HotelName, Country, City, Street, LoggingInfo)
VALUES 
(1, 'Hotel A', 'Sri Lanka', 'Kandy', 'A', 'LoggingInfo A'),
(2, 'Hotel B', 'Sri Lanka', 'Colombo', 'Street B', 'LoggingInfo B'),
(3, 'Hotel C', 'France', 'Paris', 'Street C', 'LoggingInfo C'),
(4, 'Hotel D', 'Germany', 'Berlin', 'Street D', 'LoggingInfo D'),
(5, 'Hotel E', 'Italy', 'Rome', 'Street E', 'LoggingInfo E'),
(6, 'Hotel F', 'Spain', 'Madrid', 'Street F', 'LoggingInfo F'),
(7, 'Hotel G', 'Australia', 'Sydney', 'Street G', 'LoggingInfo G'),
(8, 'Hotel H', 'Japan', 'Tokyo', 'Street H', 'LoggingInfo H'),
(9, 'Hotel I', 'Canada', 'Toronto', 'Street I', 'LoggingInfo I'),
(10, 'Hotel J', 'Brazil', 'Rio de Janeiro', 'Street J', 'LoggingInfo J'),
(11, 'Hotel K', 'India', 'Mumbai', 'Street K', 'LoggingInfo K'),
(12, 'Hotel L', 'China', 'Beijing', 'Street L', 'LoggingInfo L'),
(13, 'Hotel M', 'South Africa', 'Cape Town', 'Street M', 'LoggingInfo M'),
(14, 'Hotel N', 'Russia', 'Moscow', 'Street N', 'LoggingInfo N'),
(15, 'Hotel O', 'Mexico', 'Mexico City', 'Street O', 'LoggingInfo O');
GO








-- Create Facility Table
CREATE TABLE Facility (
    FacilityID INT PRIMARY KEY,
    FacilityName NVARCHAR(255),
    Description NVARCHAR(255)
);
GO

-- Insert Sample Records into Facility Table
INSERT INTO Facility (FacilityID, FacilityName, Description)
VALUES 
(1, 'Swimming Pool', 'Outdoor Pool'),
(2, 'Gymnasium', 'Fully-equipped gym'),
(3, 'Spa', 'Relaxation and wellness center'),
(4, 'Restaurant', 'On-site dining'),
(5, 'WiFi', 'Free high-speed internet'),
(6, 'Parking', 'Free parking available'),
(7, 'Bar', 'Lounge and bar services'),
(8, 'Conference Room', 'Meeting and event facilities'),
(9, 'Laundry', 'Laundry and dry cleaning services'),
(10, 'Airport Shuttle', 'Complimentary airport shuttle'),
(11, 'Room Service', 'In-room dining available'),
(12, 'Pet-friendly', 'Pet-friendly accommodations'),
(13, 'Business Center', 'Business services and facilities'),
(14, '24/7 Reception', '24-hour front desk services'),
(15, 'Fitness Classes', 'Fitness classes and programs');
GO









-- Create HotelFacility Bridge Table
CREATE TABLE HotelFacility (
    HotelID INT,
    FacilityID INT,
    PRIMARY KEY (HotelID, FacilityID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
    FOREIGN KEY (FacilityID) REFERENCES Facility(FacilityID)
);
GO

-- Insert Sample Records into HotelFacility Table
INSERT INTO HotelFacility (HotelID, FacilityID)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(7, 12),
(7, 13),
(8, 14),
(8, 15);
GO






-- Create Accommodation Table
CREATE TABLE Accommodation (
    AccommodationID INT PRIMARY KEY,
    HotelID INT,
    Category NVARCHAR(255),
    AvailableRooms INT,
    Description NVARCHAR(255),
    Conditions NVARCHAR(255),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);
GO

-- Insert Sample Records into Accommodation Table
INSERT INTO Accommodation (AccommodationID, HotelID, Category, AvailableRooms, Description, Conditions)
VALUES 
(1, 1, 'Standard', 50, 'Standard Room', 'Non-smoking'),
(2, 2, 'Deluxe', 30, 'Deluxe Room', 'King bed'),
(3, 3, 'Suite', 20, 'Executive Suite', 'City view'),
(4, 4, 'Standard', 40, 'Standard Room', 'Balcony'),
(5, 5, 'Superior', 35, 'Superior Room', 'Sea view'),
(6, 6, 'Deluxe', 25, 'Deluxe Room', 'Mountain view'),
(7, 7, 'Suite', 15, 'Executive Suite', 'Pool view'),
(8, 8, 'Standard', 45, 'Standard Room', 'Garden view'),
(9, 9, 'Superior', 40, 'Superior Room', 'City view'),
(10, 10, 'Suite', 20, 'Executive Suite', 'Lake view'),
(11, 11, 'Standard', 35, 'Standard Room', 'City view'),
(12, 12, 'Deluxe', 30, 'Deluxe Room', 'Garden view'),
(13, 13, 'Suite', 15, 'Executive Suite', 'Ocean view'),
(14, 14, 'Superior', 40, 'Superior Room', 'Mountain view'),
(15, 15, 'Standard', 50, 'Standard Room', 'City view');
GO










-- Create Room Table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    AccommodationID INT,
    RoomType NVARCHAR(255),
    Price DECIMAL(10, 2),
    FOREIGN KEY (AccommodationID) REFERENCES Accommodation(AccommodationID)
);
GO

-- Insert Sample Records into Room Table
INSERT INTO Room (RoomID, AccommodationID, RoomType, Price)
VALUES 
(1, 1, 'Single', 100.00),
(2, 1, 'Double', 150.00),
(3, 2, 'Single', 200.00),
(4, 2, 'Double', 250.00),
(5, 3, 'Single', 300.00),
(6, 4, 'Single', 120.00),
(7, 4, 'Double', 180.00),
(8, 5, 'Single', 250.00),
(9, 5, 'Double', 350.00),
(10, 6, 'Single', 180.00),
(11, 6, 'Double', 270.00),
(12, 7, 'Single', 320.00),
(13, 7, 'Double', 420.00),
(14, 8, 'Single', 150.00),
(15, 8, 'Double', 220.00);
GO










-- Create Traveler Table
CREATE TABLE Traveler (
    TravelerID INT PRIMARY KEY,
    Name NVARCHAR(255),
    Address NVARCHAR(255),
    Email NVARCHAR(255),
    Country NVARCHAR(255),
    RegistrationDate DATE
);
GO

-- Insert Sample Records into Traveler Table
INSERT INTO Traveler (TravelerID, Name, Address, Email, Country, RegistrationDate)
VALUES 
(1, 'John', '123 Main St', 'john@gmail.com', 'USA', '2022-01-01'),
(2, 'Jane', '456 Main St', 'jane@gmail.com', 'UK', '2022-01-02'),
(3, 'Alice', '789 Main St', 'alice@gmail.com', 'France', '2022-01-03'),
(4, 'Bob', '101 Main St', 'bob@gmail.com', 'Germany', '2022-01-04'),
(5, 'Emily', '111 Main St', 'emily@gmail.com', 'Italy', '2022-01-05'),
(6, 'Michael', '222 Main St', 'michael@gmail.com', 'Spain', '2022-01-06'),
(7, 'Sarah', '333 Main St', 'sarah@gmail.com', 'Australia', '2022-01-07'),
(8, 'William', '444 Main St', 'william@gmail.com', 'Japan', '2022-01-08'),
(9, 'Laura', '555 Main St', 'laura@gmail.com', 'Canada', '2022-01-09'),
(10, 'Charles', '666 Main St', 'charles@gmail.com', 'Brazil', '2022-01-10'),
(11, 'Linda', '777 Main St', 'linda@gmail.com', 'India', '2022-01-11'),
(12, 'Thomas', '888 Main St', 'thomas@gmail.com', 'China', '2022-01-12'),
(13, 'Karen', '999 Main St', 'karen@gmail.com', 'South Africa', '2022-01-13'),
(14, 'Mark', '1010 Main St', 'mark@gmail.com', 'Russia', '2022-01-14'),
(15, 'Jessica', '1111 Main St', 'jessica@gmail.com', 'Mexico', '2022-01-15');
GO










-- Create Report Table
CREATE TABLE Report (
    ReportID INT PRIMARY KEY,
    TravelerID INT,
    Country NVARCHAR(255),
    Location NVARCHAR(255),
    Title NVARCHAR(255),
    Description NVARCHAR(1000),
    PostDate DATE,
    FOREIGN KEY (TravelerID) REFERENCES Traveler(TravelerID)
);
GO

-- Insert Sample Records into Report Table
INSERT INTO Report (ReportID, TravelerID, Country, Location, Title, Description, PostDate)
VALUES 
(1, 1, 'USA', 'New York', 'Trip to New York', 'Had a great time exploring the city!', '2022-02-01'),
(2, 2, 'UK', 'London', 'Visit to London', 'Enjoyed sightseeing and trying local cuisine.', '2022-02-02'),
(3, 3, 'France', 'Paris', 'Parisian Adventure', 'Loved the culture, food, and landmarks.', '2022-02-03'),
(4, 4, 'Germany', 'Berlin', 'Berlin Experience', 'Visited historical sites and enjoyed German cuisine.', '2022-02-04'),
(5, 5, 'Italy', 'Rome', 'Roman Holiday', 'Explored ancient ruins and enjoyed Italian food.', '2022-02-05'),
(6, 6, 'Spain', 'Madrid', 'Madrid Exploration', 'Loved the architecture and tapas.', '2022-02-06'),
(7, 7, 'Australia', 'Sydney', 'Sydney Adventure', 'Enjoyed the beaches and Opera House.', '2022-02-07'),
(8, 8, 'Japan', 'Tokyo', 'Tokyo Trip', 'Visited shrines, enjoyed sushi, and experienced Japanese culture.', '2022-02-08'),
(9, 9, 'Canada', 'Toronto', 'Toronto Visit', 'Explored the city and enjoyed Canadian hospitality.', '2022-02-09'),
(10, 10, 'Brazil', 'Rio de Janeiro', 'Rio Experience', 'Enjoyed the Carnival and beautiful beaches.', '2022-02-10'),
(11, 11, 'India', 'Mumbai', 'Mumbai Trip', 'Visited landmarks and enjoyed Indian cuisine.', '2022-02-11'),
(12, 12, 'China', 'Beijing', 'Beijing Adventure', 'Explored historical sites and tasted local dishes.', '2022-02-12'),
(13, 13, 'South Africa', 'Cape Town', 'Cape Town Visit', 'Loved the scenic views and cultural experiences.', '2022-02-13'),
(14, 14, 'Russia', 'Moscow', 'Moscow Trip', 'Visited Red Square and enjoyed Russian cuisine.', '2022-02-14'),
(15, 15, 'Mexico', 'Mexico City', 'Mexico City Exploration', 'Explored the city and enjoyed Mexican food.', '2022-02-15');
GO











-- Create Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    TravelerID INT,
    AccommodationID INT,
    NoOfGuests INT,
    ReservationDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus NVARCHAR(50),
    FOREIGN KEY (TravelerID) REFERENCES Traveler(TravelerID),
    FOREIGN KEY (AccommodationID) REFERENCES Accommodation(AccommodationID)
);
GO

-- Insert Sample Records into Reservation Table
INSERT INTO Reservation (ReservationID, TravelerID, AccommodationID, NoOfGuests, ReservationDate, TotalAmount, PaymentStatus)
VALUES 
(1, 1, 1, 2, '2022-03-01', 300.00, 'Paid'),
(2, 2, 2, 1, '2022-03-02', 250.00, 'Paid'),
(3, 3, 3, 1, '2022-03-03', 300.00, 'Paid'),
(4, 4, 4, 2, '2022-03-04', 400.00, 'Paid'),
(5, 5, 5, 1, '2022-03-05', 350.00, 'Paid'),
(6, 6, 6, 1, '2022-03-06', 270.00, 'Paid'),
(7, 7, 7, 2, '2022-03-07', 740.00, 'Paid'),
(8, 8, 8, 1, '2022-03-08', 370.00, 'Paid'),
(9, 9, 9, 1, '2022-03-09', 400.00, 'Paid'),
(10, 10, 10, 2, '2022-03-10', 540.00, 'Paid'),
(11, 11, 11, 1, '2022-03-11', 300.00, 'Paid'),
(12, 12, 12, 2, '2022-03-12', 600.00, 'Paid'),
(13, 13, 13, 1, '2022-03-13', 420.00, 'Paid'),
(14, 14, 14, 2, '2022-03-14', 740.00, 'Paid'),
(15, 15, 15, 1, '2022-03-15', 370.00, 'Paid');
GO








-- Create Transaction Table
CREATE TABLE [Transaction] (
    TransactionID INT PRIMARY KEY,
    ReservationID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);
GO

-- Insert Sample Records into [Transaction] Table
INSERT INTO [Transaction] (TransactionID, ReservationID, Date, Time)
VALUES 
(1, 1, '2022-03-01', '10:00:00'),
(2, 2, '2022-03-02', '11:00:00'),
(3, 3, '2022-03-03', '12:00:00'),
(4, 4, '2022-03-04', '13:00:00'),
(5, 5, '2022-03-05', '14:00:00'),
(6, 6, '2022-03-06', '15:00:00'),
(7, 7, '2022-03-07', '16:00:00'),
(8, 8, '2022-03-08', '17:00:00'),
(9, 9, '2022-03-09', '18:00:00'),
(10, 10, '2022-03-10', '19:00:00'),
(11, 11, '2022-03-11', '20:00:00'),
(12, 12, '2022-03-12', '21:00:00'),
(13, 13, '2022-03-13', '22:00:00'),
(14, 14, '2022-03-14', '23:00:00'),
(15, 15, '2022-03-15', '23:59:59');
GO





select * from Hotel;

select * from Facility;

select * from HotelFacility;

select * from Accommodation;

select * from room;

select * from Traveler;

select * from Report;

select * from Reservation;

select * from [Transaction];
