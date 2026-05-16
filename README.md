# 🏥 Healthcare Fraud & Billing Audit Analysis
### SQL • Power BI • Healthcare Analytics • Fraud Detection

An end-to-end data analysis project detecting and quantifying fraudulent 
healthcare billing patterns across 3,000 patient records. Using SQL for 
deep data interrogation and Power BI for executive-ready visual reporting, 
this project identifies four fraud categories — Phantom Billing, Fake 
Treatment, Ghost Enrollee, and No Fraud — and quantifies their financial 
impact on total healthcare revenue.

---

## 🔢 Key Findings

| Metric | Value |
|---|---|
| Total Patient Records | 3,000 |
| Legitimate Cases | 1,774 |
| Fraudulent Cases | **1,226** |
| Overall Fraud Rate | **40.87%** |
| Total Amount Billed | ₹952,969,860 |
| Total Fraudulent Amount | **₹496,159,917** |
| Phantom Billing Total | ₹224,336,841 |
| Fraud Share of Total Revenue | **52.06%** |

---

## 💰 Average Billing by Fraud Type

| Fraud Type | Cases | Avg Amount Billed | vs Legitimate |
|---|---|---|---|
| No Fraud | 1,774 | ₹257,502 | baseline |
| Ghost Enrollee | 328 | ₹262,772 | +2% |
| Fake Treatment | 486 | ₹381,962 | **+48% higher** |
| Phantom Billing | 412 | ₹544,506 | **+111% higher** |

> Phantom Billing cases are billed 2.1× higher than legitimate claims — 
> the strongest financial fraud signal in the dataset.

---

## 🛠️ Tools & Technologies

| Tool | Usage |
|---|---|
| MySQL | Data extraction, validation, fraud pattern analysis |
| Power BI | Interactive dashboard, KPI reporting, visual storytelling |
| DAX | Custom measures, fraud rate calculations |
| Power Query | Data cleaning, date transformation |

---

## 🧮 SQL Analysis — Queries Covered

| # | Query | Technique Used |
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

---

## 📊 Dashboard Preview

### Page 1 — SQL Query Results
[your screenshot here]

### Page 2 — Fraud Overview Dashboard
[your screenshot here]

### Page 3 — Financial Impact Dashboard
[your screenshot here]

---

## 💡 Key Business Insights

1. **40.87% fraud rate** — over 2 in 5 claims are fraudulent
2. **Phantom Billing averages ₹544,506** — 2.1× higher than legitimate claims
3. **Fake Treatment (486 cases)** detected via Diagnosis ≠ Treatment mismatch
4. **Ghost Enrollee** identified through 0–1 day stays with high billing
5. **₹496M in fraudulent billing** out of ₹952M total billed

---

## 🗃️ Dataset

- Records: 3,000 patient entries | Date Range: 2022–2024
- Columns: Patient ID, Age, Gender, Date Admitted, Date Discharged, 
  Diagnosis, Treatment, Amount Billed, Fraud Type
- Fraud Categories: No Fraud · Fake Treatment · Phantom Billing · Ghost Enrollee

---

## 👤 Author

**Praises Kalintha**  
B.Tech — AI & Data Science | Saveetha University  
📧 kalinthapraises777@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/praises-kalintha-30a621354/)  
💻 [GitHub](https://github.com/praises4084?tab=repositories)

<img width="1920" height="1080" alt="Screenshot (20)" src="https://github.com/user-attachments/assets/a2a9d332-c1b4-4715-912e-6f25ab2495da" />
<img width="1920" height="1080" alt="Screenshot (43)" src="https://github.com/user-attachments/assets/b2fc2324-bba3-4d35-9a02-7c8daca3e0ac" />
<img width="1920" height="1080" alt="Screenshot (44)" src="https://github.com/user-attachments/assets/75eab8f0-c769-43dd-9ce4-02d6058aed98" />



