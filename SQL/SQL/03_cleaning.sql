-- =========================================================
-- 03_cleaning.sql
-- Purpose: Create cleaned transaction table for retention analysis
-- =========================================================

DROP TABLE IF EXISTS clean.transactions;

CREATE TABLE clean.transactions AS
SELECT
    invoiceno,
    stockcode,
    description,
    quantity,
    invoicedate,
    unitprice,
    customerid,
    country,
    (quantity * unitprice) AS revenue
FROM raw.transactions
WHERE customerid IS NOT NULL
  AND quantity > 0
  AND unitprice > 0;
