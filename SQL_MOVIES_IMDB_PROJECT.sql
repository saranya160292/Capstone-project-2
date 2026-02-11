CREATE DATABASE imdb_movies;
USE imdb_movies;
SELECT * FROM directors;

/*===============================================
       a) CAN YOU GET ALL DATA ABOUT MOVIES 
=================================================*/   
 USE imdb_movies;
 SELECT * FROM movies;
 
/*===================================================
        b)	How do you get all data about directors?
====================================================*/
   USE imdb_movies;
   SELECT * FROM directors;
   
/*=====================================================
        c)	Check how many movies are present in IMDB.    here used COUNT function
=======================================================*/
   SELECT COUNT(title) AS Total_Movies
   FROM movies;
   
/*=================================================================
        d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo -- here used WHERE function 
===================================================================*/
   SELECT * FROM directors
    WHERE Name IN ('James Cameron', 'Luc Besson', 'John Woo');
   
/*===================================================================
         e)	Find all directors with name starting with S.      here used like function
======================================================================*/
   SELECT * FROM directors
      WHERE name LIKE 'S%';
      
/*====================================================================
          f)	Count female directors.        here use count,alias and where functions
=======================================================================*/
    SELECT COUNT(*) AS Total_Female_Directors
    FROM directors
    WHERE gender = 1;
   
/*==========================================================================
		 g)	Find the name of the 10th first women directors?    here order by function
============================================================================*/
   SELECT name FROM directors
    WHERE gender = 1
    ORDER BY id
	LIMIT 1 OFFSET 9;
    
/*==========================================================================
          h)	What are the 3 most popular movies?     Here we used DESF and order by,limit
===========================================================================*/
    SELECT title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

/*================================================================================
          i)	What are the 3 most bankable movies?
======================================================================*/
      SELECT title, revenue
       FROM movies
	   ORDER BY revenue DESC
		LIMIT 3;

/*==============================================================
           j)	What is the most awarded average vote since the January 1st, 2000?
===================================================================*/
SELECT title, vote_average
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

/*=============================================================
           k)	Which movie(s) were directed by Brenda Chapman?
==============================================================*/
SELECT m.title
FROM movies m
LEFT JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';
   
/*=============================================================
            l)	Which director made the most movies?
==========================================================*/
   SELECT d.name, COUNT(m.id) AS total_movies
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.name
ORDER BY total_movies DESC
LIMIT 1;

/*=============================================================
             m)	Which director is the most bankable?
=============================================================*/
SELECT d.name, SUM(m.revenue) AS total_revenue
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.name
ORDER BY total_revenue DESC
LIMIT 1;
 