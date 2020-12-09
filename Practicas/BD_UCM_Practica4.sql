--consulta 1:

SELECT DISTINCT cust_last_name, account_mgr_id
FROM
    SELECT *
    FROM pr4_orders JOIN pr4_customer ON pr4_customers.customer_id = pr4_orders.customer_id
    WHERE orders_mode IS NOT NULL;
WHERE GROUP BY(pr4_customerEmployeees.cust_last_name,pr4_customerEmployees.account_mgr_id);




--consulta 2


SELECT CATEGORY_ID 
 FROM PR4_PRODUCT_INFORMATION
Where SUM()

-- consulta 3


SELECT pi.PRODUCT_NAME, SUM(OI.QUANTITY)
FROM (pr4_product_information AS pi) JOIN (pr4_order_items AS oi)
    ON pi.PRODUCT_ID = oi.PRODUCT_ID
WHERE o.ORDER_DATE between '010790' and '010191'
GROUP BY pi.product_name, oi.quantity;



-- consulta 



select distinct cust_last_name, last_name
from pr4_orders
join pr4_customers on pr4_orders.customer_id=pr4_customers.customer_id
join pr3_employees on pr4_orders.account_mgr_id=pr3_employees.employee_id
group by last_name, cust_last_name
order by last_name, cust_last_name