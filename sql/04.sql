--Qual é o item mais pedido do cardápio e quantas vezes ele foi comprado por todos os clientes?


SELECT 
    product_name,
    COUNT(*) AS qtde
FROM sales AS t1
LEFT JOIN menu AS t2
    ON t1.product_id = t2.product_id
GROUP BY product_name
ORDER BY qtde DESC
