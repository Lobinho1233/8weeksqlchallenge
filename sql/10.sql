--Na primeira semana após a adesão ao programa (incluindo a data de adesão), 
--o cliente ganha o dobro de pontos em todos os itens, não apenas em sushi. 
--Quantos pontos os clientes A e B têm no final de janeiro?


SELECT t1.customer_id,
        SUM(CASE        
            WHEN julianday(order_date) - julianday(join_date) >= 0 AND 
            julianday(order_date) - julianday(join_date) <= 7 THEN 2 * t3.price * 10
            ELSE t3.price * 10
        END) AS total_pontos
FROM sales AS t1
INNER JOIN members AS t2
    ON t1.customer_id = t2.customer_id
LEFT JOIN menu AS t3
    ON t1.product_id = t3.product_id
WHERE order_date < '2021-02-01'
GROUP BY t1.customer_id

