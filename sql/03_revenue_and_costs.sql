/* ============================================================
   Project : Financial Performance Analysis — Adventure Works
   Step    : 03 — Revenue and cost calculation
   Purpose : Build the two intermediate views that the KPI step
             reads from: one at order-line grain, one aggregated
             by country.
   Engine  : PostgreSQL
   Author  : Sebastian Ladino Novoa
   ============================================================ */

-- 3.1 Order-line level view: revenue and cost per line.
--     Stored as a view so later steps can query it by name
--     instead of repeating the whole join.
CREATE OR REPLACE VIEW ventas_clean AS
SELECT
    v.numero_pedido,
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0) AS precio_producto,
    COALESCE(v.cantidad_pedido, 0) AS cantidad_pedido,
    COALESCE(p.costo_producto, 0)  AS costo_producto,
    t.pais,
    t.continente,
    v.clave_territorio,
    COALESCE(p.precio_producto, 0) * COALESCE(v.cantidad_pedido, 0) AS ingreso_total,
    COALESCE(p.costo_producto, 0)  * COALESCE(v.cantidad_pedido, 0) AS costo_total
FROM ventas_2017 AS v
JOIN productos AS p
  ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
  ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
  ON v.clave_territorio = t.clave_territorio;

-- 3.2 Country level view: revenue and cost aggregated.
CREATE OR REPLACE VIEW pais_ingreso_costo AS
SELECT
    pais,
    clave_territorio,
    SUM(ingreso_total)::integer AS ingresos,
    SUM(costo_total)::integer   AS costos
FROM ventas_clean
GROUP BY pais, clave_territorio;

-- 3.3 Inspect the aggregated result.
SELECT *
FROM pais_ingreso_costo
ORDER BY ingresos DESC;
