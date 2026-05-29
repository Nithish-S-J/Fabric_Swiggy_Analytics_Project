DROP TABLE IF EXISTS dbo.dim_customers;
GO

CREATE TABLE dbo.dim_customers
(
    customer_id VARCHAR(50),
    total_orders INT,
    avg_order_value DECIMAL(10,2),
    avg_service_rating DECIMAL(10,2),
    customer_segment VARCHAR(50)
);
GO

INSERT INTO dbo.dim_customers

SELECT

    customer_id,

    COUNT(order_id) AS total_orders,

    AVG(order_value_inr) AS avg_order_value,

    AVG(service_rating) AS avg_service_rating,

    CASE
        WHEN COUNT(order_id) >= 20 THEN 'High Value'
        WHEN COUNT(order_id) >= 10 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM dbo.silver_orders

GROUP BY customer_id;
GO
