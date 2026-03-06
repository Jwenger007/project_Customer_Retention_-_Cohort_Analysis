-- =========================================================
-- 09_cohort_ltv_curve.sql
-- Purpose: Time-adjusted cohort LTV curve (monthly + cumulative)
-- =========================================================

DROP TABLE IF EXISTS analysis.cohort_ltv_monthly;

CREATE TABLE analysis.cohort_ltv_monthly AS
WITH base AS (
    SELECT
        f.cohort_month,
        t.customerid,
        DATE_TRUNC('month', t.invoicedate) AS activity_month,
        SUM(t.revenue) AS revenue_in_month
    FROM clean.transactions t
    JOIN analysis.customer_first_purchase f
        ON t.customerid = f.customerid
    GROUP BY f.cohort_month, t.customerid, DATE_TRUNC('month', t.invoicedate)
),
with_month_index AS (
    SELECT
        cohort_month,
        customerid,
        revenue_in_month,
        EXTRACT(YEAR FROM AGE(activity_month, cohort_month)) * 12 +
        EXTRACT(MONTH FROM AGE(activity_month, cohort_month)) AS months_since_first_purchase
    FROM base
),
cohort_sizes AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customerid) AS cohort_size
    FROM analysis.customer_first_purchase
    GROUP BY cohort_month
)

SELECT
    w.cohort_month,
    w.months_since_first_purchase,
    cs.cohort_size,
    SUM(w.revenue_in_month) AS cohort_revenue_in_month,
    SUM(SUM(w.revenue_in_month)) OVER (
        PARTITION BY w.cohort_month
        ORDER BY w.months_since_first_purchase
    ) AS cumulative_revenue,
    ROUND(
        SUM(SUM(w.revenue_in_month)) OVER (
            PARTITION BY w.cohort_month
            ORDER BY w.months_since_first_purchase
        ) / cs.cohort_size,
        2
    ) AS cumulative_revenue_per_customer
FROM with_month_index w
JOIN cohort_sizes cs
    ON w.cohort_month = cs.cohort_month
GROUP BY w.cohort_month, w.months_since_first_purchase, cs.cohort_size
ORDER BY w.cohort_month, w.months_since_first_purchase;


SELECT * 
FROM analysis.cohort_ltv_monthly;