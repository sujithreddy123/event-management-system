--
-- Table structure for table `users`
--
CREATE TABLE Venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    capacity INT
);


--
-- Dumping data for table `venues`
--
INSERT INTO Venue (venue_name, location, capacity) VALUES
('Grand Hall', 'City Center', 500),
('Open Ground', 'West Side', 1000);


