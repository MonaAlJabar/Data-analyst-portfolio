# CMS HCAHPS Patient Experience Analysis (MySQL)

## Overview
This project loads the cleaned CMS HCAHPS hospital dataset into MySQL and reproduces the key Excel dashboard insights using SQL.

## Database Objects
- **Schema:** `cms_hcahps`
- **Table:** `hospitals_hcahps` (one row per facility)
- **View:** `v_hospital_kpis` (KPIs formatted as 0–100 percentages for readability)

## KPIs (HCAHPS Top-Box %)
- Nurse communication (Always)
- Recommend the hospital (Definitely)
- Overall hospital rating (9–10)

## Files
- `sql/01_setup.sql`
  - Normalizes text columns (VARCHAR/CHAR)
  - Enforces KPI numeric types (DECIMAL)
  - Creates the `v_hospital_kpis` view
  - Adds helpful indexes (State, Hospital Ownership)
- `sql/02_analysis.sql`
  - Overall averages (matches Excel dashboard)
  - State ranking + top/bottom states by Recommend
  - Ownership comparison
  - Bottom facilities by Recommend
  - Bonus: gap analysis (high nurse, low recommend)

## Validation (Matches Excel Dashboard)
- Overall averages ≈ Nurse ~80%, Recommend ~70%, Overall ~72%
- Top states by Recommend % include NE / KS / SD / UT
- Lowest by Recommend % include VI / DC / PR
