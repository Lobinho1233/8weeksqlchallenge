--Qual foi o primeiro item do menu comprado por cada cliente?

WITH tb_pedido AS (
    SELECT t1.customer_id,
            t2.product_name,
            order_date,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn_pedido
    FROM sales AS t1
    LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id
)
SELECT *
FROM tb_pedido
WHERE rn_pedido = 1
