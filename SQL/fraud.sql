select * from `Health Fraud`;
show tables;
show databases;
show tables;

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE';

SELECT * FROM `Health Fraud` LIMIT 0, 1000;
SHOW DATABASES;
USE newschema;
show tables;

select * from health fraud;
SELECT * FROM `health fraud`;
rename table `health fraud` to fraud;
select * from fraud;

SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN `Fraud Type` = 'No Fraud' THEN 1 ELSE 0 END) AS legitimate_cases,
    SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END) AS fraud_cases,
    ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM fraud;

SELECT 
    `Fraud Type`,
    COUNT(*) AS total_cases,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fraud), 2) AS pct_of_total,
    ROUND(SUM(`Amount Billed`), 2) AS total_amount_billed,
    ROUND(AVG(`Amount Billed`), 2) AS avg_amount_billed
FROM fraud
GROUP BY `Fraud Type`
ORDER BY total_cases DESC;

SELECT 
    ROUND(SUM(`Amount Billed`), 2) AS total_billed,
    ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN `Amount Billed` ELSE 0 END), 2) AS fraudulent_amount,
    ROUND(SUM(CASE WHEN `Fraud Type` = 'No Fraud' THEN `Amount Billed` ELSE 0 END), 2) AS legitimate_amount,
    ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN `Amount Billed` ELSE 0 END) * 100.0 / SUM(`Amount Billed`), 2) AS fraud_revenue_pct
FROM fraud;

SELECT 
    Diagnosis,
    Treatment,
    COUNT(*) AS cases,
    ROUND(AVG(`Amount Billed`), 2) AS avg_billed,
    `Fraud Type`
FROM fraud
WHERE Diagnosis != Treatment
GROUP BY Diagnosis, Treatment, `Fraud Type`
ORDER BY cases DESC
LIMIT 15;

WITH diagnosis_summary AS (
    SELECT 
        Diagnosis,
        COUNT(*) AS total_cases,
        SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END) AS fraud_cases,
        ROUND(AVG(`Amount Billed`), 2) AS avg_billed,
        ROUND(SUM(`Amount Billed`), 2) AS total_billed
    FROM fraud
    GROUP BY Diagnosis
)
SELECT 
    Diagnosis,
    total_cases,
    fraud_cases,
    ROUND(fraud_cases * 100.0 / total_cases, 2) AS fraud_rate_pct,
    avg_billed,
    total_billed
FROM diagnosis_summary
ORDER BY fraud_rate_pct DESC;

SELECT 
    Diagnosis,
    `Fraud Type`,
    ROUND(SUM(`Amount Billed`), 2) AS total_billed,
    RANK() OVER (PARTITION BY `Fraud Type` ORDER BY SUM(`Amount Billed`) DESC) AS billing_rank
FROM fraud
WHERE `Fraud Type` != 'No Fraud'
GROUP BY Diagnosis, `Fraud Type`
ORDER BY `Fraud Type`, billing_rank;

SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 55 THEN '36-55'
        WHEN Age BETWEEN 56 AND 75 THEN '56-75'
        ELSE '76+'
    END AS age_group,
    `Fraud Type`,
    COUNT(*) AS cases,
    ROUND(AVG(`Amount Billed`), 2) AS avg_billed
FROM  fraud
WHERE `Fraud Type` != 'No Fraud'
GROUP BY age_group, `Fraud Type`
ORDER BY age_group, cases DESC;

SELECT 
    `Patient ID`,
    Age,
    Diagnosis,
    `Fraud Type`,
    `Amount Billed`,
    DATEDIFF(
        STR_TO_DATE(`Date Discharged`, '%d-%m-%Y'),
        STR_TO_DATE(`Date Admitted`, '%d-%m-%Y')
    ) AS length_of_stay_days
FROM fraud
WHERE `Fraud Type` = 'Ghost Enrollee'
ORDER BY length_of_stay_days ASC, `Amount Billed` DESC;
show columns from fraud;

ALTER TABLE fraud 
RENAME COLUMN `ï»¿Patient ID` TO `Patient ID`;

SELECT 
    `Patient ID`,
    Diagnosis,
    `Fraud Type`,
    `Amount Billed`,
    ROUND((
        SELECT AVG(`Amount Billed`) 
        FROM fraud h2 
        WHERE h2.`Fraud Type` = h1.`Fraud Type`
    ), 2) AS avg_for_fraud_type
FROM fraud h1
WHERE `Amount Billed` > (
    SELECT AVG(`Amount Billed`) 
    FROM fraud h2 
    WHERE h2.`Fraud Type` = h1.`Fraud Type`
)
AND `Fraud Type` != 'No Fraud'
ORDER BY `Amount Billed` DESC
LIMIT 20;

SELECT 'Total Patients'        AS metric, COUNT(*)                                                          AS value FROM fraud
UNION ALL
SELECT 'Total Fraud Cases',     SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END)                FROM fraud
UNION ALL
SELECT 'Fraud Rate (%)',        ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) FROM fraud
UNION ALL
SELECT 'Total Amount Billed',   ROUND(SUM(`Amount Billed`),2)                                              FROM fraud
UNION ALL
SELECT 'Fraudulent Amount',     ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN `Amount Billed` ELSE 0 END),2) FROM fraud
UNION ALL
SELECT 'Phantom Billing Total', ROUND(SUM(CASE WHEN `Fraud Type` = 'Phantom Billing' THEN `Amount Billed` ELSE 0 END),2) FROM fraud
UNION ALL
SELECT 'Fake Treatment Total',  ROUND(SUM(CASE WHEN `Fraud Type` = 'Fake Treatment' THEN `Amount Billed` ELSE 0 END),2) FROM  fraud
UNION ALL
SELECT 'Ghost Enrollee Total',  ROUND(SUM(CASE WHEN `Fraud Type` = 'Ghost Enrollee' THEN `Amount Billed` ELSE 0 END),2) FROM fraud;

SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN `Fraud Type` = 'No Fraud' THEN 1 ELSE 0 END) AS legitimate_cases,
    SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END) AS fraud_cases,
    ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM fraud;

SELECT 'Total Amount Billed', ROUND(SUM(`Amount Billed`),2) FROM fraud
UNION ALL
SELECT 'Fraudulent Amount', ROUND(SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN `Amount Billed` ELSE 0 END),2) FROM fraud
UNION ALL
SELECT 'Phantom Billing Total', ROUND(SUM(CASE WHEN `Fraud Type` = 'Phantom Billing' THEN `Amount Billed` ELSE 0 END),2) FROM fraud;

SELECT `Fraud Type`, COUNT(*) AS cases, ROUND(AVG(`Amount Billed`),2) AS avg_billed
FROM fraud
GROUP BY `Fraud Type`
ORDER BY cases DESC;