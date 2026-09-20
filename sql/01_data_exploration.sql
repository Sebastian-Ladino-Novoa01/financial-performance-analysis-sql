/* ============================================================
   Project : Financial Performance Analysis — Adventure Works
   Step    : 01 — Data exploration
   Purpose : Inspect the five source tables before joining them,
             to confirm structure, columns and grain.
   Engine  : PostgreSQL
   Author  : Sebastian Ladino Novoa
   ============================================================ */

-- 1.1 Sales fact table for 2017
SELECT *
FROM ventas_2017
LIMIT 10;

-- 1.2 Product dimension
SELECT *
FROM productos
LIMIT 10;

-- 1.3 Product category dimension
SELECT *
FROM productos_categorias
LIMIT 10;

-- 1.4 Territory dimension (country / continent)
SELECT *
FROM territorios
LIMIT 10;

-- 1.5 Marketing campaign costs
SELECT *
FROM campanas
LIMIT 10;
