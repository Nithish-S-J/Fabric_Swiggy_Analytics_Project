# Customer Intelligence KPI Measures

## Overview

Customer Intelligence KPIs provide visibility into customer value, engagement, satisfaction, and retention risk.

These measures support:

- Customer Intelligence Dashboard
- Customer Segmentation Analysis
- Retention Programs
- Revenue Contribution Analysis
- Executive Reporting

Display Folder:

```text
Customer KPIs
```

---

# 1. Total Customers

## DAX

```DAX
Total Customers =
DISTINCTCOUNT (
    fact_orders[customer_id]
)
```

## Business Purpose

Measures total unique customers placing orders.

Used for:

- Customer Growth Tracking
- Executive Reporting

---

# 2. Active Customers

## DAX

```DAX
Active Customers =
DISTINCTCOUNT (
    fact_orders[customer_id]
)
```

## Business Purpose

Measures customers active within current filter context.

Used for:

- Customer Engagement Analysis
- Growth Monitoring

---

# 3. Average Revenue Per Customer

## DAX

```DAX
Average Revenue Per Customer =
DIVIDE (
    [Total Revenue],
    [Total Customers]
)
```

## Business Purpose

Measures average customer value.

Used for:

- Customer Monetization Analysis
- Revenue Optimization

---

# 4. High Value Customers

## DAX

```DAX
High Value Customers =
CALCULATE (
    DISTINCTCOUNT ( fact_orders[customer_id] ),
    fact_orders[high_value_order_flag] = "High"
)
```

## Business Purpose

Measures customers placing high-value orders.

Used for:

- VIP Customer Analysis
- Loyalty Programs

---

# 5. High Value Customer %

## DAX

```DAX
High Value Customer % =
DIVIDE (
    [High Value Customers],
    [Total Customers]
)
```

## Format

```text
Percentage
2 Decimal Places
```

---

# 6. Customer Satisfaction Score

## DAX

```DAX
Customer Satisfaction Score =
AVERAGE (
    fact_orders[service_rating]
)
```

## Business Purpose

Measures overall customer satisfaction.

Used for:

- Experience Monitoring
- Service Quality Reporting

---

# 7. Customers With Refunds

## DAX

```DAX
Customers With Refunds =
CALCULATE (
    DISTINCTCOUNT ( fact_orders[customer_id] ),
    fact_orders[refund_requested] = "Yes"
)
```

## Business Purpose

Measures customers affected by refunds.

Used for:

- Risk Monitoring
- Customer Service Analysis

---

# 8. Refund Impact %

## DAX

```DAX
Refund Impact % =
DIVIDE (
    [Customers With Refunds],
    [Total Customers]
)
```

## Format

```text
Percentage
2 Decimal Places
```

---

# 9. Repeat Purchase Rate %

## DAX

```DAX
Repeat Purchase Rate % =
DIVIDE (
    COUNTROWS (
        FILTER (
            VALUES ( fact_orders[customer_id] ),
            CALCULATE (
                COUNT ( fact_orders[order_id] )
            ) > 1
        )
    ),
    [Total Customers]
)
```

## Format

```text
Percentage
2 Decimal Places
```

## Business Purpose

Measures customer retention through repeat purchasing.

Used for:

- Loyalty Analysis
- Retention Reporting

---

# 10. Customer Lifetime Value (Proxy)

## DAX

```DAX
Customer Lifetime Value (Proxy) =
DIVIDE (
    [Total Revenue],
    [Total Customers]
)
```

## Business Purpose

Provides a simplified customer value estimate.

Used for:

- Customer Segmentation
- Strategic Planning

---

# Customer KPI Summary

| KPI | Purpose |
|------|----------|
| Total Customers | Customer base size |
| Active Customers | Customer engagement |
| Average Revenue Per Customer | Customer monetization |
| High Value Customers | VIP identification |
| High Value Customer % | Premium customer mix |
| Customer Satisfaction Score | Experience quality |
| Customers With Refunds | Service issue tracking |
| Refund Impact % | Customer risk analysis |
| Repeat Purchase Rate % | Retention measurement |
| Customer Lifetime Value (Proxy) | Customer value estimation |

---

# Semantic Model Structure

```text
_MEASURES

├── Executive KPIs
├── Revenue KPIs
├── Operations KPIs
│
└── Customer KPIs
    ├── Total Customers
    ├── Active Customers
    ├── Average Revenue Per Customer
    ├── High Value Customers
    ├── High Value Customer %
    ├── Customer Satisfaction Score
    ├── Customers With Refunds
    ├── Refund Impact %
    ├── Repeat Purchase Rate %
    └── Customer Lifetime Value (Proxy)
```
