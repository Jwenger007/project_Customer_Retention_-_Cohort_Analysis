-- =========================================================
-- 07_repeat_purchase_rate.sql
-- Purpose: Calculate repeat purchase rate
-- =========================================================

DROP TABLE IF EXISTS analysis.repeat_purchase_summary;

CREATE TABLE analysis.repeat_purchase_summary AS
WITH customer_orders AS (
    SELECT
        customerid,
        COUNT(DISTINCT invoiceno) AS total_orders
    FROM clean.transactions
    GROUP BY customerid
)
SELECT
    COUNT(*) AS total_customers,
    COUNT(CASE WHEN total_orders > 1 THEN 1 END) AS repeat_customers,
    ROUND(
        COUNT(CASE WHEN total_orders > 1 THEN 1 END)::numeric
        / COUNT(*) * 100,
        2
    ) AS repeat_purchase_rate_percentage
FROM customer_orders;

SELECT * FROM analysis.repeat_purchase_summary;
