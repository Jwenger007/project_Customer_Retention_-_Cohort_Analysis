--psql: 
\copy raw.transactions FROM 'C:/Users/Johan/Documents/Data_Analyst_skills/SQL_Project_(POSTGRESQL)(VS_Code)/project_sql/project_Customer_Retention_&_Cohort_Analysis/Data/raw/online_retail.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


 SELECT COUNT(*) FROM clean.transactions;
