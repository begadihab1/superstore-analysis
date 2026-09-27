# Superstore Sales & Profitability Analysis
[📽️Watch the Dashboard Walkthrough](record/powerbi_dashboard_walkthrough.mp4.mp4)
## 📊 Project Overview

This project analyzes Superstore sales data to understand profitability, discounting behavior, product performance, and regional/market performance.

The project combines **PostgreSQL** for data cleaning and analysis with **Power BI** for interactive business intelligence and dashboarding.

The goal was to transform raw transactional data into actionable insights that could support better decisions around product profitability, discount strategy, and market performance.

---

## 🎯 Business Questions

The analysis focuses on three main business questions:

1. Which categories and sub-categories are profitable versus loss-making?
2. Does discounting help or hurt profitability, and where does profitability begin to deteriorate?
3. Which markets and regions underperform despite generating high sales volume?

---

## 🛠️ Tools & Technologies

- **SQL / PostgreSQL** — data loading, cleaning, transformation, exploratory analysis, and business analysis
- **Power BI** — interactive dashboard, KPIs, filtering, drill-through analysis, and visual storytelling
- **Git & GitHub** — version control and project documentation

---
## 🔄 Project Workflow

```text
Raw CSV
   ↓
PostgreSQL
   ↓
Data Cleaning & Validation
   ↓
Exploratory Data Analysis
   ↓
Business Analysis
   ↓
Power BI
   ↓
Interactive Dashboard
```

---

## SQL workflow
| File                   | Purpose                                                |
| ---------------------- | ------------------------------------------------------ |
| `01_create_tables.sql` | Creates the raw landing table                          |
| `02_import_date.sql`   | Imports the source CSV into PostgreSQL                 |
| `03_cleaning.sql`      | Cleans, converts, validates, and standardizes the data |
| `04_eda.sql`           | Performs exploratory data analysis                     |
| `05_analysis.sql`      | Answers the main business questions                    |
| `06_views.sql`         | Defines reusable analytical SQL views                  |


---

## 🧹 Data Preparation
### The raw dataset contains transactional sales information including:
- Order and shipping dates
- Customers
- Countries and markets
- Regions
- Categories and sub-categories
- Products
- Sales
- Quantity
- Discount
- Profit
- Shipping cost
- Shipping mode
- Order priority
### The cleaning process included:
- Converting date fields into proper date types
- Converting numeric fields from text into numeric values
- Removing formatting characters from numeric fields
- Trimming inconsistent product names
- Standardizing inconsistent state names
- Checking for invalid dates
- Checking for invalid sales values
- Removing records with zero or negative sales for the profitability analysis
- Validating the resulting dataset

---

## 📈 Exploratory Data Analysis

### The SQL analysis explores the dataset across several dimensions:

#### Time
- Sales and profit by year
- Monthly sales and profit trends
- Average sales and discount levels
#### Products
- Category performance
- Sub-category performance
- Number of products
- Sales and profit contribution
#### Geography
- Market performance
- Regional performance
- Country-level sales and profit
- Category distribution across selected countries
#### Profitability
- Profit margins
- Discount levels
- Average profit by discount level
- Sub-category performance across discount levels

---

## 💡 Key Findings
### Product Profitability
- Technology generated the highest sales and total profit among the three major categories in the analyzed dataset.
- At the sub-category level, Tables generated substantial sales but had negative total profit, making them an important area for further profitability investigation.
### Discount & Profitability
- Higher discount levels were associated with lower profitability in the dataset.
- The analysis shows a noticeable deterioration in profitability as discounts increase, particularly at higher discount levels.
- This does not by itself establish causation, but it highlights discounting as an important area for pricing and margin analysis.
### Market & Regional Performance
- Market and regional performance differs considerably when comparing:
   - Sales volume
   - Order volume
   - Total profit
   - Profit margin
- This allows the dashboard to distinguish between markets that generate large absolute sales and markets that achieve stronger margins.

---

## 📊 Power BI Dashboard
### The Power BI dashboard provides an interactive view of the analysis, including:
- Executive KPIs
- Sales and profit trends
- Category and sub-category performance
- Market and regional performance
- Discount vs. profitability analysis
- Interactive filtering
- Drill-through analysis

[Superstore Analysis Dashboard](powerbi/superstore_analysis_dashboard.pbix)

---

## 🔎 Example Business Insights
### The analysis can be used to answer questions such as:
- Which product areas generate the most profit?
- Which sub-categories require closer margin investigation?
- How does profitability change across discount levels?
- Which markets generate high sales but relatively weaker margins?
- How does performance change across regions and time?
- Where should management investigate pricing or discounting strategy further?

---

## 👤 About
**This project is part of my data analytics portfolio and demonstrates my practical experience working with PostgreSQL, Power BI, data cleaning, exploratory analysis, and business-focused visualization.**