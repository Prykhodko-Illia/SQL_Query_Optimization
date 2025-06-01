


explain 
SELECT
    customer_id,
    sale_date,
    bike_model,
    price,
    quantity,
    (SELECT AVG(price) FROM bike_sales_data WHERE bike_model = b.bike_model) AS avg_bike_price,
    (SELECT COUNT(*) FROM bike_sales_data WHERE customer_id = b.customer_id AND sale_date > '2023-01-01') AS recent_purchases,
    (price * quantity) AS total_sale_value
FROM 
    bike_sales_data b
WHERE
    price > (SELECT AVG(price) FROM bike_sales_data)
    AND quantity > (
        SELECT AVG(quantity) FROM bike_sales_data WHERE bike_model = b.bike_model
    )
ORDER BY 
    sale_date DESC, customer_id;

