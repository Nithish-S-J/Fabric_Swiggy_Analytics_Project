CREATE TABLE dim_restaurants AS

SELECT

    restaurant_id,
    restaurant_name,
    city,
    area,
    cuisine_types,
    average_rating,
    restaurant_rating_category,
    total_ratings,
    price,
    cost_category,
    estimated_delivery_time_minutes

FROM silver_restaurants;
