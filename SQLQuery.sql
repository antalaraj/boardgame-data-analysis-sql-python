--Create and Use Database
CREATE DATABASE BoardGameDB1;
USE BoardGameDB1;

--Check for duplicate records
SELECT boardgame, release_year, COUNT(*) AS cnt
FROM BoardGames
GROUP BY boardgame, release_year
HAVING COUNT(*) > 1;

--Delete duplicate records
DELETE FROM BoardGames
WHERE row_id NOT IN (
    SELECT MIN(row_id)
    FROM BoardGames
    GROUP BY boardgame, release_year
);

--Check invalid or odd play time
SELECT *
FROM BoardGames
WHERE min_playtime > max_playtime
   OR min_playtime <= 0
   OR max_playtime <= 0;

--Fix invalid playtime (set averages for invalid entries)
UPDATE BoardGames
SET min_playtime = (
        SELECT AVG(min_playtime)
        FROM BoardGames
        WHERE min_playtime > 0
    ),
    max_playtime = (
        SELECT AVG(max_playtime)
        FROM BoardGames
        WHERE max_playtime > 0
    )
WHERE min_playtime <= 0
   OR max_playtime <= 0;

--Replace invalid (0) release years with average or fixed year
SELECT AVG(release_year) AS mean_release_year
FROM BoardGames
WHERE release_year > 0;

UPDATE BoardGames
SET release_year = 2013
WHERE release_year = 0;

--Round off decimal values for avg_rating and complexity
UPDATE BoardGames
SET avg_rating = ROUND(avg_rating, 2),
    complexity = ROUND(complexity, 2);


--Replace NULL values in avg_rating with overall average
UPDATE BoardGames
SET avg_rating = (
    SELECT ROUND(AVG(avg_rating), 2)
    FROM BoardGames
    WHERE avg_rating IS NOT NULL
)
WHERE avg_rating IS NULL;

--Replace invalid minimum ages (0) with average age
UPDATE BoardGames
SET minimum_age = (
    SELECT ROUND(AVG(minimum_age), 0)
    FROM BoardGames
    WHERE minimum_age > 0
)
WHERE minimum_age = 0;

--Check board games with missing descriptions
SELECT *
FROM BoardGames
WHERE description = 'No description';

--Replace with Custom Message Including Game Name (More Informative)
UPDATE BoardGames
SET description = CONCAT(boardgame, ' is a popular board game.')
WHERE description = 'No description';


--View complete table
SELECT * FROM BoardGames;

--Top 5 boardgames with highest number of ratings
SELECT TOP 5 boardgame, num_ratings
FROM BoardGames
ORDER BY num_ratings DESC;

--Games with complexity greater than 4.0
SELECT boardgame, complexity
FROM BoardGames
WHERE complexity > 4.0;

--Top 10 games with highest number of fans
SELECT TOP 10 boardgame, fans
FROM BoardGames
ORDER BY fans DESC;

--Average rating per minimum age group
SELECT minimum_age,ROUND(AVG(avg_rating),2) AS avg_rating_per_age
FROM BoardGames
GROUP BY minimum_age
ORDER BY minimum_age;

--Games released before 2000 still in top 500
SELECT boardgame, release_year, rank_overall
FROM BoardGames
WHERE release_year < 2000
  AND rank_overall <= 500;

--Boardgames with page_views > 5,000,000
SELECT boardgame, page_views
FROM BoardGames
WHERE page_views > 5000000;

--Release year with highest average total_plays
SELECT TOP 1 release_year, AVG(total_plays) AS avg_total_plays
FROM BoardGames
GROUP BY release_year
ORDER BY avg_total_plays DESC;

--Games after 2010 where fans above overall average
SELECT boardgame, release_year, fans, num_ratings
FROM BoardGames
WHERE release_year > 2010
  AND fans > (SELECT AVG(fans) FROM BoardGames)
ORDER BY num_ratings DESC;

--Release years where avg total_plays > 100,000 with their avg rating
SELECT release_year, 
       AVG(total_plays) AS avg_total_plays, 
       ROUND(AVG(avg_rating),2) AS avg_rating
FROM BoardGames
GROUP BY release_year
HAVING AVG(total_plays) > 100000;

--Most Popular Games by Total Plays
SELECT TOP 10 boardgame, total_plays, avg_rating
FROM BoardGames
ORDER BY total_plays DESC;

--Most Viewed Games Per Release Year
SELECT release_year, boardgame, page_views
FROM BoardGames b1
WHERE page_views = (
    SELECT MAX(page_views)
    FROM BoardGames b2
    WHERE b2.release_year = b1.release_year
)
ORDER BY release_year DESC;

--Best Games for Kids (Low Minimum Age, High Rating)
SELECT TOP 10 boardgame, minimum_age, avg_rating
FROM BoardGames
WHERE minimum_age <= 8
ORDER BY avg_rating DESC;

--Games with Above-Average Rating but Below-Average Popularity(Hidden gems)
SELECT TOP 5 boardgame, avg_rating, page_views
FROM BoardGames
WHERE avg_rating > (SELECT AVG(avg_rating) FROM BoardGames)
  AND page_views < (SELECT AVG(page_views) FROM BoardGames)
ORDER BY avg_rating DESC;

--Top 5 years with the highest total plays and average ratings
SELECT TOP 5 
    release_year,
    ROUND(AVG(total_plays),0) AS avg_total_plays,
    ROUND(AVG(avg_rating),2) AS avg_rating
FROM BoardGames
GROUP BY release_year
ORDER BY avg_total_plays DESC;


--Compare average rating by playtime length category
SELECT 
    CASE 
        WHEN max_playtime <= 60 THEN 'Short'
        WHEN max_playtime BETWEEN 61 AND 120 THEN 'Medium'
        WHEN max_playtime BETWEEN 121 AND 240 THEN 'Long'
        ELSE 'Very Long'
    END AS PlayTimeCategory,
    ROUND(AVG(avg_rating),2) AS AvgRating
FROM BoardGames
GROUP BY 
    CASE 
        WHEN max_playtime <= 60 THEN 'Short'
        WHEN max_playtime BETWEEN 61 AND 120 THEN 'Medium'
        WHEN max_playtime BETWEEN 121 AND 240 THEN 'Long'
        ELSE 'Very Long'
    END
ORDER BY AvgRating DESC;

-- Average avg_rating by minimum_age buckets (<10, 10-13, 14+)
SELECT
  CASE
    WHEN minimum_age < 10 THEN '<10'
    WHEN minimum_age BETWEEN 10 AND 13 THEN '10-13'
    WHEN minimum_age >= 14 THEN '14+'
    ELSE 'Unknown'
  END AS age_group,
  COUNT(*) AS games_count,
  ROUND(AVG(avg_rating), 2) AS avg_rating
FROM BoardGames
GROUP BY
  CASE
    WHEN minimum_age < 10 THEN '<10'
    WHEN minimum_age BETWEEN 10 AND 13 THEN '10-13'
    WHEN minimum_age >= 14 THEN '14+'
    ELSE 'Unknown'
  END
ORDER BY avg_rating DESC;




