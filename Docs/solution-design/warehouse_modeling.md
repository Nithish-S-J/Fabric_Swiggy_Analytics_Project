# Warehouse Modeling & Star Schema Design

## Project
Swiggy Enterprise Analytics Platform

---

# Objective

Design an enterprise-grade analytical warehouse using Microsoft Fabric Warehouse and Star Schema modeling principles.

The warehouse layer transforms cleaned Silver datasets into curated analytical tables optimized for reporting, KPI calculations, and Power BI semantic modeling.

---

# Enterprise Warehouse Architecture

The warehouse follows a dimensional modeling approach consisting of:

- Fact Tables
- Dimension Tables
- Analytical Views

This structure supports:
- scalable reporting
- optimized analytics
- simplified business intelligence
- enterprise KPI reporting

---

# Source Silver Tables

| Silver Table | Business Domain |
|---|---|
| silver_orders | Commerce Analytics |
| silver_deliveries | Logistics Intelligence |
| silver_restaurants | Restaurant Intelligence |

---

# Dimension Tables

## dim_date

### Business Purpose
Centralized calendar dimension used for enterprise time intelligence analysis.

### Key Columns
- date_key
- full_date
- year
- quarter
- month
- month_name
- day_name
- weekend_flag

### Business Usage
- revenue trends
- monthly KPIs
- weekend analysis
- quarterly reporting

---

## dim_customers

### Business Purpose
Customer dimension used for customer segmentation and order behavior analysis.

### Key Columns
- customer_id
- total_orders
- customer_segment

### Business Usage
- repeat customer analysis
- customer segmentation
- retention analytics

---

## dim_restaurants

### Business Purpose
Restaurant master dimension used for cuisine and operational analysis.

### Key Columns
- restaurant_id
- restaurant_name
- city
- area
- cuisine_types
- average_rating
- cost_category

### Business Usage
- restaurant performance
- cuisine analysis
- regional intelligence
- pricing analytics

---

## dim_delivery

### Business Purpose
Delivery operations dimension used for logistics and SLA analytics.

### Key Columns
- delivery_id
- delivery_person_id
- vehicle_type
- delivery_speed_category
- delivery_partner_performance

### Business Usage
- rider efficiency
- SLA tracking
- vehicle utilization
- operational monitoring

---

# Fact Tables

## fact_orders

### Business Purpose
Central transactional fact table storing order-level metrics and operational KPIs.

### Business Grain
One row per order transaction.

### Key Measures
- order_value_inr
- delivery_time_minutes
- service_rating

### Key Flags
- delivery_delay
- refund_requested
- sla_breach_flag

### Analytical Use Cases
- revenue reporting
- customer behavior
- operational KPI monitoring
- SLA performance tracking

---

# Analytical View Layer

## vw_order_analytics

### Purpose
Business-ready analytical view joining fact and dimension tables for Power BI consumption.

### Benefits
- simplified reporting layer
- reusable business logic
- semantic model optimization
- centralized KPI structure

---

# Star Schema Design

## Relationships

| Fact Table | Dimension Table | Join Key |
|---|---|---|
| fact_orders | dim_date | order_date |
| fact_orders | dim_customers | customer_id |

Future Enhancements:
- restaurant integration
- delivery intelligence integration
- location intelligence

---

# Enterprise Modeling Standards

## Naming Conventions
- lowercase naming
- underscore format
- business-readable column names

Example:
- order_value_inr
- delivery_time_minutes
- customer_segment

---

# Data Modeling Principles

The warehouse follows:
- dimensional modeling
- medallion architecture
- curated analytical datasets
- business-first KPI design

---

# Business Value

The warehouse layer enables:

- executive KPI reporting
- operational monitoring
- customer analytics
- delivery SLA analysis
- restaurant intelligence
- scalable Power BI dashboards

---

# Technology Stack

| Layer | Technology |
|---|---|
| Storage | Fabric Lakehouse |
| Processing | Dataflow Gen2 |
| Warehouse | Fabric Warehouse |
| Transformation | SQL |
| Semantic Layer | Power BI |
| Visualization | Power BI Reports |

---

# Current Project Status

## Completed
- Bronze Layer
- Silver Layer
- Warehouse Setup
- Dimension Modeling
- Fact Table Modeling
- Analytical View Layer

## Upcoming
- Semantic Model
- DAX Measures
- KPI Development
- Power BI Dashboards
- Executive Reporting
