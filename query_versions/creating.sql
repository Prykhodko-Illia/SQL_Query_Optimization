create database a02;

use a02;

create table bike_sales_data (
	sale_id BIGINT primary key,
	sale_date DATE,
	customer_id INT,
	bike_model VARCHAR(50),
	price DECIMAL,
	quantity INT,
	store_location VARCHAR(50),
	salesperson_id INT,
	payment_method VARCHAR(50),
	customer_age INT,
	customer_gender VARCHAR(50)
);


select * from bike_sales_data
limit 500;

 