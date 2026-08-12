--Há quantos dias cada cliente visita o restaurante?


SELECT customer_id,
        COUNT(DISTINCT order_date) AS dias_distintos
FROM sales
GROUP BY customer_id
