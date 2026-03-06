# Customer Retention & Cohort Analysis

## Project Overview

This project analyzes customer behavior using the **Online Retail dataset (UK)**.
Online Retail Dataset (UK)  
Source: https://www.kaggle.com/datasets/ulrikthygepedersen/online-retail-dataset
  
The goal is to understand how customers return over time, how valuable they are, and how revenue grows after the first purchase.

The analysis focuses on:

- Customer retention over time
- Repeat purchase behavior
- Customer Lifetime Value (CLV)
- Cohort-based revenue growth

The project demonstrates how transaction-level data can be transformed into meaningful customer analytics using **SQL, Excel, and Power BI**.

## Project Structure
Each SQL script represents a step in the analysis pipeline, from raw data ingestion to cohort and lifetime value analysis.

``` 
## Project Structure

project_Customer_Retention_-_Cohort_Analysis
│
├── charts
│   ├── Cohort LTV Curve – Cumulative Revenue per Customer.png
│   ├── Customer Cohort Retention (Chart).png
│   ├── KPI (Average Orders per Customer).png
│   ├── KPI (Total Revenue).png
│   ├── KPI card (Average Customer Lifetime Value).png
│   └── KPI card (Repeat Purchase Rate).png
│
├── Data
│   └── raw
│       └── online_retail.csv
│
├── SQL
│   └── SQL
│       ├── 01_create_tables.sql
│       ├── 02_modify_tables.sql
│       ├── 03_cleaning.sql
│       ├── 04_customer_first_purchase.sql
│       ├── 05_customer_monthly_activity.sql
│       ├── 06_cohort_retention.sql
│       ├── 07_repeat_purchase_rate.sql
│       ├── 08_basic_clv.sql
│       └── 09_cohort_ltv_curve.sql
│
└── README.md
```
## Tools Used

- PostgreSQL
- pgAdmin
- VS Code
- Excel
- Power BI

---

## Dataset

**Online Retail Dataset (UK)**

Period covered:

December 2010 – December 2011

Each row represents a transaction with the following fields:

- InvoiceNo
- StockCode
- Description
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country

---

## Data Cleaning

The raw dataset required several cleaning steps before analysis.

Cleaning rules applied:

- Removed rows where **CustomerID is NULL**
- Removed transactions where **Quantity ≤ 0** (returns)
- Removed transactions where **UnitPrice ≤ 0**
- Created a **Revenue column**:

Revenue = Quantity × UnitPrice

After cleaning, the dataset contained **397,880 valid transactions** used for analysis.

---

## Key Metrics

These KPIs summarize the overall customer behavior.

- **Total Customers:** 4.338  
- **Repeat Purchase Rate:** 65,65%  
- **Average Orders per Customer:** 4,27  
- **Average Customer Lifetime Value:** €2.054,27  
- **Total Revenue:** €8.911.407,90  

### KPI Overview

![alt text](<charts/KPI card (repeat purchase rate).png>)

![alt text](<charts/KPI (Avarage Orders per Customer).png>)

![alt text](<charts/KPI card (Avarage Customer Lifetime Value).png>)

![alt text](<charts/KPI (Total Revenue).png>)



Example: Repeat Purchase Rate, CLV, Orders per Customer, Total Revenue.

---

## Cohort Retention Analysis

To analyze customer retention, customers were grouped into **cohorts based on their first purchase month**.

This allows us to track how many customers return in the months following their initial purchase.

### Cohort Retention Heatmap

![alt text](<charts/Costomer Cohort Retention (Chart).png>)


### Key Observations

- A significant drop occurs after the first purchase month.
- After the initial drop, retention stabilizes around **20–35%**.
- This indicates the presence of a **loyal core group of repeat customers**.

#### Note: 
##### Later cohorts appear to have lower retention in later months because the dataset ends in December 2011. Customers acquired later simply have less time to generate repeat purchases. This effect is known as right-censoring.

---

## Customer Lifetime Value Curve

Instead of only comparing final CLV values, we analyze how customer value **develops over time**.

The **Cohort LTV Curve** shows cumulative revenue per customer from the moment of their first purchase.

### Cohort LTV Curve

![alt text](<charts/Cohort LTV Curve- Comulative Revenue per Customer.png>)


### Interpretation

Each line represents a cohort of customers who made their first purchase in a specific month.

The chart shows how much revenue the **average customer generates over time**.

Older cohorts naturally reach higher values because they have a longer observation period.

More important than the final value is the **growth pattern in the first months**, which reflects how quickly customers generate revenue.

---

## Repeat Purchase Analysis

Repeat purchasing behavior is a key indicator of customer retention.

The dataset shows:

**65,65% of customers make more than one purchase.**

This suggests that a majority of customers return after their initial order, which is typical for **B2B / wholesale retail environments**.

---

## Limitations

Several factors should be considered when interpreting the results:

- **Observation window bias**  
  Older cohorts have more time to generate revenue.

- **No profit data available**  
  The analysis focuses on revenue, not profit margins.

- **Customer segmentation not included**  
  Different customer types may behave differently.

Future analysis could include:

- Profit-based CLV
- Customer segmentation
- Country-level retention analysis

---

## Conclusion

This project demonstrates how raw transaction data can be transformed into actionable customer insights.

Key findings include:

- A strong initial drop in customer retention after the first purchase
- A stable base of repeat customers
- Revenue growth primarily driven by early repeat purchases

Cohort analysis and LTV curves provide a deeper understanding of **customer value development over time**, which can help businesses optimize retention strategies.

---

## Author

Johannes Wenger

Data Analytics Project  
