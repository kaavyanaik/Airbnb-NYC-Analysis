# Airbnb NYC Data Dictionary

This document describes the key fields used in the cleaned Airbnb NYC dataset for analysis and visualization.

---

## 🔤 Key Columns

| Column Name           | Data Type | Description                                                             |
| --------------------- | --------- | ----------------------------------------------------------------------- |
| `id`                  | Integer   | Unique identifier for the Airbnb listing                                |
| `name`                | String    | Title of the listing                                                    |
| `host_id`             | Integer   | Unique identifier for the host                                          |
| `neighbourhood_group` | String    | Borough of NYC where the listing is located (e.g., Manhattan, Brooklyn) |
| `neighbourhood`       | String    | Specific neighborhood (e.g., Harlem, Williamsburg)                      |
| `latitude`            | Float     | Latitude coordinate                                                     |
| `longitude`           | Float     | Longitude coordinate                                                    |
| `room_type`           | String    | Type of space (e.g., Entire home/apt, Private room, Shared room)        |
| `price`               | Integer   | Price per night in USD                                                  |
| `minimum_nights`      | Integer   | Minimum nights required to book                                         |
| `number_of_reviews`   | Integer   | Total number of reviews received                                        |
| `reviews_per_month`   | Float     | Average number of reviews per month                                     |
| `availability_365`    | Integer   | Number of days the listing is available in a year                       |
| `revenue_score`       | Float     | Derived metric: `price * availability_365 * number_of_reviews`          |

---

## 🔄 Cleaning Applied

* Dropped rows with nulls in critical columns (`latitude`, `price`, etc.)
* Removed listings with `minimum_nights > 365` (assumed long-term rentals)
* Normalized inconsistent values like `brookln` → `Brooklyn`, `manhatan` → `Manhattan`
* Removed outliers with price = 0 or negative availability

---

## 💡 Notes

* Data source: [NYC Airbnb Open Data (Kaggle)](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data)
* Columns like `license`, `last_review`, and `house_rules` were excluded in analysis due to high null counts or irrelevance to business goals
* `revenue_score` was introduced to estimate a listing's earning potential

---

## 👁️ For Further Use

You can extend this dictionary if you add more derived metrics (like occupancy rate, seasonal demand index, etc.) or integrate other datasets like demographics or tourism data.
