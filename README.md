👨‍💻Author: Keabetswe Masole

Software Used: SQL Server Management Studio 20

------------------
📌 Overview

This project creates a relational database for an art gallery. It stores information about artists, their artworks, associated genres, and exhibitions, allowing efficient data management and retrieval.

-----------------------
**🧠 Database Structure**

📍 Tables

-> Artist
  * ArtistID (Primary Key)
  * Artist_Name
  * Artist_Surname

-> Genre
  * GenreID (Primary Key)
  * Genre_Description

-> Artwork
  * ArtworkID (Primary Key)
  * GenreID (Foreign Key)
  * ArtistID (Foreign Key)
  * Title

-> Exhibition
  * ExhibitionID (Primary Key)
  * Exhibition_Description

-> Entry
  * EntryID (Primary Key)
  * ArtworkID (Foreign Key)
  * ExhibitionID (Foreign Key)
  * Supports cascading delete for artworks

------------------
⚙️ Features

- Relational database with multiple linked tables
- Data insertion, updating, and deletion
- Use of primary keys and foreign keys
- Cascading delete functionality
- Data retrieval using joins, grouping, and filtering

-------------------
▶️ How to Run

1. Open your MySQL
2. Copy and paste the SQL script
3. Execute the script
4. Run the queries to view and analyze the data

---------------------
**🔍 Sample Queries**

📌 Display artwork details with artist and genre:

SELECT Artwork.Title, Artist.Artist_Name, Genre.Genre_Description
FROM Artwork
JOIN Artist ON Artwork.ArtistID = Artist.ArtistID
JOIN Genre ON Artwork.GenreID = Genre.GenreID
ORDER BY Artwork.Title ASC; --In ascending order

📌 Count artworks per exhibition:

SELECT Exhibition_Description, COUNT(*) AS Artwork_Count
FROM Entry
JOIN Exhibition ON Entry.ExhibitionID = Exhibition.ExhibitionID
GROUP BY Exhibition.Exhibition_Description;

📌 Artists with 5 or more artworks:

SELECT ArtistID, COUNT(*) AS Artwork_Count
FROM Artwork
GROUP BY ArtistID
HAVING COUNT(*) >= 5;

--------------------------------------------
🚀 Future Improvements

- Add customer/visitor table
- Track artwork sales and pricing
- Add dates for exhibitions
