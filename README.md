# Healthcare Fraud Billing Audit Analysis
An end-to-end data analysis project detecting and quantifying fraudulent healthcare billing patterns across 3,000 patient records. Using SQL for deep data interrogation and Power BI for executive-ready visual reporting, this project identifies four fraud categories — Phantom Billing, Fake Treatment, Ghost Enrollee, and No Fraud 

## 🧮 SQL Analysis — Queries Covered

| S.NO| Query | Technique Used |
|---|---|---|
| 1 | Total records and fraud rate overview | Aggregate functions, CASE WHEN |
| 2 | Fraud breakdown by type with avg billing | GROUP BY, percentage calculation |
| 3 | Financial impact — total vs fraudulent billing | CASE WHEN, SUM, ROUND |
| 4 | Diagnosis vs Treatment mismatch detection | WHERE inequality filter, GROUP BY |
| 5 | Fraud rate and avg billing by diagnosis | CTE (WITH clause) |
| 6 | Diagnoses ranked by fraudulent billing | Window Function — RANK() OVER PARTITION BY |
| 7 | Age group segmentation of fraud targets | CASE WHEN age banding, GROUP BY |
| 8 | Ghost Enrollee — length of stay detection | DATEDIFF, STR_TO_DATE |
| 9 | Cases billed above fraud-type average | Correlated Subquery |
| 10 | Executive business summary | UNION ALL |

<img width="1920" height="1080" alt="Screenshot (20)" src="https://github.com/user-attachments/assets/a2a9d332-c1b4-4715-912e-6f25ab2495da" />
<img width="1920" height="1080" alt="Screenshot (43)" src="https://github.com/user-attachments/assets/b2fc2324-bba3-4d35-9a02-7c8daca3e0ac" />
<img width="1920" height="1080" alt="Screenshot (44)" src="https://github.com/user-attachments/assets/75eab8f0-c769-43dd-9ce4-02d6058aed98" />



