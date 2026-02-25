# CMS HCAHPS Patient Experience Dashboard (Excel + Power Query)

![Dashboard](screenshots/dashboard.png)
![Map](screenshots/map.png)

## Overview
A refreshable Excel dashboard built from CMS Provider Data to compare hospital patient experience by state, ownership type, and facility.

## Data Sources (CMS Provider Data)
- Hospitals: Hospital General Information (CSV)
- Patient Experience: HCAHPS – Hospital Patient Survey (CSV)

## Join Key
- **Facility ID** (stored as Text in all queries)

## Power Query Steps
- Imported both CSVs using Power Query  
- Set data types (Facility ID = Text; dates = Date; KPIs = Number)  
- Replaced **Not Available / Not Applicable** with null  
- Kept the latest reporting period using **End Date** and removed duplicates  
- Filtered to selected HCAHPS top-box measures and pivoted to **1 row per hospital**  
- Merged HCAHPS KPIs into Hospital General Information using Facility ID  

## KPIs (HCAHPS Top-Box %)
- Nurse communication (Always) %
- Recommend the hospital (Yes, definitely) %
- Overall hospital rating (9–10) %

## Dashboard Views
- Patient Experience by State (HCAHPS Top-Box %)
- Patient Experience by Ownership Type (HCAHPS Top-Box %)
- Patient Experience by Facility (HCAHPS Top-Box %, Filtered)
- Filled map view (state-level metric)

## Key Takeaways (All Hospitals)
- Overall averages: Nurse **80%**, Recommend **70%**, Overall **72%**
- Top states by Recommend %: **NE / KS / SD / UT**
- Lowest by Recommend %: **VI / DC / PR**

## How to Refresh
Excel → Data → Refresh All
