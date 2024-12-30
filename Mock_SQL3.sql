WITH CTE AS(
    SELECT o.order_date, o.item_id as 'it_id', o.seller_id, DENSE_RANK() OVER(PARTITION BY seller_id ORDER BY o.order_date) as 'rnk', u.favorite_brand, i.item_brand FROM Orders o
    LEFT JOIN Users u ON o.seller_id = u.user_id
    LEFT JOIN Items i ON i.item_id = o.item_id
)
SELECT seller_id, CASE(
    WHEN rnk = 2 AND c.item_brand = c.favorite_brand THEN 'yes'
    ELSE 'no'
    END
) as '2nd_iem_fav_brand' FROM CTE c Group BY seller_id


