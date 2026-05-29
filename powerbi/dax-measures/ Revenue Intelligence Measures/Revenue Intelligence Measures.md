# Revenue Intelligence Measures

## Overview

Revenue Intelligence measures provide advanced financial and growth analytics across the Swiggy Enterprise Analytics Platform.

These measures support:

- Revenue Trend Analysis
- Growth Analytics
- Time Intelligence
- Executive Reporting
- Financial Performance Monitoring

Display Folder:

```text
Revenue KPIs
```

---

# 1. Revenue MTD

## DAX

```DAX
Revenue MTD =
TOTALMTD (
    [Total Revenue],
    dim_date[full_date]
)
```

## Business Purpose

Measures revenue generated from the beginning of the current month to the selected date.

Used for:

- Monthly Performance Tracking
- Executive Reporting
- Revenue Monitoring

---

# 2. Revenue QTD

## DAX

```DAX
Revenue QTD =
TOTALQTD (
    [Total Revenue],
    dim_date[full_date]
)
```

## Business Purpose

Measures quarter-to-date revenue performance.

Used for:

- Quarterly Reviews
- Executive Scorecards
- Financial Analysis

---

# 3. Revenue YTD

## DAX

```DAX
Revenue YTD =
TOTALYTD (
    [Total Revenue],
    dim_date[full_date]
)
```

## Business Purpose

Measures year-to-date revenue accumulation.

Used for:

- Annual Performance Tracking
- Board Reporting
- Strategic Planning

---

# 4. Previous Month Revenue

## DAX

```DAX
Previous Month Revenue =
CALCULATE (
    [Total Revenue],
    DATEADD (
        dim_date[full_date],
        -1,
        MONTH
    )
)
```

## Business Purpose

Returns revenue from the previous month.

Used for:

- Growth Comparisons
- Trend Analysis
- Executive Reporting

---

# 5. Revenue Growth %

## DAX

```DAX
Revenue Growth % =
DIVIDE (
    [Total Revenue] - [Previous Month Revenue],
    [Previous Month Revenue]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures month-over-month revenue growth.

Used for:

- Executive Dashboards
- Growth Reporting
- Business Reviews

---

# 6. Revenue Share %

## DAX

```DAX
Revenue Share % =
DIVIDE (
    [Total Revenue],
    CALCULATE (
        [Total Revenue],
        ALL ( fact_orders[platform] )
    )
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures platform contribution to total revenue.

Used for:

- Platform Benchmarking
- Competitive Analysis
- Revenue Contribution Studies

---

# 7. Revenue Rank

## DAX

```DAX
Revenue Rank =
RANKX (
    ALL ( fact_orders[platform] ),
    [Total Revenue],
    ,
    DESC
)
```

## Business Purpose

Ranks platforms by revenue.

Used for:

- Benchmark Reporting
- Executive Scorecards
- Platform Performance Analysis

---

# 8. Average Revenue Per Customer

## DAX

```DAX
Average Revenue Per Customer =
DIVIDE (
    [Total Revenue],
    DISTINCTCOUNT (
        fact_orders[customer_id]
    )
)
```

## Business Purpose

Measures customer monetization efficiency.

Used for:

- Customer Value Analysis
- Growth Strategy
- Executive Reporting

---

# Revenue KPI Summary

| KPI | Purpose |
|------|----------|
| Revenue MTD | Monthly revenue tracking |
| Revenue QTD | Quarterly revenue tracking |
| Revenue YTD | Annual revenue tracking |
| Previous Month Revenue | Historical comparison |
| Revenue Growth % | MoM growth analysis |
| Revenue Share % | Contribution analysis |
| Revenue Rank | Platform ranking |
| Average Revenue Per Customer | Customer monetization |

---

# Semantic Model Structure

```text
_MEASURES

├── Executive KPIs
│
└── Revenue KPIs
    ├── Revenue MTD
    ├── Revenue QTD
    ├── Revenue YTD
    ├── Previous Month Revenue
    ├── Revenue Growth %
    ├── Revenue Share %
    ├── Revenue Rank
    └── Average Revenue Per Customer
```
