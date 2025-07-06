-- File: 03_data_cleaning.sql
-- Purpose: Clean the airbnb_cleaned table by removing invalid or long-term entries
-- Author: Kavya Naik
-- Date: 2025-06-17

-- Remove listings with zero price
DELETE FROM airbnb_cleaned
WHERE price <= 0;

-- Remove outliers with minimum nights > 365
-- Create a new table for long-term listings
SELECT *
INTO airbnb_long_term
FROM airbnb_cleaned
WHERE minimum_nights > 365;

-- Then delete them from the main table
DELETE FROM airbnb_cleaned
WHERE minimum_nights > 365;


-- Fill null reviews_per_month with 0
UPDATE airbnb_cleaned
SET reviews_per_month = 0
WHERE reviews_per_month IS NULL;


-- Fix misspelled or inconsistent neighbourhood_group values

UPDATE airbnb_cleaned
SET neighbourhood_group = 'Manhattan'
WHERE LOWER(neighbourhood_group) IN ('manhatan');

UPDATE airbnb_cleaned
SET neighbourhood_group = 'Brooklyn'
WHERE LOWER(neighbourhood_group) IN ('brookln');

