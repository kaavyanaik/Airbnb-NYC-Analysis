-- File: 04_analysis_queries.sql
-- Purpose: Core analysis queries for Airbnb NYC listings
-- Author: Kavya Naik
-- Date: 2025-06-17

-- ======================================================
-- BASIC ANALYSIS: Listing Counts, Room Types, and Prices
-- ======================================================


-- Q1: How many listings are available in each borough (neighbourhood_group)?
SELECT neighbourhood_group, COUNT(*) AS total_listings
FROM airbnb_cleaned
GROUP BY neighbourhood_group
ORDER BY total_listings DESC;

-- Q2: What is the average price of listings by room type?
SELECT room_type, AVG(price) AS avg_price
FROM airbnb_cleaned
GROUP BY room_type;


-- Q3: How many listings are there for each room type in each borough?
select neighbourhood_group,room_type, COUNT(*) AS listing_count
FROM airbnb_cleaned
GROUP BY neighbourhood_group, room_type
ORDER BY neighbourhood_group, listing_count DESC;

-- Q4: What is the distribution of listings by price range (e.g., 0–100, 101–200, etc.)?
SELECT 
    CASE 
        WHEN price BETWEEN 0 AND 100 THEN '0–100'
        WHEN price BETWEEN 101 AND 200 THEN '101–200'
        WHEN price BETWEEN 201 AND 300 THEN '201–300'
        WHEN price BETWEEN 301 AND 500 THEN '301–500'
        ELSE '500+' 
    END AS price_range,
    COUNT(*) AS listings
FROM airbnb_cleaned
GROUP BY 
    CASE 
        WHEN price BETWEEN 0 AND 100 THEN '0–100'
        WHEN price BETWEEN 101 AND 200 THEN '101–200'
        WHEN price BETWEEN 201 AND 300 THEN '201–300'
        WHEN price BETWEEN 301 AND 500 THEN '301–500'
        ELSE '500+' 
    END
ORDER BY listings DESC;

-- Q5: Which room type is most common in NYC overall?
SELECT room_type, COUNT(*) AS listing_count
FROM airbnb_cleaned
GROUP BY room_type
ORDER BY listing_count DESC;
-- ======================================================
-- INTERMEDIATE ANALYSIS: Location, Availability & Hosts
-- ======================================================

-- Q6: Which 10 neighborhoods have the highest number of listings?
SELECT TOP 10 neighbourhood, COUNT(*) AS listing_count
FROM airbnb_cleaned
GROUP BY neighbourhood
ORDER BY listing_count DESC;

-- Q7: Which 10 neighborhoods have the highest average price?

SELECT TOP 10 neighbourhood, AVG(price) AS avg_price
FROM airbnb_cleaned
GROUP BY neighbourhood
ORDER BY avg_price DESC;


-- Q8: Which borough has the highest average availability?

SELECT neighbourhood_group, AVG(availability_365) AS avg_availability
FROM airbnb_cleaned
GROUP BY neighbourhood_group
ORDER BY avg_availability DESC;

-- Q9: What is the average price per neighborhood group for each room type?


SELECT neighbourhood_group, room_type, AVG(price) AS avg_price
FROM airbnb_cleaned
GROUP BY neighbourhood_group, room_type
ORDER BY neighbourhood_group, avg_price DESC;


-- Q10: Which 10 hosts have the most listings on the platform?
SELECT TOP 10 host_id, COUNT(*) AS total_listings
FROM airbnb_cleaned
GROUP BY host_id
ORDER BY total_listings DESC;


-- Q11: What is the average number of reviews for listings under $100?

SELECT AVG(number_of_reviews) AS avg_reviews
FROM airbnb_cleaned
WHERE price < 100;
-- ======================================================
-- ADVANCED ANALYSIS: Pricing Strategy & Revenue Insights
-- ======================================================

-- Q12: What are the top 10 neighborhoods by total revenue potential (price × availability)?
SELECT TOP 10 neighbourhood, SUM(price * availability_365) AS total_revenue_estimate
FROM airbnb_cleaned
GROUP BY neighbourhood
ORDER BY total_revenue_estimate DESC;



-- Q13: Which room types are underpriced or overpriced in specific boroughs?
SELECT neighbourhood_group, room_type, AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM airbnb_cleaned
GROUP BY neighbourhood_group, room_type
ORDER BY neighbourhood_group, avg_price;

-- Q14: Rank neighborhoods based on total number of reviews (use a window function).
SELECT neighbourhood, SUM(number_of_reviews) AS total_reviews,
       RANK() OVER (ORDER BY SUM(number_of_reviews) DESC) AS review_rank
FROM airbnb_cleaned
GROUP BY neighbourhood;

-- Q15: Identify listings with very low price but high reviews and availability — possibly underpriced.
SELECT id, name, neighbourhood, price, number_of_reviews, availability_365
FROM airbnb_cleaned
WHERE price < 50 AND number_of_reviews > 100 AND availability_365 > 200
ORDER BY number_of_reviews DESC;


-- Q16: Which combination of borough and room type yields the highest revenue score?
SELECT TOP 10 neighbourhood_group, room_type,
       AVG(price * reviews_per_month * (availability_365/365.0)) AS avg_revenue_score
FROM airbnb_cleaned
GROUP BY neighbourhood_group, room_type
ORDER BY avg_revenue_score DESC;


-- Q17: What is the average price and availability for each room type?

SELECT room_type,
       COUNT(*) AS total_listings,
       AVG(price) AS avg_price,
       AVG(availability_365) AS avg_availability
FROM airbnb_cleaned
GROUP BY room_type
ORDER BY avg_price DESC;



-- Q18: What’s the distribution of review frequency (`reviews_per_month`) across boroughs?
SELECT neighbourhood_group,
       MIN(reviews_per_month) AS min_rpm,
       AVG(reviews_per_month) AS avg_rpm,
       MAX(reviews_per_month) AS max_rpm
FROM airbnb_cleaned
GROUP BY neighbourhood_group;


-- Q19: What’s the minimum, average, and maximum price for each room type in each borough?
SELECT neighbourhood_group, room_type,
       MIN(price) AS min_price,
       AVG(price) AS avg_price,
       MAX(price) AS max_price
FROM airbnb_cleaned
GROUP BY neighbourhood_group, room_type
ORDER BY neighbourhood_group, room_type;

-- Q20: Are there any boroughs where private rooms are priced higher than entire homes?
SELECT neighbourhood_group,
       AVG(CASE WHEN room_type = 'Private room' THEN price END) AS avg_private_room_price,
       AVG(CASE WHEN room_type = 'Entire home/apt' THEN price END) AS avg_entire_home_price
FROM airbnb_cleaned
GROUP BY neighbourhood_group
HAVING AVG(CASE WHEN room_type = 'Private room' THEN price END) >
       AVG(CASE WHEN room_type = 'Entire home/apt' THEN price END);



