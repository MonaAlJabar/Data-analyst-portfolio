# CMS HCAHPS Patient Experience Dashboard (Excel + Power Query)

![Dashboard](screenshots/dashboard.png)  
![Map](screenshots/map.png)

## Overview
A refreshable Excel dashboard built from CMS Provider Data to compare hospital patient experience by **state**, **ownership type**, and **facility**.

## Data Sources (CMS Provider Data)
- Hospitals: Hospital General Information (CSV)
- Patient Experience: HCAHPS – Hospital Patient Survey (CSV)

## Join Key
- **Facility ID** (stored as **Text** in all queries)

## Data Preparation (Power Query)
- Imported both CSVs and standardized data types (Facility ID = Text; dates = Date; KPI fields = Number)
- Converted **Not Available / Not Applicable** to null
- Kept the **latest reporting period** using **End Date** and removed duplicates
- Filtered to selected HCAHPS **top-box** measures and pivoted to **one row per hospital**
- Merged HCAHPS KPIs into Hospital General Information using Facility ID

## KPI Definitions (HCAHPS Top-Box %)

### Nurse Communication (Always) %
- **Definition:** % of surveyed patients selecting **“Always”** for the item: nurses **“Always communicated well.”**
- **Why it matters:** Reflects frontline communication quality and strongly influences patient experience.

### Recommend the Hospital (Yes, definitely) %
- **Definition:** % of surveyed patients who answered **“Yes, definitely”** when asked if they would recommend the hospital.
- **Why it matters:** Strong summary indicator of overall satisfaction and patient loyalty.

### Overall Hospital Rating (9–10) %
- **Definition:** % of surveyed patients rating the hospital **9 or 10** on a 0–10 scale.
- **Why it matters:** Headline patient experience measure capturing broad aspects of care beyond communication alone.

## Measurement Notes (Applied to All KPIs)
- KPI values come from CMS as `HCAHPS Answer Percent` for the selected question/answer rows.
- When multiple reporting periods existed, the **latest `End Date`** was retained.
- **Not Available / Not Applicable** values were treated as null and excluded from averages.
- Dashboard comparisons by State/Ownership report the **average across hospitals** (unweighted).

## Dashboard Views
- Patient Experience by State (Top-Box %)
- Patient Experience by Ownership Type (Top-Box %)
- Patient Experience by Facility (Top-Box %, filtered)
- Filled map view (state-level metric)

## Key Takeaways (All Hospitals)
- Overall averages: Nurse **80%**, Recommend **70%**, Overall **72%**
- Top states by Recommend %: **NE / KS / SD / UT**
- Lowest by Recommend %: **VI / DC / PR**

## How to Refresh
Excel → Data → Refresh All  
*(To refresh on another machine, update the Power Query “Source” file paths to your local CSV locations.)*

## Files
- Screenshots are included in `/screenshots/`.
- Workbook available upon request.
