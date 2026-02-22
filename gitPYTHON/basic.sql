#Basic:
#Extract fundamental insights from dataset;
#1.	List all unique cities where customers are located=
SELECT DISTINCT customer_city
FROM customers
WHERE customer_city IS NOT NULL;
#2.	Count the number of orders placed in 2017=
SELECT COUNT(*) FROM orders WHERE YEAR (order_purchase_timestamp)=2017;
#3.	total sales per category =
SELECT  p.product_category AS category,
    SUM(oi.price) AS total_sales
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_sales DESC;
#4.	the percentage of orders that were paid in installments.= 
SELECT 
  ROUND(
        COUNT(DISTINCT CASE 
            WHEN payment_installments > 1 THEN order_id 
        END) * 100.0
        / COUNT(DISTINCT order_id),
        2
    ) AS installment_payment_percentage
FROM payments;

#5.	count no of customers from each state
SELECT 
    customer_state,
COUNT(*) AS customer_count
FROM customers
GROUP BY customer_state;
;
