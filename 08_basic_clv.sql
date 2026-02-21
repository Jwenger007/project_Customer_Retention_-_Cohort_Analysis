-- =========================================================
-- 08_basic_clv.sql
-- Purpose: Calculate CLV per cohort
-- =========================================================

DROP TABLE IF EXISTS analysis.clv_per_cohort;

CREATE TABLE analysis.clv_per_cohort AS
WITH customer_revenue AS (
    SELECT
        t.customerid,
        f.cohort_month,
        SUM(t.revenue) AS total_revenue_per_customer,
        COUNT(DISTINCT t.invoiceno) AS total_orders_per_customer
    FROM clean.transactions t
    JOIN analysis.customer_first_purchase f
        ON t.customerid = f.customerid
    GROUP BY t.customerid, f.cohort_month
)

SELECT
    cohort_month,
    COUNT(customerid) AS total_customers,
    ROUND(SUM(total_revenue_per_customer), 2) AS total_revenue,
    ROUND(AVG(total_revenue_per_customer), 2) AS avg_clv_per_customer,
    ROUND(AVG(total_orders_per_customer), 2) AS avg_orders_per_customer
FROM customer_revenue
GROUP BY cohort_month
ORDER BY cohort_month;

SELECT * FROM analysis.clv_per_cohort;