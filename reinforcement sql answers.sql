select * from movie;
select * from genre;
select * from director_mapping;
select * from role_mapping;
select * from names;
select * from ratings;

/*1*/
SELECT 'Movie' AS Table_Name, COUNT(*) AS Total_Records FROM Movie
UNION ALL
SELECT 'Genre', COUNT(*) FROM Genre
UNION ALL
SELECT 'Director Mapping', COUNT(*) FROM Director_Mapping
UNION ALL
SELECT 'Role Mapping', COUNT(*) FROM Role_Mapping
UNION ALL
SELECT 'Names', COUNT(*) FROM Names
UNION ALL
SELECT 'Ratings', COUNT(*) FROM Ratings;

/*2*/
SELECT 
    'title' AS Column_Name, COUNT(*) AS Null_Count FROM Movie WHERE title IS NULL
UNION ALL
SELECT 
    'year', COUNT(*) FROM Movie WHERE year IS NULL
UNION ALL
SELECT 
    'duration', COUNT(*) FROM Movie WHERE duration IS NULL
UNION ALL
SELECT 
    'country', COUNT(*) FROM Movie WHERE country IS NULL
UNION ALL
SELECT 
    'worlwide_gross_income', COUNT(*) FROM Movie WHERE worlwide_gross_income IS NULL
UNION ALL
SELECT 
    'languages', COUNT(*) FROM Movie WHERE languages IS NULL
UNION ALL
SELECT 
    'production_company', COUNT(*) FROM Movie WHERE production_company IS NULL;

/*3*/
ALTER TABLE Movie CHANGE COLUMN year release_year INT;

SELECT release_year, COUNT(*) AS total_movies
FROM Movie
GROUP BY release_year
ORDER BY release_year;

SELECT 
    YEAR(date_published) AS release_year, 
    MONTH(date_published) AS release_month, 
    COUNT(*) AS total_movies
FROM Movie
GROUP BY YEAR(date_published), MONTH(date_published)
ORDER BY release_year,total_movies DESC;

/*4*/
SELECT COUNT(*) AS total_movies
FROM Movie
WHERE country IN ('USA', 'India') 
AND release_year = 2019;

/*5*/
SELECT DISTINCT genre FROM Genre;

/*6*/
SELECT genre, COUNT(movie_id) AS total_movies
FROM Genre
GROUP BY genre
ORDER BY total_movies DESC
LIMIT 1;

/*7*/
SELECT genre, AVG(duration) AS avg_duration
FROM Movie 
JOIN Genre  ON movie_id = id
GROUP BY genre
ORDER BY avg_duration DESC;

/*8*/
SELECT n.name, COUNT(r.movie_id) AS num_movies, AVG(r.avg_rating) AS avg_rating
FROM Role_Mapping rm
JOIN Names n ON rm.name_id = n.id
JOIN Ratings r ON rm.movie_id = r.movie_id
WHERE rm.category = 'Actor' 
AND r.avg_rating < 5
GROUP BY n.name
HAVING COUNT(r.movie_id) > 3
ORDER BY num_movies DESC;

/*9*/
SELECT 
    MIN(avg_rating) AS min_avg_rating, MAX(avg_rating) AS max_avg_rating,
    MIN(total_votes) AS min_total_votes, MAX(total_votes) AS max_total_votes,
    MIN(median_rating) AS min_median_rating, MAX(median_rating) AS max_median_rating
FROM Ratings;

/*10*/
SELECT m.title, r.avg_rating
FROM Movie m
JOIN Ratings r ON m.id = r.movie_id
ORDER BY r.avg_rating DESC
LIMIT 10;

/*11*/
SELECT 
    median_rating, 
    COUNT(movie_id) AS total_movies,
    AVG(avg_rating) AS avg_of_avg_ratings,
    SUM(total_votes) AS total_votes
FROM Ratings
GROUP BY median_rating
ORDER BY median_rating DESC;

/*12*/
SELECT COUNT(DISTINCT m.id) AS total_movies
FROM Movie m
JOIN Genre g ON m.id = g.movie_id
JOIN Ratings r ON m.id = r.movie_id
WHERE m.country = 'USA'
AND m.release_year = 2017
AND MONTH(m.date_published) = 3
AND r.total_votes > 1000
AND g.genre = 'Drama';  

