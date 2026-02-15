-- =========================================================
-- 05_customer_monthly_activity.sql
-- Purpose: Create monthly customer activity table
-- =========================================================

DROP TABLE IF EXISTS analysis.customer_monthly_activity;

CREATE TABLE analysis.customer_monthly_activity AS
SELECT
    t.customerid,
    DATE_TRUNC('month', t.invoicedate) AS activity_month,
    f.cohort_month,
    EXTRACT(YEAR FROM AGE(DATE_TRUNC('month', t.invoicedate), f.cohort_month)) * 12
    + EXTRACT(MONTH FROM AGE(DATE_TRUNC('month', t.invoicedate), f.cohort_month))
    AS months_since_first_purchase
FROM clean.transactions t
JOIN analysis.customer_first_purchase f
    ON t.customerid = f.customerid
GROUP BY
    t.customerid,
    activity_month,
    f.cohort_month;


