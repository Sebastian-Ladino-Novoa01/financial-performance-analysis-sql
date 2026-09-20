# Adventure Works Financial Analysis (SQL)

Financial performance analysis using SQL to evaluate revenue, profitability and marketing ROI across different countries.

## Project Overview

This project was completed during the TripleTen Data Analytics Bootcamp.

The objective was to analyze Adventure Works sales data and answer two key business questions:

- Which countries generate the highest revenue?
- Which markets are the most profitable after marketing costs?

## Tools

- SQL
- PostgreSQL
- Google Sheets

## SQL Scripts

The analysis is split into five scripts, meant to be run in order:

| # | Script | What it does |
|---|--------|--------------|
| 01 | [`01_data_exploration.sql`](sql/01_data_exploration.sql) | Inspects the five source tables before joining them |
| 02 | [`02_joins_and_cleaning.sql`](sql/02_joins_and_cleaning.sql) | Joins sales with products, categories and territories; handles nulls with `COALESCE` |
| 03 | [`03_revenue_and_costs.sql`](sql/03_revenue_and_costs.sql) | Builds the `ventas_clean` and `pais_ingreso_costo` views with revenue and cost per line |
| 04 | [`04_profitability_kpis.sql`](sql/04_profitability_kpis.sql) | Calculates gross profit, margin % and marketing ROI % by country |
| 05 | [`05_data_quality_checks.sql`](sql/05_data_quality_checks.sql) | Validates nulls, impossible values and orphan sales rows |

## Skills Demonstrated

- SQL JOINs
- Data Cleaning
- Financial KPIs
- Revenue Analysis
- Gross Profit Calculation
- Margin %
- ROI Analysis
- Business Insights

## Business KPIs

- Revenue
- Total Cost
- Gross Profit
- Gross Margin %
- Marketing ROI %

## Project Workflow

1. Explored the database schema.
2. Joined sales, products, territories and marketing tables.
3. Cleaned missing values using `COALESCE`.
4. Calculated financial KPIs.
5. Performed QA validation.
6. Produced executive business recommendations.

## Results

### Financial Results

![Financial Results](financial_results.png)

### Executive Summary

![Executive Summary](executive_summary.png)

## Key Findings

- United States generated the highest gross profit.
- Australia was the second strongest market.
- Gross margins remained stable across countries.
- Marketing investment significantly reduced overall profitability, suggesting budget optimization opportunities.

## Project Files

- [Executive summary workbook (.xlsx)](Proyecto%203_%20An%C3%A1lisis%20del%20desempe%C3%B1o%20financiero%20con%20SQL%20-%20Resumen%20ejecutivo%20%20(1).xlsx)
