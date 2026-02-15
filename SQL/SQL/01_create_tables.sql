-- =========================================================
-- 01_create_tables.sql
-- Project: Customer Retention & Cohort Analysis (Online Retail)
-- DB: PostgreSQL
-- Purpose: Create schemas + raw table (no cleaning here)
-- =========================================================

-- 1) Schemas (Schichten) anlegen
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS clean;
CREATE SCHEMA IF NOT EXISTS analysis;

-- 2) RAW Tabelle anlegen (Spalten nah am CSV)
DROP TABLE raw.transactions;

CREATE TABLE raw.transactions (
    invoiceno     TEXT,
    stockcode     TEXT,
    description   TEXT,
    quantity      INTEGER,
    invoicedate   TIMESTAMP,
    unitprice     NUMERIC(10,2),
    customerid    TEXT,
    country       TEXT
);
