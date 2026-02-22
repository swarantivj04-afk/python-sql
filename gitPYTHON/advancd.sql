# 1    Calculate the moving average of order values for each customer over their order history.
SELECT o.customer_id, o.order_id, SUM(oi.price) AS order_value,
AVG(SUM(oi.price)) OVER (PARTITION BY o.customer_id ORDER BY o.order_purchase_timestamp ROWS 2 PRECEDING) AS moving_avg
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY o.customer_id,o.order_id,o.order_purchase_timestamp;
#2 Calculate the cumulative sales per month for each year
SELECT 
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS monthly_sales,
    SUM(SUM(oi.price)) OVER (
        PARTITION BY YEAR(o.order_purchase_timestamp)
        ORDER BY MONTH(o.order_purchase_timestamp)
    ) AS cumulative_sales
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_purchase_timestamp), MONTH(o.order_purchase_timestamp)
ORDER BY year, month;
#3 Calculate the year-over-year growth rate of total sales
SELECT 
    year,
    total_sales,
    LAG(total_sales) OVER (ORDER BY year) AS previous_year_sales,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY year)) * 100 
        / LAG(total_sales) OVER (ORDER BY year),
        2
    ) AS yoy_growth_percentage
FROM (
    SELECT 
        YEAR(o.order_purchase_timestamp) AS year,
        SUM(oi.price) AS total_sales
    FROM orders o
    JOIN order_items oi 
        ON o.order_id = oi.order_id
    GROUP BY YEAR(o.order_purchase_timestamp)
) t
ORDER BY year;
#4 Calculate the retention rate of customers, defined as the percentage of customers who make another purchase within 6 months of their first purchase.
SELECT 
    ROUND(
        COUNT(DISTINCT r.customer_id) * 100.0 /
        COUNT(DISTINCT f.customer_id),
        2
    ) AS retention_rate_percentage
FROM (
    SELECT 
        customer_id,
        MIN(order_purchase_timestamp) AS first_purchase_date
    FROM orders
    GROUP BY customer_id
) f
LEFT JOIN orders r
    ON f.customer_id = r.customer_id
    AND r.order_purchase_timestamp > f.first_purchase_date
    AND r.order_purchase_timestamp <= DATE_ADD(f.first_purchase_date, INTERVAL 6 MONTH);

#5. Identify the top 3 customers who spent the most money in each year.
SELECT *
FROM (
    SELECT 
        YEAR(o.order_purchase_timestamp) AS year,
        o.customer_id,
        SUM(oi.price) AS total_spent,
        RANK() OVER (
            PARTITION BY YEAR(o.order_purchase_timestamp)
            ORDER BY SUM(oi.price) DESC
        ) AS rank_in_year
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY YEAR(o.order_purchase_timestamp), o.customer_id
) t
WHERE rank_in_year <= 3
ORDER BY year, rank_in_year;
