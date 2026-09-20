/* ============================================================
   Project : Financial Performance Analysis — Adventure Works
   Step    : 02 — Joins and null handling
   Purpose : Consolidate sales, products, categories and territories
             into a single flat table, replacing nulls with 0 so
             downstream arithmetic does not propagate NULL.
   Engine  : PostgreSQL
   Author  : Sebastian Ladino Novoa
   ============================================================ */

-- 2.1 Join the fact table with its three dimensions.
--     LEFT JOIN keeps every sales row even when a dimension
--     has no match, so no revenue is silently dropped.
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
    v.clave_territorio
FROM ventas_2017 AS v
LEFT JOIN productos AS p
  ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
  ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
  ON v.clave_territorio = t.clave_territorio;
