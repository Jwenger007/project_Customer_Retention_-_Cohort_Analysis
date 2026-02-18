-- =========================================================
-- 08_basic_clv.sql
-- Purpose: Calculate basic customer lifetime value
-- =========================================================

DROP TABLE IF EXISTS analysis.clv_summary;

CREATE TABLE analysis.clv_summary AS
WITH customer_revenue AS (
    SELECT
        customerid,
        SUM(revenue) AS total_revenue_per_customer,
        COUNT(DISTINCT invoiceno) AS total_orders
    FROM clean.transactions
    GROUP BY customerid
)
SELECT
    COUNT(*) AS total_customers,
    ROUND(AVG(total_revenue_per_customer), 2) AS avg_customer_lifetime_value,
    ROUND(AVG(total_orders), 2) AS avg_orders_per_customer,
    ROUND(SUM(total_revenue_per_customer), 2) AS total_revenue
FROM customer_revenue;


SELECT * FROM analysis.clv_summary;

