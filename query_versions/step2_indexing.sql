

with avg_bike_price as (
	SELECT bike_model, AVG(price) as avg_price
	FROM bike_sales_data
	group by bike_model
),
recent_purchases as (
	SELECT customer_id, COUNT(*) as recent_purchases_count 
	FROM bike_sales_data 
	where sale_date > '2023-01-01'
	group by customer_id
),
avg_quantity as (
	SELECT bike_model, AVG(quantity) as average_quantity
	FROM bike_sales_data 
	group by bike_model
)
SELECT 
    b.customer_id,
    b.sale_date,
    b.bike_model,
    b.price,
    abp.avg_price,
    rp.recent_purchases_count,
    (b.price * b.quantity) AS total_sale_value
FROM 
    bike_sales_data b
    left join avg_bike_price abp on b.bike_model = abp.bike_model
    left join recent_purchases rp on b.customer_id = rp.customer_id
    left join avg_quantity aq on b.bike_model = aq.bike_model
WHERE
    b.price > abp.avg_price
    AND b.quantity > aq.average_quantity
ORDER BY 
    b.sale_date DESC, b.customer_id;

create index bike_model_index on bike_sales_data (bike_model);
create index sale_date_customer_id_index on bike_sales_data(sale_date, customer_id);

alter table bike_sales_data 
drop index bike_model_index;

alter table bike_sales_data 
drop index sale_date_customer_id_index;