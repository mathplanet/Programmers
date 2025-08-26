-- 코드를 입력하세요
SELECT a.PRODUCT_CODE
, (a.price*sum(b.sales_amount)) as SALES
FROM product a
JOIN offline_sale b on a.product_id = b.product_id
GROUP BY a. product_code
ORDER BY SALES desc, a.product_code asc;