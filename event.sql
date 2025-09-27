
-- Event Management System SQL Schema & Sample Data

-- 1. Venues Table
CREATE TABLE Venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    capacity INT
);

-- 2. Organizers Table
CREATE TABLE Organizer (
    organizer_id INT PRIMARY KEY AUTO_INCREMENT,
    organizer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- 3. Events Table
CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE,
    event_type VARCHAR(50),
    budget DECIMAL(12,2),
    venue_id INT,
    organizer_id INT,
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES Organizer(organizer_id)
);

-- 4. Attendees Table
CREATE TABLE Attendee (
    attendee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- 5. Registration Table (Event-Attendee link; many-to-many)
CREATE TABLE Registration (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    attendee_id INT,
    seat_number VARCHAR(10),
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendee(attendee_id)
);

-- Sample Data for Demonstration ---------------------------------------

-- Venues
INSERT INTO Venue (venue_name, location, capacity) VALUES
('Grand Hall', 'City Center', 500),
('Open Ground', 'West Side', 1000);

-- Organizers
INSERT INTO Organizer (organizer_name, email, phone) VALUES
('Tech Society', 'techsoc@gmail.com', '9876543210'),
('Youth Forum', 'yf@gmail.com', '9123456780');

-- Events
INSERT INTO Event (event_name, event_date, event_type, budget, venue_id, organizer_id) VALUES
('Tech Conference', '2025-10-10', 'Conference', 150000.00, 1, 1),
('Music Fest', '2025-11-05', 'Festival', 200000.00, 2, 2);

-- Attendees
INSERT INTO Attendee (name, email, phone) VALUES
('Alice Kumar', 'alice@gmail.com', '8888888888'),
('Rahul Verma', 'rahul@gmail.com', '9999999999'),
('Sneha Patel', 'sneha@gmail.com', '7777777777');

-- Registrations
INSERT INTO Registration (event_id, attendee_id, seat_number) VALUES
(1, 1, 'A1'),
(1, 2, 'A2'),
(2, 3, 'B1');

-- Useful SQL Queries --------------------------------------------------

-- 1. List all attendees for a specific event
SELECT E.event_name, A.name
FROM Event E
JOIN Registration R ON E.event_id = R.event_id
JOIN Attendee A ON R.attendee_id = A.attendee_id
WHERE E.event_id = 1;

-- 2. Show upcoming events at a specific venue
SELECT event_name, event_date
FROM Event
WHERE venue_id = 2 AND event_date > CURDATE();

-- 3. List all events and their organizers
SELECT E.event_name, O.organizer_name
FROM Event E
JOIN Organizer O ON E.organizer_id = O.organizer_id;

-- 4. Find all events happening today
SELECT event_name, event_date
FROM Event
WHERE event_date = CURDATE();

-- End of File

