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

# 📖 What We Found — The Data Story

The Scale of the Problem
Out of 1,500 patient records audited, 613 cases (40.87%) were fraudulent, with fraud accounting for
₹248 million — 52.06% of all revenue billed. In other words, for every ₹2 billed, more than ₹1
was fraudulent. This is not a fringe problem; it is the dominant billing pattern in this dataset.

Not All Fraud Is Equal
The four fraud types vary dramatically in how they operate and what they cost:

| Fraud Type | Cases | Avg Billing | vs Legitimate |
| --- | --- | --- | --- |
| No Fraud (baseline) | 887 | ₹257,503 | — |
|Ghost Enrollee | 164 | ₹262,773 | +2% |
| Fake Treatment | 243 | ₹381,962 | +48% |
| Phantom Billing | 206 | ₹544,507 | +111% |

Phantom Billing is the most dangerous fraud type — not just because it bills at 2× the legitimate
rate, but because it targets the most expensive procedures. Ghost Enrollee fraud is the most
deceptive — billing almost identically to legitimate cases (+2%), making it nearly impossible to
detect without cross-referencing admission and discharge dates.

---

# High-Value Procedures Are Being Systematically Exploited

Eight diagnoses showed a 100% fraud rate — every single case filed under these procedures was fraudulent:

| Diagnosis | Fraud Cases | Avg Billing (₹) | Total Fraud (₹) |
| --- | --- | --- | --- |
| Epilepsy Surgery | 23 | 625,052 | 14,376,200 |
| Infertility Treatment (IVF) | 33 | 583,118 | 19,242,906 |
| Cosmetic Surgery | 27 | 581,172 | 15,691,632 |
| Organ Transplant | 23 | 579,659 | 13,332,161 |
| Cancer Treatment | 30 | 491,026 | 14,730,770 |
| Complex Heart Surgery | 26 | 506,539 | 13,170,025 |
| Neurosurgery | 21 |503,447 | 10,572,384
| Advanced Spinal Surgery | 23 | 480,537 | 11,052,342 |


These are not random targets. Fraudsters specifically chose high-cost, hard-to-verify surgical
procedures where phantom billing is difficult to dispute. Epilepsy Surgery had the highest average
billing per case at ₹625,052 — nearly 2.5× the legitimate baseline.
IVF fraud alone accounts for ₹19.2 million — the single largest fraudulent diagnosis category.

---

# Common Conditions Are Also at Risk
Beyond the 100% fraud diagnoses, several everyday conditions showed significant fraud infiltration:

| Diagnosis | Total Cases | Fraud Cases | Fraud Rate |
| --- | --- | --- | --- |
| Hypertension | 90 | 35 | 38.89% |
| Tuberculosis | 103 | 40 | 38.83% |
| Gastroenteritis | 90 | 33 | 36.67% |
| Stroke | 84 | 28 | 33.33% |
| Pneumonia | 102 | 34 | 33.33% |
| Cesarean Section | 90 | 29 | 32.22% |

# Tuberculosis had the highest case volume (103 records) with a 38.83% fraud rate —
making it the most fraud-infiltrated high-volume condition. These conditions are targeted because they are common,frequently billed, and harder to audit at scale.

---

# Every Age Group Is a Target — But Patterns Differ
Fraud does not discriminate by age, but the type of fraud does:

| Age Group | Dominant Fraud Type | Avg Billing (₹) |
| --- | --- | --- |
| 0–18 | Phantom Billing | 677,960 |
| 19–35 | Phantom Billing | 524,915 |
| 36–55 | Fake Treatment | 367,154 |
| 56–75 | Phantom Billing | 560,497 |
| 76+ | Phantom Billing | 548,259 |

Children (0–18) face the highest average Phantom Billing at ₹677,960 per case — the most
expensive fraud billing of any age group. This is alarming because minors are least likely to
self-report billing discrepancies.

The 76+ age group had the highest Ghost Enrollee count (48 cases) —  elderly patients are
disproportionately enrolled as ghost beneficiaries, likely because their records are less actively
monitored.
The 36–55 group shifts toward Fake Treatment rather than Phantom Billing — suggesting fraudsters
adapt their method based on what is plausible for the age profile.

The Worst Individual Cases
The highest single fraudulent claim was **₹988,887** for a Cosmetic Surgery Phantom Billing case —
nearly   ****4× the legitimate average billing. The top 20 worst offending cases all involved
Phantom Billing, spread across Cosmetic Surgery, Organ Transplant, Complex Heart Surgery, Epilepsy
Surgery, IVF, Neurosurgery, Advanced Spinal Surgery, and Cancer Treatment — all high-cost,
low-scrutiny procedures.

---

# The Bottom Line

₹248 million was fraudulently billed across 613 cases.
Eight surgical procedures had a 100% fraud rate.Children were billed at the highest phantom rates.The elderly were disproportionately used as ghost enrollees.
And the most dangerous fraud type — Phantom Billing — costs 111% more than a legitimate claim.

This analysis demonstrates that healthcare fraud is not random. It is systematic, targeted, and
concentrated in predictable places — which means it is detectable, and preventable, with the right
data tools.

## 🗃️ Dataset Description

| Column |  Description |
| --- | --- |
| Patient_ID | Unique identifier for each patient record |
|Admission_Date | Date patient was admitted |
|Discharge_Date | Date patient was discharged |
|Diagnosis | Medical diagnosis code/description |
|Treatment | Treatment provided |
|Amount_Billed | Total amount billed for the claim |
|Fraud_Type | Category: Phantom Billing / Fake Treatment / Ghost Enrollee / No Fraud |
|Age | Patient age |
|Provider_ID | Healthcare provider identifier |

Dataset size: 1,500 records | Format: CSV 

---

🚀 How to Run
SQL Analysis

Open any SQL client (MySQL Workbench, DBeaver, pgAdmin, etc.)
Import the dataset from Dataset/ folder
Run queries from the SQL/ folder in order (Q1 through Q10)
Recommended database: MySQL or PostgreSQL

Power BI Dashboard

Download and install Power BI Desktop (free)
Open Power BI/Healthcare_Fraud_Dashboard.pbix
If prompted, update the data source path to point to your local Dataset/ folder
Refresh the data and explore the dashboard

---

🛠️ Tech Stack

| Tool |  Purpose |
| --- | --- |
| MySQL |  querying and analysis |
| Power BI | DesktopDashboard and visualization |
| Microsoft Excel  | Data storage and preparation |

## 👤 Author

**Praises Kalintha**  
📧 kalinthapraises777@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/praises-kalintha-30a621354/)  
💻 [GitHub](https://github.com/praises4084?tab=repositories)

<img width="1920" height="1080" alt="Screenshot (20)" src="https://github.com/user-attachments/assets/a2a9d332-c1b4-4715-912e-6f25ab2495da" />
<img width="1920" height="1080" alt="Screenshot (3)" src="https://github.com/user-attachments/assets/8d717613-620b-41a2-85c7-aad9b61f0bc9" />
<img width="1920" height="1080" alt="Screenshot (4)" src="https://github.com/user-attachments/assets/7f757664-6ba8-4fff-b8eb-d366c9021ab8" />





