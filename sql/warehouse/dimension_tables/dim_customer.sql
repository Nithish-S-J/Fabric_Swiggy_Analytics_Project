CREATE TABLE dim_customers
AS

SELECT
    customer_id,

    COUNT(order_id) AS total_orders,

    AVG(order_value_inr) AS avg_order_value,

    AVG(service_rating) AS avg_service_rating,

    COUNT(DISTINCT platform) AS platforms_used,

    CASE
        WHEN COUNT(order_id) >= 15 THEN 'Frequent'
        WHEN COUNT(order_id) >= 8 THEN 'Regular'
        ELSE 'Occasional'
    END AS customer_order_segment,

    CASE
        WHEN AVG(service_rating) >= 4 THEN 'Satisfied'
        ELSE 'Needs Attention'
    END AS customer_satisfaction_segment

FROM silver_orders

GROUP BY customer_id;
