# Superstore Sales & Profitability Analysis

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

| File                   | Purpose                                                |
| ---------------------- | ------------------------------------------------------ |
| `01_create_tables.sql` | Creates the raw landing table                          |
| `02_import_date.sql`   | Imports the source CSV into PostgreSQL                 |
| `03_cleaning.sql`      | Cleans, converts, validates, and standardizes the data |
| `04_eda.sql`           | Performs exploratory data analysis                     |
| `05_analysis.sql`      | Answers the main business questions                    |
| `06_views.sql`         | Defines reusable analytical SQL views                  |


---

## The cleaning process included:

- Converting date fields into proper date types
- Converting numeric fields from text into numeric values
- Removing formatting characters from numeric fields
- Trimming inconsistent product names
- Standardizing inconsistent state names
- Checking for invalid dates
- Checking for invalid sales values
- Removing records with zero or negative sales for the profitability analysis
- Validating the resulting dataset