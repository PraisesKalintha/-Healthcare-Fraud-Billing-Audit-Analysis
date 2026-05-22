# 🏥 Healthcare Revenue & Fraud Audit Analysis
### SQL • Power BI • Healthcare Analytics • Fraud Detection

> Healthcare fraud costs the global insurance industry over $455 billion annually.
> This project builds an end-to-end SQL and Power BI audit framework to detect,
> classify, and quantify four fraud patterns across 1,500 patient billing records —
> surfacing ₹248M in fraudulent claims and a 40.87% overall fraud rate.

---

## 📌 Project Overview

A complete data analysis project designed to detect and quantify fraudulent healthcare
billing patterns using SQL for deep data interrogation and Power BI for executive-ready
visual reporting. The project classifies billing records into four fraud categories —
**Phantom Billing, Fake Treatment, Ghost Enrollee, and No Fraud** — and delivers
actionable financial insights that support audit, compliance, and risk management decisions.


---

## 🔢 Key Findings

| Metric | Value |
|---|---|
| Total Patient Records Analyzed | 1,500 |
| Legitimate Cases | 887 |
| Fraudulent Cases | **613** |
| Overall Fraud Rate | **40.87%** |
| Total Amount Billed | ₹476,484,930 |
| Total Fraudulent Amount | **₹248,079,958** |
| Phantom Billing Total | ₹112,168,420 |
| Fake Treatment Total | ₹92,816,805 |
| Ghost Enrollee Total | ₹43,094,731 |
| Fraud Share of Total Revenue | **52.06%** |

> **Over 52% of total billed revenue is linked to fraudulent activity —
> with Phantom Billing alone accounting for ₹112M.**

---

## 💰 Average Billing by Fraud Type

| Fraud Type | Cases | Avg Amount Billed | vs Legitimate |
|---|---|---|---|
| No Fraud | 887 | ₹257,502 | baseline |
| Ghost Enrollee | 164 | ₹262,772 | +2% |
| Fake Treatment | 243 | ₹381,962 | **+48% higher** |
| Phantom Billing | 206 | ₹544,506 | **+111% higher** |

> **Phantom Billing cases are billed 2.1× higher than legitimate claims (₹544,506 vs ₹257,502)
> — the strongest financial fraud signal in the dataset.**

---

## 🛠️ Tools & Technologies

| Tool | Usage |
|---|---|
| MySQL | Data extraction, validation, fraud pattern analysis, 10 structured queries |
| Power BI | Interactive KPI dashboard, visual storytelling, executive reporting |
| DAX | Custom measures — fraud rate, avg billing, total fraud value calculations |
| Power Query | Data cleaning, date transformation, column standardization |

---

## 🧮 SQL Analysis — 10 Queries Covered

| # | Query | Technique Used |
|---|---|---|
| 1 | Total records and fraud rate overview | Aggregate functions, CASE WHEN |
| 2 | Fraud breakdown by type with avg billing | GROUP BY, percentage calculation |
| 3 | Financial impact — total vs fraudulent billing | CASE WHEN, SUM, ROUND |
| 4 | Diagnosis vs Treatment mismatch detection | WHERE inequality filter, GROUP BY |
| 5 | Fraud rate and avg billing by diagnosis | **CTE (WITH clause)** |
| 6 | Diagnoses ranked by fraudulent billing amount | **Window Function — RANK() OVER PARTITION BY** |
| 7 | Age group segmentation of fraud targets | CASE WHEN age banding, GROUP BY |
| 8 | Ghost Enrollee — length of stay detection | DATEDIFF, STR_TO_DATE |
| 9 | Cases billed above fraud-type average | **Correlated Subquery** |
| 10 | Executive business summary — single view | UNION ALL |

---

## 🔍 SQL Snippet — CTE Example

```sql
WITH diagnosis_summary AS (
    SELECT
        Diagnosis,
        COUNT(*) AS total_cases,
        SUM(CASE WHEN `Fraud Type` != 'No Fraud' THEN 1 ELSE 0 END) AS fraud_cases,
        ROUND(AVG(`Amount Billed`), 2) AS avg_billed
    FROM fraud
    GROUP BY Diagnosis
)
SELECT
    Diagnosis,
    total_cases,
    fraud_cases,
    ROUND(fraud_cases * 100.0 / total_cases, 2) AS fraud_rate_pct,
    avg_billed
FROM diagnosis_summary
ORDER BY fraud_rate_pct DESC;
```

---

## 📊 Power BI Dashboard — Visuals Included

| Visual | Insight Delivered |
|---|---|
| KPI Cards | Total Billed, Total Fraud Value, Unique Patients, Avg Stay |
| Donut Chart | Total billed split by Gender (Male vs Female) |
| Line Chart | Monthly fraud value trend across 2022–2024 |
| Scatter Plot | Amount Billed by Patient ID colored by Fraud Type |
| Matrix Table | Diagnosis × Fraud Type × Age with billing values |
| Slicer | Filter by Fraud Type, Diagnosis, Treatment, Date |

---

## 💡 Key Business Insights

1. **40.87% fraud rate** — over 2 in 5 healthcare claims are fraudulent, representing a critical compliance and financial audit risk.

2. **Phantom Billing averages ₹544,506 per claim** — 2.1× higher than legitimate claims (₹257,502), making it the most financially damaging fraud category at ₹112M total.

3. **Fake Treatment (243 cases, ₹92.8M total)** — detected through direct Diagnosis ≠ Treatment mismatch analysis across 20+ medical procedures including Cesarean Section, Appendectomy, and Hypertension.

4. **Ghost Enrollee cases** average near-legitimate billing (₹262,772) but are identified through 0–1 day length of stay combined with disproportionately high claim amounts — a key pattern for insurance audit teams.

5. **₹248M in fraudulent billing** out of ₹476M total — over half of all healthcare revenue in this dataset is linked to fraudulent claims, highlighting the urgent need for automated fraud detection systems.

---

## 🗃️ Dataset

- **Records:** 1,500 patient entries
- **Date Range:** 2022 – 2024
- **Source:** Synthetic healthcare billing dataset
- **Columns:** Patient ID · Age · Gender · Date Admitted · Date Discharged · Diagnosis · Treatment · Amount Billed · Fraud Type
- **Fraud Categories:** No Fraud (887) · Fake Treatment (243) · Phantom Billing (206) · Ghost Enrollee (164)


---

## 👤 Author

**Praises Kalintha**  
📧 kalinthapraises777@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/praises-kalintha-30a621354/)  
💻 [GitHub](https://github.com/praises4084?tab=repositories)

<img width="1920" height="1080" alt="Screenshot (20)" src="https://github.com/user-attachments/assets/a2a9d332-c1b4-4715-912e-6f25ab2495da" />
<img width="1920" height="1080" alt="Screenshot (43)" src="https://github.com/user-attachments/assets/b2fc2324-bba3-4d35-9a02-7c8daca3e0ac" />
<img width="1920" height="1080" alt="Screenshot (44)" src="https://github.com/user-attachments/assets/75eab8f0-c769-43dd-9ce4-02d6058aed98" />



