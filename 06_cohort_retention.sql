-- =========================================================
-- 06_cohort_retention.sql
-- Purpose: Build cohort retention table
-- =========================================================

DROP TABLE IF EXISTS analysis.cohort_retention;

CREATE TABLE analysis.cohort_retention AS
WITH cohort_sizes AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customerid) AS cohort_size
    FROM analysis.customer_monthly_activity
    WHERE months_since_first_purchase = 0
    GROUP BY cohort_month
)
SELECT
    r.cohort_month,
    r.months_since_first_purchase,
    r.active_customers,
    c.cohort_size,
    ROUND(
        r.active_customers::numeric / c.cohort_size * 100,
        2
    ) AS retention_rate
FROM (
    SELECT
        cohort_month,
        months_since_first_purchase,
        COUNT(DISTINCT customerid) AS active_customers
    FROM analysis.customer_monthly_activity
    GROUP BY cohort_month, months_since_first_purchase
) r
JOIN cohort_sizes c
    ON r.cohort_month = c.cohort_month
ORDER BY r.cohort_month, r.months_since_first_purchase;


SELECT * FROM analysis.cohort_retention;
