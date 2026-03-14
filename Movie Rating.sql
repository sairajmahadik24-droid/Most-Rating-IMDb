CREATE DATABASE movie_analysis;

CREATE TABLE movies (
Rank_ID INT,
Title VARCHAR(255),
Genre VARCHAR(255),
Description TEXT,
Director VARCHAR(100),
Actors TEXT,
Year INT,
Runtime_Minutes INT,
Rating FLOAT,
Votes INT,
Revenue_Millions FLOAT,
Metascore INT
);

SHOW TABLES;

SELECT *
FROM movies
LIMIT 10;

# Total Movies in Dataset
SELECT COUNT(*) AS total_movies
FROM movies;

# Average Movie Rating
SELECT ROUND(AVG(Rating),2) AS avg_movie_rating
FROM movies;

# Top 10 Highest Rated Movies
SELECT Title, Director, Rating
FROM movies
ORDER BY Rating DESC
LIMIT 10;

# Top 10 Highest Revenue Movies
SELECT Title, Revenue_Millions
FROM movies
ORDER BY Revenue_Millions DESC
LIMIT 10;

# Average Revenue per Movie
SELECT ROUND(AVG(Revenue_Millions),2) AS avg_revenue
FROM movies;

# Movies Released Each Year
SELECT Year, COUNT(*) AS movies_released
FROM movies
GROUP BY Year
ORDER BY Year;

# Average Rating by Year
SELECT Year, ROUND(AVG(Rating),2) AS avg_rating
FROM movies
GROUP BY Year
ORDER BY Year;

# Top Directors by Number of Movies
SELECT Director, COUNT(*) AS total_movies
FROM movies
GROUP BY Director
ORDER BY total_movies DESC
LIMIT 10;

# Directors with Highest Average Rating
SELECT Director, ROUND(AVG(Rating),2) AS avg_rating
FROM movies
GROUP BY Director
ORDER BY avg_rating DESC
LIMIT 10;

# Most Popular Movies by Votes
SELECT Title, Votes
FROM movies
ORDER BY Votes DESC
LIMIT 10;

# Average Runtime of Movies
SELECT ROUND(AVG(Runtime_Minutes),2) AS avg_runtime
FROM movies;

# Longest Movies
SELECT Title, Runtime_Minutes
FROM movies
ORDER BY Runtime_Minutes DESC
LIMIT 10;

# Movies with Rating Above 8
SELECT Title, Rating
FROM movies
WHERE Rating > 8
ORDER BY Rating DESC;

# Revenue vs Rating Relationship
SELECT Rating,
ROUND(AVG(Revenue_Millions),2) AS avg_revenue
FROM movies
GROUP BY Rating
ORDER BY Rating DESC;

# Best Movie Each Year (Advanced Query)
SELECT Year, Title, Rating
FROM (
    SELECT Year, Title, Rating,
    RANK() OVER (PARTITION BY Year ORDER BY Rating DESC) AS rank_num
    FROM movies
) ranked_movies
WHERE rank_num = 1;