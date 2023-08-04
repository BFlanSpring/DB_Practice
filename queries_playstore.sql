-- Comments in SQL Start with dash-dash --
SELECT * FROM analytics WHERE id = 1800;

SELECT id, app_name
FROM analytics
WHERE last_updated = '2018-08-01';

SELECT category, COUNT(*) AS count
FROM analytics
GROUP BY category;

SELECT app_name, reviews
FROM analytics
ORDER BY reviews DESC
LIMIT 5;

SELECT app_name, reviews, rating
FROM analytics
WHERE rating >= 4.8
ORDER BY reviews DESC
LIMIT 1;

SELECT category, AVG(rating) AS avg_rating
FROM analytics
GROUP BY category
ORDER BY avg_rating DESC;

SELECT app_name, price, rating 
FROM analytics 
WHERE rating < 3
ORDER BY price DESC;
LIMIT 1;

SELECT app_name, rating
FROM analytics
WHERE min_installs <= 50 AND rating IS NOT NULL
ORDER BY rating DESC;


SELECT app_name, rating, reviews
FROM analytics 
WHERE reviews >= 10000 AND rating <3;

SELECT app_name, reviews, price
FROM analytics
WHERE price >=0.1 AND price <= 1.00
ORDER BY reviews DESC
LIMIT 10;

SELECT app_name, last_updated
FROM analytics
WHERE last_updated = (SELECT MAX(last_updated) FROM analytics);

SELECT app_name, price
FROM analytics
WHERE price = (SELECT MAX(price) FROM analytics);

SELECT SUM(reviews) AS total_reviews
FROM analytics

SELECT category, COUNT(*) AS num_apps
FROM analytics
GROUP BY category
HAVING COUNT(*) > 300;

SELECT app_name, reviews, min_installs, min_installs::float / reviews AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;


SELECT app_name, category, rating
FROM (
  SELECT app_name, category, rating,
         RANK() OVER (PARTITION BY category ORDER BY rating DESC) as rank
  FROM analytics
  WHERE min_installs >= 50000
) AS ranked_apps
WHERE rank = 1;


SELECT app_name, category, rating
FROM analytics
WHERE app_name ILIKE '%facebook%';


SELECT app_name, category, rating, genres
FROM analytics
WHERE array_length(genres, 1) > 1;


SELECT app_name, category, rating, genres
FROM analytics
WHERE 'education' = ANY (genres);
