CREATE TABLE Customers (
    customer_id               INTEGER PRIMARY KEY,
    age                       INTEGER,
    gender                    VARCHAR(20),
    item_purchased            VARCHAR(100),
    category                  VARCHAR(50),
    purchase_amount           NUMERIC(10, 2),
    location                  VARCHAR(100),
    size                      VARCHAR(10),
    color                     VARCHAR(50),
    season                    VARCHAR(20),
    review_rating             NUMERIC(3, 1),
    subscription_status       VARCHAR(10),
    shipping_type             VARCHAR(50),
    discount_applied          VARCHAR(10),
    previous_purchases        INTEGER,
    payment_method            VARCHAR(50),
    frequency_of_purchases    VARCHAR(50),
    age_group                 VARCHAR(50),
    purchase_frequency_days   NUMERIC(10, 1)
);


COPY Customers
FROM 'G:\.csv'
DELIMITER ','
CSV HEADER;

select * from Customers

--Total revenue generated male vs female customers

SELECT gender ,SUM( purchase_amount)  AS total_revenue
FROM Customers
GROUP BY gender

--Customers used a discount but still spent more than the group average purchases amount
SELECT customer_id, purchase_amount FROM Customers
WHERE purchase_amount >= (SELECT AVG(purchase_amount) FROM CustomerS) AND discount_applied = 'Yes'

--TOP 5 products with the highest average review rating
SELECT item_purchased AS product , ROUND(AVG(review_rating),2) AS review
FROM Customers
GROUP BY product
ORDER BY review DESC
LIMIT 5

--Comparing the average purchase Amounts between Standard and Express Shipping.
SELECT shipping_type,ROUND(AVG(purchase_amount),2) as Avg_purchase_amount
FROM Customers
WHERE shipping_type in ('Standard','Express')
GROUP BY shipping_type
ORDER BY Avg_purchase_amount DESC

--Do Subscribed Customers spend more? Compare average spend and total revenue between subcribers and non-subscribers.
SELECT subscription_status,
COUNT(customer_id) AS total_customers,
ROUND(AVG(purchase_amount),2) AS avg_spend,
ROUND(SUM(purchase_amount),2) AS total_revenue
FROM Customers
GROUP BY subscription_status
ORDER BY total_revenue,avg_spend DESC


--Which 5 products have the highest percentage of purchases with discounts applied?
SELECT item_purchased AS products,
ROUND(100*SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS discount_rate
FROM Customers
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5


--segmenting Customers into New,Returing, and loyal based on their total number of prevous and show the count of each segment.
WITH customer_type AS(
SELECT customer_id,previous_purchases,
CASE  
    WHEN previous_purchases =1 THEN 'New'
	WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returing'
	ELSE 'Loyal'
	END AS customer_segment
FROM Customers
)

SELECT 	customer_segment,COUNT(*) AS "Number of Customers"
FROM Customer_type
GROUP BY customer_segment

--What are the top 3 most purchased products within each category?
WITH item_counts AS(
SELECT category,
item_purchased,
COUNT(customer_id) AS total_orders,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY COUNT(customer_id)DESC) AS item_rank
FROM Customers
GROUP BY category, item_purchased
)

SELECT item_rank, category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <=3


--Are customers who are request buyers (more than 5 previous purchases) also likely to subscribe?
SELECT subscription_status,
COUNT(customer_id) AS repeat_buyers
FROM Customers
WHERE previous_purchases >5
GROUP BY subscription_status


--What is the revenue contribution of each age group?
SELECT age_group,
SUM(purchase_amount) AS total_revenue
FROM Customers
GROUP BY age_group
ORDER BY total_revenue DESC



















































































































































































































