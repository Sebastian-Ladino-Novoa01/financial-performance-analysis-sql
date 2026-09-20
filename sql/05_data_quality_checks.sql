/* ============================================================
   Project : Financial Performance Analysis — Adventure Works
   Step    : 05 — Data quality checks
   Purpose : Validate nulls in key fields, impossible values in the
             raw tables, and orphan sales rows that the inner join
             in step 03 silently drops.
   Engine  : PostgreSQL
   Author  : Sebastian Ladino Novoa
   ============================================================ */

-- 5.1 Null counts on the key fields of the consolidated view.
--     Any value above 0 means a row cannot be attributed to an
--     order, a product or a territory.
SELECT
    SUM(CASE WHEN numero_pedido    IS NULL THEN 1 ELSE 0 END) AS nulos_numero_pedido,
    SUM(CASE WHEN clave_producto   IS NULL THEN 1 ELSE 0 END) AS nulos_clave_producto,
    SUM(CASE WHEN clave_territorio IS NULL THEN 1 ELSE 0 END) AS nulos_clave_territorio
FROM ventas_clean;

-- 5.2 Impossible quantities: a sale cannot have zero or negative units.
SELECT COUNT(*) AS pedidos_cantidad_invalida
FROM ventas_2017
WHERE cantidad_pedido <= 0;

-- 5.3 Impossible prices: a product cannot cost less than zero.
SELECT COUNT(*) AS productos_precio_negativo
FROM productos
WHERE precio_producto < 0;

-- 5.4 Orphan sales: rows whose clave_producto has no match in the
--     product catalogue. These are exactly the rows the inner join
--     in step 03 removes. If this returns 0, inner and left join
--     are equivalent and the revenue total is complete.
SELECT COUNT(*) AS ventas_sin_producto
FROM ventas_2017 AS v
LEFT JOIN productos AS p
  ON v.clave_producto = p.clave_producto
WHERE p.clave_producto IS NULL;
