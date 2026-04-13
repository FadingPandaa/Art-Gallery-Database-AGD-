--Creating a database. 
CREATE DATABASE Art_Gallery

--Use this database.
USE Art_Gallery

--Creating a table for Artist.
CREATE TABLE Artist(
ArtistID INT PRIMARY KEY,
Artist_Name VARCHAR(100) NOT NULL,
Artist_Surname VARCHAR(100) NOT NULL

--Creating a table for Genre.
CREATE TABLE Genre(
GenreID INT PRIMARY KEY,
Genre_Description VARCHAR(100) NOT NULL

--Creating a table for Artwork.
CREATE TABLE Artwork(
ArtworkID INT PRIMARY KEY,
GenreID INT,
ArtistID INT,
Title VARCHAR(100) NOT NULL,
FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)

--Creating a table for Exhibition.
CREATE TABLE Exhibition(
ExhibitionID INT PRIMARY KEY,
Exhibition_Description VARCHAR(100) NOT NULL

--Creating a table for Entry.
CREATE TABLE Entry(
EntryID INT PRIMARY KEY,
ArtworkID INT,
ExhibitionID INT,
FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE,
FOREIGN KEY (ExhibitionID) REFERENCES Exhibition(ExhibitionID)

--Inserting data for Artist.
INSERT INTO Artist (ArtistID, Artist_Name, Artist_Surname) VALUES
(1, 'David', 'Chapelle'),
(2, 'Tshiamo', 'Nkumani'),
(3, 'Shannon', 'Sweetman'),
(4, 'Vincent', 'van Gogh'),
(5, 'Kevin', 'Smith');

--Inserting data for Genre.
INSERT INTO Genre (GenreID, Genre_Description) VALUES
(1, 'Surrealism'),
(2, 'Impressionism'),
(3, 'Cubism');

--Inserting data for Artwork.
INSERT INTO Artwork (ArtworkID, GenreID, ArtistID, Title) VALUES
(1, 1, 1, 'Celestial Sky'),
(2, 3, 2, 'Crevice of Life'),
(3, 2, 3, 'Like Picasso'),
(4, 2, 4, 'Starry Night'),
(5, 1, 5, 'The Son of Man'),
(6, 3, 2, 'Girl with a Mandolin'),
(7, 1, 4, 'The Lovers'),
(8, 3, 1, 'Man with a Guitar'),
(9, 2, 3, 'The Boating Party'),
(10, 1, 5, 'The Menaced Assassin'),
(11, 3, 2, 'Savings'),
(12, 2, 3, 'Water Lilies'),
(13, 3, 1, 'Houses at L’Estaque'),
(14, 2, 1, 'The Floor Scrapers'),
(15, 1, 3, 'The Persistence of Memory'),
(16, 1, 5, 'Objective'),
(17, 3, 3, 'Woman with a Guitar'),
(18, 1, 2, 'Golconda'),
(19, 3, 4, 'Pen no Soda'),
(20, 2, 2, 'African Woman');

--Inserting data for Exhibition.
INSERT INTO Exhibition (ExhibitionID, Exhibition_Description) VALUES
(1, 'The Son of Man'),
(2, 'Starry Night'),
(3, 'Houses at L’Estaque'),
(4, 'The Menaced Assassin'),
(5, 'Golconda'),
(6, 'Celestial Sky'),
(7, 'Crevice of Life'),
(8, 'Like Picasso'),
(9, 'Girl with a Mandolin'),
(10, 'Man with a Guitar'),
(11, 'The Lovers'),
(12, 'The Floor Scrapers'),
(13, 'The Persistence of Memory'),
(14, 'Woman with a Guitar'),
(15, 'African Woman');

--Inserting data for Entry.
INSERT INTO Entry (EntryID, ArtworkID, ExhibitionID) VALUES
(1, 5, 1),
(2, 20, 15),
(3, 14, 12),
(4, 18, 5),
(5, 7, 11);

--Updating artist name.
UPDATE Artist
SET Artist_Name = 'Ntombi'
WHERE ArtistID = 2;
Select * from Artist;

--Deleting artist
DELETE FROM Artist
WHERE Artist_Name IN (SELECT ArtistID FROM Artist WHERE Artist_Name = 'Vincent');
DELETE FROM Artist
WHERE ArtistID = 4;

--Display title, artist name and genre description
SELECT Artwork.Title, Artist.Artist_Name, Genre.Genre_Description
FROM Artwork
JOIN Artist ON Artwork.ArtistID = Artist.ArtistID
JOIN Genre ON Artwork.GenreID = Genre.GenreID
ORDER BY Artwork.Title ASC; --Ascending order
Select * from Artist;

--Display exhibition description and artwork count
SELECT Exhibition_Description, COUNT(*) AS Artwork_Count
FROM Entry
JOIN Exhibition ON Entry.ExhibitionID = Exhibition.ExhibitionID
GROUP BY Exhibition.Exhibition_Description;

--Display artist ID and artwork count
SELECT ArtistID, COUNT(*) AS Artwork_Count
FROM Artwork
GROUP BY ArtistID
HAVING COUNT(*) >= 5; --Greater than or equal to 5

-- Display title, artist name, amd gemre description
SELECT Artwork.Title, Artist.Artist_Name, Genre.Genre_Description
FROM Artwork
JOIN Artist ON Artwork.ArtistID = Artist.ArtistID
JOIN Genre ON Artwork.GenreID = Genre.GenreID;