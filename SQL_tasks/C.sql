--В) какой товар обеспечивает дает наибольший вклад в выручку за последний год
-- подсчитаем сумму продаж (выручку) для каждого товара, по годам. 
--Отсортируем по годам в порядке убывания и по выручке в порядке убывания.
--Заберем первую строку, там находится id товара, год и выручка
SELECT
    purchases.itemid,
	EXTRACT (YEAR FROM purchase_date) AS years,
    SUM(items.price) AS item_price
FROM
    purchases
    LEFT JOIN items ON purchases.itemid = items.itemid
GROUP BY
        years,
        purchases.itemid	
ORDER BY years DESC, item_price DESC
LIMIT 1