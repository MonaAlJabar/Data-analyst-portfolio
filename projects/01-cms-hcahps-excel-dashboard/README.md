# CMS HCAHPS Patient Experience Dashboard (Excel + Power Query)

![Dashboard](screenshots/dashboard.png)  
![Map](screenshots/map.png)

## Overview
A refreshable Excel dashboard built from CMS Provider Data to compare hospital patient experience by state, ownership type, and facility.

## Data Sources (CMS Provider Data)
- Hospitals: Hospital General Information (CSV)
- Patient Experience: HCAHPS – Hospital Patient Survey (CSV)

## Join Key
- Facility ID (stored as Text in all queries)

## Power Query Steps
- Imported both CSVs using Power Query
- Set data types (Facility ID = Text; dates = Date; KPI fields = Number)
- Replaced Not Available / Not Applicable with null
- Kept the latest reporting period using End Date and removed duplicates
- Filtered to selected HCAHPS top-box measures and pivoted to 1 row per hospital
- Merged HCAHPS KPIs into Hospital General Information using Facility ID

## KPIs (HCAHPS Top-Box %)
- Nurse communication (Always) %
- Recommend the hospital (Yes, definitely) %
- Overall hospital rating (9–10) %

## KPI Definitions (Compact)

### Nurse Communication (Always) %
- **Definition:** CMS-published percentage of surveyed patients selecting “Always” for the item: nurses “Always communicated well.”
- **How calculated (exact logic):** Uses `HCAHPS Answer Percent` where `HCAHPS Question` = *Patients who reported that their nurses "Always" communicated well* and `HCAHPS Answer Description` = *Always*. If multiple periods exist, the **latest `End Date`** is kept. Values of **Not Available / Not Applicable** are treated as null.
- **Level:** Hospital-level (per facility per reporting period). Dashboard shows **average across hospitals** when grouped by State or Ownership.
- **Why it matters:** Reflects frontline communication quality, a major driver of patient experience.

### Recommend the Hospital (Yes, definitely) %
- **Definition:** CMS-published percentage of surveyed patients who responded “Yes, definitely” to recommending the hospital.
- **How calculated (exact logic):** Uses `HCAHPS Answer Percent` where `HCAHPS Question` = *Patients who reported YES, they would definitely recommend the hospital* and `HCAHPS Answer Description` = *Yes, definitely*. If multiple periods exist, the **latest `End Date`** is kept. Values of **Not Available / Not Applicable** are treated as null.
- **Level:** Hospital-level (per facility per reporting period). Dashboard shows **average across hospitals** when grouped by State or Ownership, and supports facility-level filtering.
- **Why it matters:** Strong summary indicator of overall satisfaction and patient loyalty.

### Overall Hospital Rating (9–10) %
- **Definition:** CMS-published percentage of surveyed patients rating the hospital 9 or 10 on a 0–10 scale.
- **How calculated (exact logic):** Uses `HCAHPS Answer Percent` where `HCAHPS Question` = *Patients who gave their hospital a rating of 9 or 10 on a scale from 0 (lowest) to 10 (highest)* and `HCAHPS Answer Description` matches the top-box category (commonly *9 and 10* / *9–10*). If multiple periods exist, the **latest `End Date`** is kept. Values of **Not Available / Not Applicable** are treated as null.
- **Level:** Hospital-level (per facility per reporting period). Dashboard shows **average across hospitals** when grouped by State or Ownership.
- **Why it matters:** Headline patient experience measure that captures broad aspects of care beyond communication alone.

## Dashboard Views
- Patient Experience by State (HCAHPS Top-Box %)
- Patient Experience by Ownership Type (HCAHPS Top-Box %)
- Patient Experience by Facility (HCAHPS Top-Box %, Filtered)
- Filled map view (state-level metric)

## Key Takeaways (All Hospitals)
- Overall averages: Nurse 80%, Recommend 70%, Overall 72%
- Top states by Recommend %: NE / KS / SD / UT
- Lowest by Recommend %: VI / DC / PR

## How to Refresh
Excel → Data → Refresh All  
(To refresh on another machine, update the Power Query “Source” file paths to your local CSV locations.)

## Files
- Screenshots are included in `/screenshots/`.
- Workbook available upon request.
