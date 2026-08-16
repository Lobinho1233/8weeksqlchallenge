--Se cada dólar gasto equivale a 
--10 pontos e o sushi tem um multiplicador de pontos de 2x, 
--quantos pontos cada cliente teria?


SELECT customer_id,
        SUM(CASE
            WHEN t2.product_id = 1 THEN t2.price * 2 * 10 ELSE t2.price * 10
        END) AS total_pontos
FROM sales AS t1
LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id
GROUP BY customer_id
ORDER BY total_pontos DESC