# Airbnb NYC Analysis

This project analyzes Airbnb listings in New York City to help real estate investors and Airbnb hosts optimize their pricing and location strategy for maximum revenue.

---

## 🔍 Problem Statement

As a real estate investor or Airbnb host, how can I optimize my property pricing and location strategy in NYC to maximize revenue?

---

## 🎯 Business Goals

* Identify the most profitable neighborhoods
* Understand the relationship between room types, pricing, and availability
* Detect underpriced or overpriced listings
* Recommend optimal pricing strategies per room type and borough

---

## 📊 Data Source

* **Dataset**: [Airbnb Open Data NYC](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data)
* `Airbnb_Open_Data.csv`: Raw data
* `cleaned_airbnb.xls`: Cleaned data ready for analysis and Power BI

---

## 📚 Project Structure

```
AIRBNB-NYC-ANALYSIS
├── data/              # Raw and cleaned data files
├── sql/               # SQL scripts for table creation, cleaning, and analysis
├── python/            # Jupyter notebooks for cleaning, loading, analysis
├── powerbi/           # Power BI dashboard and exported PNG
├── docs/              # Screenshots, data dictionary, and documentation
├── README.md          # Project overview and documentation
└── .gitignore         # Files to exclude from version control
```

---

## 📈 Key Insights

* Room type distribution: Entire home/apartments dominate the market
* Brooklyn and Manhattan are top contributors in terms of listings and revenue
* Many listings are either overpriced or underbooked based on availability vs price
* Optimal revenue occurs at a balance between price and high availability

---

## 📅 Tools & Technologies

* **SQL Server**: Data storage, cleaning, and analysis
* **Python (Pandas, Seaborn, Matplotlib)**: Data cleaning, EDA, scoring
* **Power BI**: Final interactive dashboard for stakeholder presentation

---

## 🚀 How to Run This Project

1. Load `Airbnb_Open_Data.csv` and clean using `01_data_cleaning_airbnb.ipynb`
2. Use `02_sql_load_airbnb.ipynb` to load cleaned data to SQL Server
3. Run analysis in SQL with `03_analysis_queries.sql` or `03_sql_analysis.ipynb`
4. View visuals in `docs/screenshots` or open the Power BI dashboard

---

## 🎨 Power BI Dashboard

Found in `/powerbi/airbnb_nyc_dashboard.pbix` and `/powerbi/airbnb_nyc_dashboard.png`

---

## 🌐 GitHub Best Practices

* Followed modular structure
* Included .gitignore (to be finalized)
* Used markdown files and screenshots
* SQL and Python scripts are versioned and named clearly

---

## 📅 Author

Kavya Naik

Feel free to fork, contribute, or suggest improvements.
