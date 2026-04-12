# 🛒 E-Commerce Data Analysis (SQL + Python)

## 📌 Overview

This project analyzes an **e-commerce dataset** using **SQL and Python** to uncover key business insights such as revenue trends, customer retention, top-performing products, and regional performance.

The goal is to transform raw transactional data into **actionable insights** that support business decision-making.

---

## 🎯 Objectives

* Calculate **total sales per category**
* Identify **top 3 customers per year**
* Analyze **year-over-year (YoY) growth**
* Calculate **customer retention rate**
* Visualize **sales trends over time**

---

## 🛠️ Tools & Technologies

* **SQL** (MySQL / SQLite)
* **Python (Jupyter Notebook)**
* **Pandas** – Data manipulation & analysis
* **Matplotlib** – Data visualization

---

## 🗂️ Dataset

🔗 [Dataset Link](https://drive.google.com/drive/folders/1IfC8yU0_kyKFBcRC6JxV9n-N7WS9_qNu?usp=drive_link)

### Tables Included:

* Orders
* Customers
* Order Items
* Products
* Geolocation
* Sellers

---

## 🧹 Data Cleaning & Preparation

* Performed **data import & initial exploration**
* Removed duplicates using:

  * `DISTINCT`
  * `GROUP BY`
* Ensured no duplicate transactions impacted analysis
* Validated relationships between tables

---

## 🔍 Key SQL Analysis & Visualizations

* 📊 Total revenue per year
* 📈 Year-over-Year Growth using `LAG()`
* 🔁 Customer retention (within 6 months)
* 👤 Top 3 customers by yearly spending
* 🛍️ Sales per product category

---

## 📈 Key Insights

* 📊 Sales show a **consistent year-over-year increase**
* 📅 Revenue peaked in **2018 (~6.15M)**
* ⚠️ Customer retention within 6 months is **very low (≈ 0%)**
* 🪑 Highest sales category: **Furniture (527 units sold)**
* 📉 Lowest sales categories: **Insurance & Services (2 units sold)**

---

## ⚠️ Challenges Faced

* Ensuring measures update correctly with filters
* Extracting **week numbers** from transaction dates
* Creating meaningful **data buckets (e.g., categories, segments)**
* Avoiding clutter while displaying multiple KPIs

---

## 🚀 Conclusion

This project highlights how combining **SQL and Python** can:

* Extract valuable business insights
* Identify growth opportunities
* Improve understanding of customer behavior

---

## 📌 Key Learnings

* Writing optimized SQL queries (joins, aggregations, window functions)
* Data cleaning and transformation techniques
* Data visualization for storytelling
* Translating data insights into business recommendations

---
