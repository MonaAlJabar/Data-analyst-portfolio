# CMS HCAHPS Patient Experience Analysis (MySQL)

## Overview
This project loads the cleaned CMS HCAHPS hospital dataset into MySQL and reproduces the Excel dashboard insights using SQL.

## Database Objects
- **Schema:** `cms_hcahps`
- **Table:** `hospitals_hcahps` (one row per facility)
- **View:** `v_hospital_kpis` (presentation layer: KPIs output as 0–100 percentages)

## KPIs (HCAHPS Top-Box %)
- Nurse communication (Always)
- Recommend the hospital (Definitely)
- Overall hospital rating (9–10)

## Files
- [`sql/01_setup.sql`](sql/01_setup.sql) — normalize column types, enforce KPI numeric types, create view, add indexes
- [`sql/02_analysis.sql`](sql/02_analysis.sql) — overall averages, state ranking, top/bottom states, ownership comparison, bottom facilities, gap analysis

## Key Results (Matches Excel Dashboard)
- Overall averages ≈ Nurse ~80%, Recommend ~70%, Overall ~72%
- Top states by Recommend % include **NE / KS / SD / UT**
- Lowest by Recommend % include **VI / DC / PR**

## How to Run
1. Run `sql/01_setup.sql` (one-time setup: view + indexes).
2. Run `sql/02_analysis.sql` to reproduce the analysis queries.
