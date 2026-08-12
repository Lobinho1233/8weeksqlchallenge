--Qual foi o item mais popular entre cada cliente?

WITH tb_pedido AS (
    SELECT t1.customer_id,
            t2.product_name,
            COUNT(*),
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS rn_pedido
    FROM sales AS t1
    LEFT JOIN menu AS t2
        ON t1.product_id = t2.product_id
    GROUP BY t1.customer_id,
            t2.product_name
)
SELECT customer_id,
        product_name
FROM tb_pedido
WHERE rn_pedido = 1