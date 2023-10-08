-- D) топ-3 товаров по выручке и их доля в общей выручке за любой год 
-- найдем сумму продаж по каждому товару, например за 2023 год, отсортируем по убыванию
WITH item_top AS (
    SELECT
        EXTRACT(YEAR FROM purchase_date) AS years,
        purchases.itemid,
        SUM(price) AS total_sales
    FROM
        purchases 
        LEFT JOIN items ON purchases.itemid = items.itemid
    WHERE EXTRACT(YEAR FROM purchases.purchase_date) = 2023
    GROUP BY
        EXTRACT(YEAR FROM purchase_date),
        purchases.itemid
    ORDER BY
        total_sales DESC
),
-- посчитаем общую выручку продаж всех товаров за выбранный год
total AS (
    SELECT
        SUM(total_sales) AS all_total
    FROM item_top
)
--найдем долю товара от общей выручки и отберем топ 3 товара
SELECT
    it.itemid,
    it.total_sales,
    ROUND ((it.total_sales/total.all_total) :: numeric, 2) AS revenue
FROM
    item_top it,
    total
LIMIT 3;

