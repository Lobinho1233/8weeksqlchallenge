

WITH tb_join AS (
    SELECT t1.customer_id,
            t1.order_date,
            t2.product_name,
            t2.price,
            CASE
                WHEN t3.join_date IS NULL THEN 'N'
                WHEN t1.order_date < t3.join_date THEN 'N'
                ELSE 'Y'
            END AS member
    FROM sales AS t1
    LEFT JOIN menu AS t2
        ON t1.product_id = t2.product_id
    LEFT JOIN members AS t3
        ON t1.customer_id = t3.customer_id
    ORDER BY t1.customer_id,
            t1.order_date
)
SELECT *,
        CASE 
             WHEN member = 'Y' THEN RANK() OVER (PARTITION BY customer_id, member ORDER BY order_date)
        END AS ranking
FROM tb_join