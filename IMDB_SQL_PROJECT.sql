-- USE imdb

-- Question 1 > How many movies are there in the dataset?

SELECT COUNT(*) FROM imdb.`imdb-top-1000`;
 
-- Question 2 > List the titles of all movies released in the year 2000.

SELECT Series_Title FROM imdb.`imdb-top-1000`
WHERE Released_Year = 2000;

-- Question 3 > Retrieve the top 10 movies with the highest IMDb ratings.
SELECT * FROM imdb.`imdb-top-1000`
ORDER BY IMDB_Rating DESC
LIMIT 10;

-- Question 4 > Find all movies with a rating greater than 8.5.
SELECT * FROM imdb.`imdb-top-1000`
WHERE IMDB_Rating > 8.5;

-- Question 5 > List movies that were released after the year 2010 and have a runtime of more than 120 minutes.
SELECT * FROM imdb.`imdb-top-1000`
WHERE Released_Year > 2010 AND Runtime > 120;

-- Question 6 > Find the oldest movie in the dataset.
SELECT * FROM imdb.`imdb-top-1000`
ORDER BY Released_Year 
LIMIT 1;

-- Question 7 > What is the average rating of all movies in the dataset?
SELECT AVG(IMDB_Rating) FROM imdb.`imdb-top-1000`;

-- Question 8 > How many movies have a runtime less than 90 minutes?
SELECT COUNT(*) FROM imdb.`imdb-top-1000`
WHERE Runtime < 90;

-- Question 9 > What is the total number of movies directed by "Christopher Nolan"?
SELECT COUNT(*) FROM imdb.`imdb-top-1000`
WHERE Director = 'Christopher Nolan' ;

-- Question 10 > Find the average rating for movies released each year.
SELECT Released_Year,AVG(IMDB_Rating) FROM imdb.`imdb-top-1000`
GROUP BY Released_Year ;

-- Question 11 > List the number of movies in each genre.
SELECT Genre,Count(*) FROM imdb.`imdb-top-1000`
GROUP BY Genre ;

-- Question 12 > Find the top 5 directors who have directed the most movies.
SELECT Director,COUNT(*) AS Movies_number FROM imdb.`imdb-top-1000`
GROUP BY Director
ORDER BY Movies_number DESC 
LIMIT 5;

-- Question 13 > List all movies that have a higher rating than the average rating of all movies in the dataset.
SELECT * FROM imdb.`imdb-top-1000`
WHERE IMDB_Rating > (SELECT AVG(IMDB_Rating) FROM imdb.`imdb-top-1000`) ; 

-- Question 14 > Find movies that have a runtime longer than the longest movie directed by "Steven Spielberg".
SELECT * FROM imdb.`imdb-top-1000`
WHERE Runtime > (SELECT MAX(Runtime) FROM imdb.`imdb-top-1000`
						WHERE Director  = 'Steven Spielberg') ;
                        
-- Question 15 > Find the 10 most recent movies with a rating above 7.
SELECT * FROM imdb.`imdb-top-1000`
WHERE IMDB_Rating > 7
ORDER BY Released_Year DESC
LIMIT 10 ; 

-- Question 16 > List the top 3 genres with the highest average movie ratings.
SELECT Genre,AVG(IMDB_Rating) AS AEVRAGE_RATING FROM imdb.`imdb-top-1000`
GROUP BY Genre
ORDER BY AEVRAGE_RATING DESC LIMIT 3 ;

-- Question 17 > Which director has directed the most movies in the top 1000?
SELECT Director,COUNT(*) AS num FROM imdb.`imdb-top-1000`
GROUP BY Director
ORDER BY num DESC
LIMIT 1;

-- Question 18 > How many movies were released in each decade?
SELECT Released_Year,COUNT(*) AS num FROM imdb.`imdb-top-1000`
GROUP BY Released_Year
ORDER BY Released_Year DESC ;

-- Question 19 > Which genres have the most movies?
SELECT Genre,COUNT(*) AS num FROM imdb.`imdb-top-1000`
GROUP BY Genre
ORDER BY num DESC
LIMIT 1 ;

-- Question 20 > Which year had the highest average movie rating?
SELECT Released_Year,AVG(IMDB_Rating) AS num FROM imdb.`imdb-top-1000`
GROUP BY Released_Year
ORDER BY num DESC 
LIMIT 1;