-- Qual o total de itens e o valor 
--gasto por cada membro antes de se tornar membro?


SELECT t1.customer_id,
        t2.product_name,
        SUM(t2.price) AS total_price
FROM sales AS t1
LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id
LEFT JOIN members AS t3
    ON t1.customer_id = t3.customer_id
WHERE t1.order_date <= t3.join_date
GROUP BY t1.customer_id, t2.product_name