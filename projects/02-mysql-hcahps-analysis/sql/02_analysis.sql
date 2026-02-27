-- Project: CMS HCAHPS MySQL
-- File: 02_analysis.sql
-- Purpose: analysis queries (state, ownership, facility)

USE cms_hcahps;



-- 01) Overall averages (all hospitals)
SELECT
  ROUND(AVG(nurse_comm_always_pct), 1) AS avg_nurse_pct,
  ROUND(AVG(recommend_definitely_pct), 1) AS avg_recommend_pct,
  ROUND(AVG(overall_9_10_pct), 1) AS avg_overall_pct
FROM v_hospital_kpis;


-- 02) State KPIs (average across hospitals)
SELECT
  state,
  ROUND(AVG(nurse_comm_always_pct), 1) AS avg_nurse_pct,
  ROUND(AVG(recommend_definitely_pct), 1) AS avg_recommend_pct,
  ROUND(AVG(overall_9_10_pct), 1) AS avg_overall_pct,
  COUNT(*) AS hospital_count
FROM v_hospital_kpis
WHERE state IS NOT NULL AND state <> ''
GROUP BY state
ORDER BY avg_recommend_pct DESC;


-- 03) Top 10 states by Recommend %
SELECT
  state,
  ROUND(AVG(recommend_definitely_pct), 1) AS avg_recommend_pct,
  COUNT(*) AS hospital_count
FROM v_hospital_kpis
WHERE state IS NOT NULL AND state <> ''
GROUP BY state
ORDER BY avg_recommend_pct DESC
LIMIT 10;


-- 04) Bottom 10 states by Recommend %
SELECT
  state,
  ROUND(AVG(recommend_definitely_pct), 1) AS avg_recommend_pct,
  COUNT(*) AS hospital_count
FROM v_hospital_kpis
WHERE state IS NOT NULL AND state <> ''
GROUP BY state
ORDER BY avg_recommend_pct ASC
LIMIT 10;


-- 05) KPIs by Hospital Ownership
SELECT
  hospital_ownership,
  COUNT(*) AS hospital_count,
  ROUND(AVG(nurse_comm_always_pct), 1) AS avg_nurse_pct,
  ROUND(AVG(recommend_definitely_pct), 1) AS avg_recommend_pct,
  ROUND(AVG(overall_9_10_pct), 1) AS avg_overall_pct
FROM v_hospital_kpis
WHERE hospital_ownership IS NOT NULL AND hospital_ownership <> ''
GROUP BY hospital_ownership
ORDER BY avg_recommend_pct DESC;


-- 06) Bottom 15 facilities by Recommend %
SELECT
  facility_name,
  state,
  recommend_definitely_pct
FROM v_hospital_kpis
WHERE recommend_definitely_pct IS NOT NULL
ORDER BY recommend_definitely_pct ASC
LIMIT 15;


-- 07) Gap analysis: facilities with high nurse scores but low recommend scores
SELECT
  facility_name,
  state,
  nurse_comm_always_pct,
  recommend_definitely_pct,
  ROUND((nurse_comm_always_pct - recommend_definitely_pct), 1) AS gap_points
FROM v_hospital_kpis
WHERE nurse_comm_always_pct IS NOT NULL
  AND recommend_definitely_pct IS NOT NULL
ORDER BY gap_points DESC
LIMIT 20;


-- 08) State summary view-style output (top states across all three KPIs)
SELECT
  state,
  ROUND(AVG(nurse_comm_always_pct), 1) AS avg_nurse_pct,
  ROUND(AVG(recommend_definitely_pct), 1) AS avg_recommend_pct,
  ROUND(AVG(overall_9_10_pct), 1) AS avg_overall_pct
FROM v_hospital_kpis
WHERE state IS NOT NULL AND state <> ''
GROUP BY state
HAVING AVG(recommend_definitely_pct) IS NOT NULL
ORDER BY avg_recommend_pct DESC
LIMIT 15;
