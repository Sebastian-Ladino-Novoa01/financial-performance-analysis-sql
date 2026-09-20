/* ============================================================
   Project : Financial Performance Analysis — Adventure Works
   Step    : 04 — Profitability KPIs
   Purpose : Combine revenue, cost and campaign spend per country
             to produce gross profit, margin % and marketing ROI %.
   Engine  : PostgreSQL
   Author  : Sebastian Ladino Novoa
   ============================================================ */

-- 4.1 Campaign spend aggregated to one row per territory.
--     Aggregating BEFORE the join prevents fan-out: if a territory
--     had several campaign rows, joining first would duplicate the
--     revenue rows and inflate every total downstream.
CREATE OR REPLACE VIEW pais_campanas AS
SELECT
    clave_territorio,
    SUM(costo_campana)::integer AS costo_campana
FROM campanas
GROUP BY clave_territorio;

-- 4.2 Final KPI table by country.
SELECT
    p.pais,
    p.clave_territorio,
    p.ingresos,
    p.costos,
    COALESCE(c.costo_campana, 0)  AS costo_campana,
    p.ingresos - p.costos         AS beneficio_bruto,
    ROUND(
        (p.ingresos - p.costos) * 100.0
        / NULLIF(p.ingresos, 0)
    , 2) AS margen_pct,
    ROUND(
        (p.ingresos - p.costos) * 100.0
        / NULLIF(c.costo_campana, 0)
    , 2) AS roi_pct
FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
  ON p.clave_territorio = c.clave_territorio
ORDER BY beneficio_bruto DESC;