/*13*/
SELECT g.genre, m.title, r.avg_rating
FROM Movie m
JOIN Genre g ON m.id = g.movie_id
JOIN Ratings r ON m.id = r.movie_id
WHERE m.title LIKE 'The %'  -- Titles that start with "The"
AND r.avg_rating > 8
ORDER BY g.genre, r.avg_rating DESC;

/*14*/
SELECT COUNT(m.id) AS total_movies
FROM Movie m
JOIN Ratings r ON m.id = r.movie_id
WHERE m.date_published BETWEEN '2018-04-01' AND '2019-04-01'
AND r.median_rating = 8;


/*15*/
SELECT 
    m.country,
    AVG(r.total_votes) AS avg_votes
FROM Movie m
JOIN Ratings r ON m.id = r.movie_id
WHERE m.country IN ('Germany', 'Italy')
GROUP BY m.country;


/*16*/
SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_nulls,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS name_nulls,
    SUM(CASE WHEN height IS NULL THEN 1 ELSE 0 END) AS height_nulls,
    SUM(CASE WHEN date_of_birth IS NULL THEN 1 ELSE 0 END) AS dob_nulls,
    SUM(CASE WHEN known_for_movies IS NULL THEN 1 ELSE 0 END) AS known_for_movies_nulls
FROM Names;


/*17*/
SELECT n.name, COUNT(DISTINCT rm.movie_id) AS total_movies
FROM Role_Mapping rm
JOIN Names n ON rm.name_id = n.id
JOIN Ratings r ON rm.movie_id = r.movie_id
WHERE rm.category = 'actor' 
AND r.median_rating >= 8
GROUP BY n.name
ORDER BY total_movies DESC
LIMIT 2;

/*18*/
SELECT 
    m.production_company, 
    SUM(r.total_votes) AS total_votes_received
FROM Movie m
JOIN Ratings r ON m.id = r.movie_id
WHERE m.production_company IS NOT NULL
GROUP BY m.production_company
ORDER BY total_votes_received DESC
LIMIT 3;

/*19*/
SELECT COUNT(*) AS total_directors
FROM (
    SELECT dm.name_id, COUNT(dm.movie_id) AS movie_count
    FROM Director_Mapping dm
    GROUP BY dm.name_id
    HAVING COUNT(dm.movie_id) > 3
) AS director_counts;

/*20*/
SELECT 
    rm.category,
    AVG(n.height) AS avg_height
FROM Role_Mapping rm
JOIN Names n ON rm.name_id = n.id
WHERE rm.category IN ('actor', 'actress') 
AND n.height IS NOT NULL
GROUP BY rm.category;


/*21*/
SELECT 
    m.title, 
    m.country, 
    n.name AS director, 
    m.release_year
FROM Movie m
JOIN Director_Mapping dm ON m.id = dm.movie_id
JOIN Names n ON dm.name_id = n.id
ORDER BY m.release_year ASC
LIMIT 10;


/*22*/
SELECT 
    m.title, 
    GROUP_CONCAT(g.genre ORDER BY g.genre SEPARATOR ', ') AS genres, 
    r.total_votes
FROM Movie m
JOIN Ratings r ON m.id = r.movie_id
JOIN Genre g ON m.id = g.movie_id
GROUP BY m.id, m.title, r.total_votes
ORDER BY r.total_votes DESC
LIMIT 5;


/*23*/
SELECT 
    m.title, 
    m.production_company, 
    GROUP_CONCAT(g.genre ORDER BY g.genre SEPARATOR ', ') AS genres, 
    m.duration
FROM Movie m
JOIN Genre g ON m.id = g.movie_id
WHERE m.duration = (SELECT MAX(duration) FROM Movie)
GROUP BY m.id, m.title, m.production_company, m.duration;


/*24*/
SELECT 
    m.title, 
    r.total_votes
FROM Movie m
JOIN Ratings r ON m.id = r.movie_id
WHERE m.release_year = 2018
ORDER BY r.total_votes DESC;

/*25*/
SELECT 
    m.languages, 
    COUNT(*) AS movie_count
FROM Movie m
WHERE m.languages IS NOT NULL
GROUP BY m.languages
ORDER BY movie_count DESC
LIMIT 1;

