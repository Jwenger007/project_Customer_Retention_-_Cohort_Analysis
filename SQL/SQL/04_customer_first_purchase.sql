-- =========================================================
-- 04_customer_first_purchase.sql
-- Purpose: Determine first purchase date per customer
-- =========================================================

DROP TABLE IF EXISTS analysis.customer_first_purchase;

CREATE TABLE analysis.customer_first_purchase AS
SELECT
    customerid,
    MIN(invoicedate) AS first_purchase_date,
    DATE_TRUNC('month', MIN(invoicedate)) AS cohort_month
FROM clean.transactions
GROUP BY customerid;