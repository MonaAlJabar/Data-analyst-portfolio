-- Project: CMS HCAHPS MySQL
-- File: 01_setup.sql
-- Purpose: one-time setup (data typing, views, indexes)

USE cms_hcahps;



-- 01) Normalize column data types 
ALTER TABLE hospitals_hcahps
  MODIFY `Facility ID` VARCHAR(20),
  MODIFY `Facility Name` VARCHAR(255),
  MODIFY State CHAR(2),
  MODIFY `Hospital Type` VARCHAR(100),
  MODIFY `Hospital Ownership` VARCHAR(150);


-- 02) Enforce numeric types for KPI columns 
ALTER TABLE hospitals_hcahps
  MODIFY nurse_comm_always_pct DECIMAL(7,6),
  MODIFY recommend_definitely_pct DECIMAL(7,6),
  MODIFY overall_9_10_pct DECIMAL(7,6);


-- 03) Create a presentation view with KPI percentages (0–100) for easy readability
CREATE OR REPLACE VIEW v_hospital_kpis AS
SELECT
  `Facility ID`        AS facility_id,
  `Facility Name`      AS facility_name,
  State                AS state,
  `Hospital Type`      AS hospital_type,
  `Hospital Ownership` AS hospital_ownership,

  ROUND(nurse_comm_always_pct * 100, 1)     AS nurse_comm_always_pct,
  ROUND(recommend_definitely_pct * 100, 1)  AS recommend_definitely_pct,
  ROUND(overall_9_10_pct * 100, 1)          AS overall_9_10_pct
FROM hospitals_hcahps;


-- 04) Indexes to speed up group-bys/filters
CREATE INDEX idx_state ON hospitals_hcahps (State);
CREATE INDEX idx_ownership ON hospitals_hcahps (`Hospital Ownership`);
