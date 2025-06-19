-- File: 02_create_table.sql
-- Purpose:Create the airbnb_cleaned table in SQL Server for short-term listings
-- Author: Kavya Naik
-- Date: 2025-06-17



-- This script is for documentation purposes only. Table creation was executed via Python.


USE AirbnbNYC;
GO

CREATE TABLE airbnb_cleaned (
    id INT,
    name NVARCHAR(MAX),
    host_id BIGINT,
    neighbourhood_group NVARCHAR(50),
    neighbourhood NVARCHAR(100),
    latitude FLOAT,
    longitude FLOAT,
    room_type NVARCHAR(50),
    price FLOAT,
    minimum_nights INT,
    number_of_reviews INT,
    reviews_per_month FLOAT,
    availability_365 INT
);