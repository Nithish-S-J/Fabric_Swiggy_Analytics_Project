--Corporate Strategy wants to identify category dominance across competing apps (Swiggy vs Blinkit).
---This view calculates platform market share percentages and uses dense ranking to track item category performance.

CREATE OR ALTER VIEW dbo.view_marketplace_revenue_intelligence AS
WITH CategoryCoreMetrics AS (
    SELECT 
        fo.platform,
        fo.product_category,
        SUM(fo.order_value_inr) AS total_gross_revenue,
        COUNT(fo.order_id) AS total_order_volume,
        -- Global Window: Total revenue earned across the entire multi-app network
        SUM(SUM(fo.order_value_inr)) OVER() AS universal_network_revenue
    FROM dbo.fact_orders fo
    GROUP BY fo.platform, fo.product_category
)
SELECT 
    platform,
    product_category,
    total_gross_revenue,
    total_order_volume,
    -- Percentage of revenue this category captures inside its own hosting platform
    ROUND(total_gross_revenue / SUM(total_gross_revenue) OVER (PARTITION BY platform) * 100, 2) AS category_share_within_platform_pct,
    -- Percentage of revenue this category captures across the entire multi-app ecosystem
    ROUND(total_gross_revenue / universal_network_revenue * 100, 2) AS category_share_global_marketplace_pct,
    DENSE_RANK() OVER (PARTITION BY platform ORDER BY total_gross_revenue DESC) AS platform_revenue_rank
FROM CategoryCoreMetrics;
GO
