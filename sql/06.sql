--Qual foi o primeiro item comprado pelo cliente após ele se tornar membro?

WITH tb_pedido AS (
    SELECT t1.customer_id,
            t1.product_id,
            t1.order_date,
            ROW_NUMBER() OVER (PARTITION BY t1.customer_id ORDER BY t1.order_date) AS rn
    FROM sales AS t1
    LEFT JOIN members AS t2
        ON t1.customer_id = t2.customer_id
    WHERE order_date > join_date
)
SELECT t1.customer_id,
        t2.product_name
FROM tb_pedido AS t1
LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id
WHERE t1.rn = 1