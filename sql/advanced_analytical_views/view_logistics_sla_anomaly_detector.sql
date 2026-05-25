--Problem Statement: Operations needs to know which delivery combinations (riders + vehicles + regions) fail our SLA promises
--The original view lacked geographic data; this version incorporates dim_location to surface localized transit friction.--



CREATE OR ALTER VIEW dbo.view_logistics_sla_anomaly_detector AS
WITH AggregatedLogistics AS (
    SELECT 
        fd.delivery_person_id,
        fd.vehicle_type,
        l.city,
        l.area,
        COUNT(fd.delivery_id) AS total_dispatched_trips,
        SUM(CASE WHEN fd.sla_breach_flag = 'Y' THEN 1 ELSE 0 END) AS total_sla_breaches,
        AVG(fd.delivery_time_minutes) AS rider_avg_delivery_time,
        -- Benchmark: What is the average time for this vehicle type across the entire city?
        AVG(AVG(fd.delivery_time_minutes)) OVER (PARTITION BY l.city, fd.vehicle_type) AS regional_fleet_vehicle_benchmark
    FROM dbo.fact_deliveries fd
    INNER JOIN dbo.dim_location l ON fd.location_id = l.location_id
    GROUP BY fd.delivery_person_id, fd.vehicle_type, l.city, l.area
)
SELECT 
    delivery_person_id,
    vehicle_type,
    city,
    area,
    total_dispatched_trips,
    total_sla_breaches,
    ROUND(CAST(total_sla_breaches AS DECIMAL(10,2)) / total_dispatched_trips * 100, 2) AS actual_sla_breach_rate_pct,
    rider_avg_delivery_time,
    ROUND(regional_fleet_vehicle_benchmark, 2) AS regional_fleet_vehicle_benchmark,
    -- Flagging operational outliers
    CASE 
        WHEN rider_avg_delivery_time > (regional_fleet_vehicle_benchmark + 12) THEN 'CRITICAL SPEED OUTLIER'
        WHEN CAST(total_sla_breaches AS DECIMAL(10,2)) / total_dispatched_trips > 0.30 THEN 'SYSTEMIC SLA FAILURE'
        ELSE 'OPTIMAL COURIER RUNTIME'
    END AS logistics_performance_tier
FROM AggregatedLogistics;
GO
